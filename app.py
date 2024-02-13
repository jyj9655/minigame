from flask import Flask, request, jsonify, render_template, g
import sqlite3
import datetime
import os

app = Flask(__name__)

DATABASE_FILE = 'minigame.db'

# NAVER_CLIENT_ID = os.getenv('NAVER_CLIENT_ID')
NAVER_CLIENT_ID = 'Ge8Ek1R6UqNoDZpInTjd'
# NAVER_CLIENT_SECRET = os.getenv('NAVER_CLIENT_SECRET')
NAVER_CLIENT_SECRET = 'lCWZATWk_N'
# SQLite 데이터베이스 파일이 없는 경우 생성
if not os.path.exists(DATABASE_FILE):
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    # menu_info 테이블 생성
    cursor.execute('''
        CREATE TABLE menu_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            menu TEXT NOT NULL,
            image TEXT NOT NULL,
            name TEXT NOT NULL,
            url TEXT NOT NULL,
            description TEXT NOT NULL
        )
    ''')
    # game_records 테이블 생성
    cursor.execute('''
        CREATE TABLE game_records (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ip TEXT NOT NULL,
            gametype INTEGER NOT NULL,
            nickname TEXT NOT NULL,
            time REAL NOT NULL,
            date TEXT NOT NULL,
            FOREIGN KEY (gametype) REFERENCES menu_info(id)
        )
    ''')
    conn.commit()
    conn.close()

def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(DATABASE_FILE)
        g.db.row_factory = sqlite3.Row
    return g.db

@app.teardown_appcontext
def close_db(exception):
    db = g.pop('db', None)
    if db is not None:
        db.close()

def init_db():
    db = get_db()
    with app.open_resource('schema.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()

@app.cli.command('init-db')
def init_db_command():
    """Clear existing data and create new tables."""
    init_db()
    print('Initialized the database.')

@app.route('/submit-record', methods=['POST'])
def submit_record():
    record = request.json
    user_ip = request.remote_addr  # 사용자 IP
    nickname = record['nickname']
    time = record['time']
    gametype = record['gametype']

    # 데이터베이스에 기록 저장
    response = save_to_database(user_ip, nickname, time, gametype)

    return jsonify(response)

def save_to_database(ip, nickname, time, gametype):
    db = get_db()
    cur = db.cursor()

    # 오늘 해당 IP 주소에서 저장된 기록의 수 확인
    today = datetime.date.today().isoformat()
    cur.execute("SELECT COUNT(*) FROM game_records WHERE ip = ? AND date = ? AND gametype = ?", (ip, today, gametype))
    count = cur.fetchone()[0]

    # 하루 최대 5번만 기록 저장 가능
    if count >= 5:
        return {"message": "오늘 횟수 초과입니다"}

    # 기록 저장
    cur.execute("INSERT INTO game_records (ip, nickname, time, date, gametype) VALUES (?, ?, ?, ?, ?)",
                (ip, nickname, time, today, gametype))
    db.commit()
    return {"message": "기록 저장 완료"}

@app.route('/clean', methods=['GET'])
def clear_records():
    db = get_db()
    cur = db.cursor()
    
    # game_records 테이블의 모든 데이터 삭제
    cur.execute("DELETE FROM game_records")
    db.commit()
    
    return jsonify({"message": "게임 기록이 모두 삭제되었습니다."})

####################################################################################################
## 0. MENU
####################################################################################################
@app.context_processor
def inject_menus():
    db = get_db()
    all_menus = db.execute("SELECT id, name, url, menu, description FROM menu_info ORDER BY id ASC").fetchall()
    mbti_menus = db.execute("SELECT id, name, url, image, color, description FROM mbti_info ORDER BY id ASC").fetchall()
    games = [item for item in all_menus if item['menu'] == 'game']
    communities = [item for item in all_menus if item['menu'] == 'community']
    mbtis = mbti_menus
    return {'games': games, 'communities': communities, 'mbtis': mbtis}

####################################################################################################
## 1-0. [GAME] LIST
####################################################################################################
@app.route('/')
@app.route('/games')
def games():
    db = get_db()
    games = db.execute("SELECT id, name, image, url, menu, description FROM menu_info WHERE menu = 'game' ORDER BY id ASC").fetchall()
    Phrase = 'EXHILARATE:'
    return render_template('games.html', games=games, game_name=Phrase, game_description=' …의 기분을 들뜨게 하다, 기분을 좋게 하다')
####################################################################################################
## 1-1. [GAME] ROULETTE
####################################################################################################
@app.route('/roulette')
def roulette():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 1")
    menu_info = cur.fetchone()
    
    return render_template('roulette.html', game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-2. [GAME] 3x3
####################################################################################################
@app.route('/three')
def three():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 2")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 2 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('three.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-3. [GAME] TYPING
####################################################################################################
@app.route('/typing')
def typing():
    db = get_db()
    cur = db.cursor()
    
    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 3")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 3 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('typing.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-4. [GAME] CLICK
####################################################################################################
@app.route('/click')
def click():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 4")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 4 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('click.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-5. [GAME] MEMORY
####################################################################################################
@app.route('/memory')
def memory():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 5")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 5 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('memory.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-6. [GAME] SUDOKU
####################################################################################################
@app.route('/sudoku')
def sudoku():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 6")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 6 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('sudoku.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-7. [GAME] MAZE
####################################################################################################
@app.route('/maze')
def maze():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 7")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 7 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('maze.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 1-8. [GAME] FIND
####################################################################################################
@app.route('/find')
def find():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 8")
    menu_info = cur.fetchone()

    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 8 ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('find.html', records=ranked_records, game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])


####################################################################################################
## 2-1. [COMMUNITY] FREE
####################################################################################################
@app.route('/free')
def free():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 8")
    menu_info = cur.fetchone()
    
    return render_template('free.html', game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 2-2. [COMMUNITY] NOTICE
####################################################################################################
@app.route('/notice')
def notice():
    db = get_db()
    cur = db.cursor()

    cur.execute("SELECT id, name, description FROM menu_info WHERE id = 9")
    menu_info = cur.fetchone()
    
    return render_template('notice.html', game_id=menu_info['id'], game_name=menu_info['name'], game_description=menu_info['description'])

####################################################################################################
## 3-0. [MBTI] LIST
####################################################################################################
@app.route('/mbti')
def mbti_list():
    db = get_db()
    mbtis = db.execute("SELECT id, name, image, url, color, description FROM mbti_info").fetchall()
    Phrase = 'EXHILARATE:'
    return render_template('mbti/list.html', mbtis=mbtis, mbti_name=Phrase, mbti_description=' …의 기분을 들뜨게 하다, 기분을 좋게 하다')

####################################################################################################
## 3-1. [MBTI]
####################################################################################################
@app.route('/mbti/<url>', methods=['GET'])
def mbti_page(url):
    db = get_db()
    mbti_info = db.execute("SELECT * FROM mbti_info WHERE url = ?", (url,)).fetchone()

    if mbti_info is None:
        return "MBTI 페이지를 찾을 수 없습니다.", 404

    questions_query = db.execute(
        "SELECT * FROM mbti_questions WHERE mbti_info_id = ? ORDER BY question_no",
        (mbti_info['id'],)
    ).fetchall()

    questions = [dict(question) for question in questions_query]

    return render_template('mbti/mbti.html', mbti_info=mbti_info, mbti_name=mbti_info['name'], questions=questions)
    
@app.route('/result', methods=['GET', 'POST'])
def mbti_result():
    if request.method == 'POST':
        db = get_db()
        data = request.get_json()
        mbti_type = data['mbti']
        mbti_info_id = data.get('mbti_id')

        product_info = db.execute(
            "SELECT * FROM mbti_product WHERE mbti_type = ? and mbti_info_id = ?",
            (mbti_type, mbti_info_id)
        ).fetchone()

        # JOIN을 사용하여 compatibility 정보와 관련된 product 정보를 가져옵니다.
        compatibility_info = db.execute(
            "SELECT mc.mbti_type, mc.compatible_type, mc.compatibility, mp.product, mp.image"
            " FROM mbti_compatibility mc"
            " JOIN mbti_product mp"
            " ON mc.compatible_type = mp.mbti_type"
            " WHERE mc.mbti_type = ?"
            " AND mp.mbti_info_id = ?"
            " AND mc.compatibility IN ('good', 'bad')",
            (mbti_type, mbti_info_id)
        ).fetchall()

        environment_info = db.execute(
            "SELECT * FROM mbti_environment WHERE mbti_type = ? and mbti_info_id = ?",
            (mbti_type, mbti_info_id)
        ).fetchall()
        
        return jsonify({
            "product_info": dict(product_info) if product_info else None,
            "compatibility_info": [dict(info) for info in compatibility_info],
            "environment_info": [dict(info) for info in environment_info]
        })
    else:
        return render_template('result.html')
    
####################################################################################################
## 4-1. [BLOG]
####################################################################################################
@app.route('/common/<url>', methods=['GET'])
def common(url):
    db = get_db()
    template_path = f'common/{url}.html'  # 동적으로 파일 경로 생성

    return render_template(template_path)

@app.route('/blog/<url>', methods=['GET'])
def blog(url):
    db = get_db()

    if url is None:
        return "BLOG 페이지를 찾을 수 없습니다.", 404

    return render_template('blog/blog.html')
    
if __name__ == '__main__':
    app.run(debug=True)