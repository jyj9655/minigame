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
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '1',
    'company',
    '/images/mbti/company/company.png',
    '사무용품 MBTI',
    '#CC9900',
    '나와 잘 맞는 사무용품은?'
);

-- animal
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '2',
    'animal',
    '/images/mbti/animal/animal.png',
    '동물 MBTI',
    '#DD9900',
    '나는 어떤 동물일까?'
);

-- cafe
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '3',
    'cafe',
    '/images/mbti/cafe/cafe.png',
    '카페 MBTI',
    '#CC9900',
    '나는 어떤 카페가 잘 맞을까?'
);