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
    '#AA9900',
    '나와 잘 맞는 사무용품은?'
);

-- animal
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '2',
    'animal',
    '/images/mbti/animal/animal.png',
    '동물 MBTI',
    '#BB9900',
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

-- sports
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '4',
    'sports',
    '/images/mbti/sports/sports.png',
    '스포츠 MBTI',
    '#DD9900',
    '나는 어떤 운동이 잘 맞을까?'
);

-- sports
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '4',
    'sports',
    '/images/mbti/sports/sports.webp',
    '스포츠 MBTI',
    '#EE9900',
    '나는 어떤 운동이 잘 맞을까?'
);

-- music
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '5',
    'music',
    '/images/mbti/music/music.webp',
    '음악 장르 MBTI',
    '#FF9900',
    '나는 어떤 음악이 잘 맞을까?'
); 

-- icecream
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '6',
    'icecream',
    '/images/mbti/icecream/icecream.webp',
    '아이스크림 MBTI',
    '#C0A9BD',
    '나를 아이스크림 맛으로 표현한다면?'
);

-- cheese
INSERT INTO mbti_info (id, url, image, name, color, description)
VALUES (
    '7',
    'cheese',
    '/images/mbti/cheese/cheese.webp',
    '치즈 MBTI',
    '#F1AF14',
    '나를 치즈로 표현한다면?'
);