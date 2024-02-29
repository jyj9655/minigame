from flask import Flask, flash, request, jsonify, render_template, g, redirect, send_from_directory, url_for
import sqlite3
import datetime
import os
import secrets

app = Flask(__name__)

DATABASE_FILE = 'minigame.db'

secret_key = secrets.token_hex(16)
app.secret_key = secret_key

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

@app.route('/sitemap.xml')
def sitemap():
    return send_from_directory(app.root_path, 'sitemap.xml', mimetype='application/xml')

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
    path = request.path
    if path.startswith('/games'):
        message = '미니 게임은 하루 최대 5번 저장이 가능합니다. (24:00 초기화)'
    elif path.startswith('/mbti'):
        message = '여러가지 테마의 MBTI 테스트를 경험하세요!'
    else:
        message = 'EXHILARATE: …의 기분을 들뜨게 하다, 기분을 좋게 하다'
    return {'games': games, 'communities': communities, 'mbtis': mbtis, 'custom_message': message}

####################################################################################################
## 1. [GAMES]
####################################################################################################
@app.route('/')
@app.route('/games')
def games():
    db = get_db()
    games = db.execute("SELECT id, name, image, url, menu, description FROM menu_info WHERE menu = 'game' ORDER BY id ASC").fetchall()
    Phrase = '미니게임 목록'
    return render_template('games.html', games=games, game_name=Phrase)

@app.route('/games/<game_name>')
def game(game_name):
    db = get_db()
    cur = db.cursor()

    # URL에서 받은 game_name을 사용하여 쿼리 실행
    cur.execute("SELECT id, name, url, description, state FROM menu_info WHERE url = ?", (game_name,))
    menu_info = cur.fetchone()

    if menu_info:
        menu_id, game_name, game_url, game_description, game_state = menu_info

        if game_state == 1:
            cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = ? ORDER BY time ASC", (menu_id,))
            records = cur.fetchall()

            ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

            return render_template(f'{game_url}.html', records=ranked_records, game_id=menu_id, game_name=game_name, game_description=game_description)
        
        elif game_state == 2:
            flash(f'해당 게임은 준비 중입니다.')
            return redirect(url_for('games'))
    else:
        flash('해당 게임 정보를 찾을 수 없습니다.')
        return redirect(url_for('games'))

####################################################################################################
## 2-0. [MBTI]
####################################################################################################
@app.route('/mbti')
def mbti_list():
    db = get_db()
    mbtis = db.execute("SELECT id, name, image, url, color, description FROM mbti_info").fetchall()
    Phrase = 'MBTI 테스트 목록'
    return render_template('mbti/list.html', mbtis=mbtis, mbti_name=Phrase)

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
            "SELECT mp.*, mi.name, mi.url"
            " FROM mbti_product AS mp"
            " JOIN mbti_info AS mi"
            " ON mp.mbti_info_id = mi.id"
            " WHERE mp.mbti_type = ? AND mp.mbti_info_id = ?",
            (mbti_type, mbti_info_id)
        ).fetchone()

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
## 3-1. [COMMUNITY]
####################################################################################################
@app.route('/community', methods=['GET'])
def community_default():
    return redirect(url_for('community', url='notice'))

@app.route('/community/<url>', methods=['GET'])
def community(url):
    db = get_db()
    
    menu_info = db.execute("SELECT * FROM menu_info WHERE menu = 'community' AND state = 1 ORDER BY id ASC").fetchall()

    if not menu_info:
        return "메뉴 정보를 가져올 수 없습니다.", 500

    page_info = db.execute("SELECT * FROM menu_info WHERE url = ? AND menu = 'community' AND state = 1", (url,)).fetchone()

    if page_info is None:
        return "페이지를 찾을 수 없습니다.", 404

    items = db.execute("SELECT * FROM board WHERE type = ? ORDER BY created_at DESC", (url,)).fetchall()

    return render_template('community/community.html', items=items, page_info=page_info, menu_info=menu_info)

####################################################################################################
## 4-1. [BLOG]
####################################################################################################
@app.route('/common/<url>', methods=['GET'])
def common(url):
    db = get_db()
    template_path = f'common/{url}.html'

    return render_template(template_path)

@app.route('/blog/<url>', methods=['GET'])
def blog(url):
    db = get_db()

    if url is None:
        return "BLOG 페이지를 찾을 수 없습니다.", 404

    return render_template('blog/blog.html')
    
if __name__ == '__main__':
    app.run(debug=True)