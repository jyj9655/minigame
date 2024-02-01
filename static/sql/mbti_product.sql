-- SQLite
CREATE TABLE mbti_product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_type VARCHAR(4) NOT NULL,
    product TEXT NOT NULL,
    image TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)
);

INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ISTJ', '가위', '/images/mbti/company/1.가위.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ISFJ', '볼펜', '/images/mbti/company/2.볼펜.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'INFJ', '복사기', '/images/mbti/company/3.복사기.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'INTJ', '다이어리', '/images/mbti/company/4.다이어리.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ISTP', '계산기', '/images/mbti/company/5.계산기.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ISFP', '포스트잇', '/images/mbti/company/6.포스트잇.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'INFP', '스테이플러', '/images/mbti/company/7.스테이플러.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'INTP', '탁상시계', '/images/mbti/company/8.탁상시계.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ESTJ', '테이프', '/images/mbti/company/9.테이프.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ESFJ', '자', '/images/mbti/company/10.자.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ENFJ', '펀치', '/images/mbti/company/11.펀치.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ENTJ', '풀', '/images/mbti/company/12.풀.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ESTP', '테이프', '/images/mbti/company/13.테이프.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ESFP', 'USB', '/images/mbti/company/14.USB.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ENFP', '바인더', '/images/mbti/company/15.바인더.png');
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES (1, 'ENTP', '클립', '/images/mbti/company/16.클립.png');
