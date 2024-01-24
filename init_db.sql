-- SQLite
CREATE TABLE game_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            url TEXT NOT NULL,
            description TEXT NOT NULL
        );

INSERT INTO game_info (id, name, url, description)
VALUES (
    '1',
    '행운의 룰렛',
    'roulette',
    '오늘 저녁은 뭐 먹지?'
);

INSERT INTO game_info (id, name, url, description)
VALUES (
    '2',
    '3x3 숫자 게임',
    'three',
    '1에서 9까지 숫자를 순서대로 빠르게 클릭하는 게임입니다.'
);

-- 타이핑 게임
INSERT INTO game_info (id, name, url, description)
VALUES (
    '3',
    '타이핑 게임',
    'typing',
    '화면에 나타나는 단어를 빠르고 정확하게 입력하는 게임입니다.'
);

-- 클릭 게임
INSERT INTO game_info (id, name, url, description)
VALUES (
    '4',
    '클릭 게임',
    'click',
    '20회를 빠르게 클릭하는 게임입니다.'
);

-- 메모리 게임
INSERT INTO game_info (id, name, url, description)
VALUES (
    '5',
    '메모리 게임',
    'memory',
    '뒤집힌 카드를 두 개씩 뒤집어 같은 이미지의 카드를 찾는 게임입니다.'
);

-- 스도쿠 게임
INSERT INTO game_info (id, name, url, description)
VALUES (
    '6',
    '스도쿠 게임',
    'sudoku',
    '1부터 9까지의 숫자를 겹치지 않게 채워 넣는 퍼즐 게임입니다.'
);