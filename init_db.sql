-- SQLite
CREATE TABLE menu_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            menu TEXT NOT NULL,
            image TEXT NOT NULL,
            name TEXT NOT NULL,
            url TEXT NOT NULL,
            description TEXT NOT NULL
        );

-- 룰렛
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '1',
    'game',
    '/images/games/roulette.png',
    '행운의 룰렛',
    'roulette',
    '오늘 저녁은 뭐 먹지?'
);

-- 3x3 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '2',
    'game',
    '/images/games/three.png',
    '3x3 게임',
    'three',
    '1에서 9까지 숫자를 순서대로 빠르게 클릭하는 게임입니다.'
);

-- 타이핑 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '3',
    'game',
    '/images/games/typing.png',
    '타이핑 게임',
    'typing',
    '화면에 나타나는 단어를 빠르고 정확하게 입력하는 게임입니다.'
);

-- 클릭 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '4',
    'game',
    '/images/games/click.png',
    '클릭 게임',
    'click',
    '20회를 빠르게 클릭하는 게임입니다.'
);

-- 메모리 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '5',
    'game',
    '/images/games/memory.png',
    '메모리 게임',
    'memory',
    '뒤집힌 카드를 두 개씩 뒤집어 같은 이미지의 카드를 찾는 게임입니다.'
);

-- 스도쿠 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '6',
    'game',
    '/images/games/sudoku.png',
    '스도쿠 게임',
    'sudoku',
    '1부터 9까지의 숫자를 겹치지 않게 채워 넣는 퍼즐 게임입니다.'
);

-- 미로 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '7',
    'game',
    '/images/games/maze.png',
    '미로 게임',
    'maze',
    '최단 시간 안에 미로를 탈출하는 게임입니다.'
);

-- 미로 게임
INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '8',
    'game',
    '/images/games/find.png',
    '제육 게임',
    'find',
    '99개의 체육 속에서 1개의 제육을 찾는 게임입니다.'
);

INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '9',
    'community',
    '/images/communities/free.png',
    '자유 게시판',
    'free',
    '자유롭게 소통하고, 생각을 공유하는 공간입니다.'
);

INSERT INTO menu_info (id, menu, image, name, url, description)
VALUES (
    '10',
    'community',
    '/images/communities/notice.png',
    '공지사항',
    'notice',
    '중요한 소식과 업데이트를 확인하는 공간입니다.'
);