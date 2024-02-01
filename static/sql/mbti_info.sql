-- SQLite
CREATE TABLE mbti_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    image TEXT NOT NULL,
    name TEXT NOT NULL,
    color TEXT NOT NULL,
    description TEXT NOT NULL
);

-- company
INSERT INTO mbti_info (url, image, name, color, description)
VALUES (
    'company',
    '/images/mbti/company.png',
    '사무용품 MBTI',
    '#CC9900',
    '나와 잘 맞는 사무용품은?'
);
