-- SQLite
CREATE TABLE mbti_product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_type VARCHAR(4) NOT NULL,
    product TEXT NOT NULL,
    image TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)
);

INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(1, 'ISTJ', '가위', '/images/mbti/company/1.가위.png'),
(1, 'ISFJ', '볼펜', '/images/mbti/company/2.볼펜.png')
(1, 'INFJ', '복사기', '/images/mbti/company/3.복사기.png'),
(1, 'INTJ', '다이어리', '/images/mbti/company/4.다이어리.png'),
(1, 'ISTP', '계산기', '/images/mbti/company/5.계산기.png'),
(1, 'ISFP', '포스트잇', '/images/mbti/company/6.포스트잇.png'),
(1, 'INFP', '스테이플러', '/images/mbti/company/7.스테이플러.png'),
(1, 'INTP', '탁상시계', '/images/mbti/company/8.탁상시계.png'),
(1, 'ESTJ', '테이프', '/images/mbti/company/9.테이프.png'),
(1, 'ESFJ', '자', '/images/mbti/company/10.자.png'),
(1, 'ENFJ', '펀치', '/images/mbti/company/11.펀치.png'),
(1, 'ENTJ', '풀', '/images/mbti/company/12.풀.png'),
(1, 'ESTP', '테이프', '/images/mbti/company/13.테이프.png'),
(1, 'ESFP', 'USB', '/images/mbti/company/14.USB.png'),
(1, 'ENFP', '바인더', '/images/mbti/company/15.바인더.png'),
(1, 'ENTP', '클립', '/images/mbti/company/16.클립.png');

INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES 
(2, 'ISTJ', '거북이', '/images/mbti/animal/1.거북이.png'),
(2, 'ISFJ', '고양이', '/images/mbti/animal/2.고양이.png'),
(2, 'INFJ', '사슴', '/images/mbti/animal/3.사슴.png'),
(2, 'INTJ', '늑대', '/images/mbti/animal/4.늑대.png'),
(2, 'ISTP', '호랑이', '/images/mbti/animal/5.호랑이.png'),
(2, 'ISFP', '토끼', '/images/mbti/animal/6.토끼.png'),
(2, 'INFP', '여우', '/images/mbti/animal/7.여우.png'),
(2, 'INTP', '올빼미', '/images/mbti/animal/8.올빼미.png'),
(2, 'ESTJ', '코끼리', '/images/mbti/animal/9.코끼리.png'),
(2, 'ESFJ', '강아지', '/images/mbti/animal/10.강아지.png'),
(2, 'ENFJ', '기린', '/images/mbti/animal/11.기린.png'),
(2, 'ENTJ', '사자', '/images/mbti/animal/12.사자.png'),
(2, 'ESTP', '치타', '/images/mbti/animal/13.치타.png'),
(2, 'ESFP', '돌고래', '/images/mbti/animal/14.돌고래.png'),
(2, 'ENFP', '원숭이', '/images/mbti/animal/15.원숭이.png'),
(2, 'ENTP', '앵무새', '/images/mbti/animal/16.앵무새.png');