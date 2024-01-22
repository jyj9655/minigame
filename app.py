from flask import Flask, request, jsonify, render_template, g
import sqlite3
import datetime
import os

app = Flask(__name__)

DATABASE_FILE = 'minigame.db'

# SQLite 데이터베이스 파일이 없는 경우 생성
if not os.path.exists(DATABASE_FILE):
    conn = sqlite3.connect(DATABASE_FILE)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE game_records (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ip TEXT NOT NULL,
            gametype TEXT NOT NULL,
            nickname TEXT NOT NULL,
            time REAL NOT NULL,
            date TEXT NOT NULL
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

@app.route('/')
def index():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype='3x3' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('index.html', records=ranked_records)

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
## TYPING GAME
####################################################################################################
@app.route('/typing')
def typing():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 'typing' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('typing.html', records=ranked_records)

####################################################################################################
## ROULETTE
####################################################################################################
@app.route('/roulette')
def roulette():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 'typing' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('roulette.html', records=ranked_records)

####################################################################################################
## CLICK GAME
####################################################################################################
@app.route('/click')
def click():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 'click' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('click.html', records=ranked_records)

####################################################################################################
## MEMORY GAME
####################################################################################################
@app.route('/memory')
def memory():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 'memory' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('memory.html', records=ranked_records)

####################################################################################################
## SUDOKU GAME
####################################################################################################
@app.route('/sudoku')
def sudoku():
    db = get_db()
    cur = db.cursor()
    cur.execute("SELECT nickname, time, date FROM game_records WHERE gametype = 'sudoku' ORDER BY time ASC")
    records = cur.fetchall()

    # Calculate ranks in Python code
    ranked_records = [(index + 1, record['nickname'], record['time'], record['date']) for index, record in enumerate(records)]

    return render_template('sudoku.html', records=ranked_records)
if __name__ == '__main__':
    app.run(debug=True)