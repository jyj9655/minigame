-- SQLite
CREATE TABLE mbti_product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_type VARCHAR(4) NOT NULL,
    product TEXT NOT NULL,
    image TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)
);

-- company
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(1, 'ISTJ', '가위', '/images/mbti/company/1.가위.png'),
(1, 'ISFJ', '볼펜', '/images/mbti/company/2.볼펜.png'),
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

-- animal
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
(2, 'ESFP', '햄스터', '/images/mbti/animal/14.햄스터.png'),
(2, 'ENFP', '원숭이', '/images/mbti/animal/15.원숭이.png'),
(2, 'ENTP', '앵무새', '/images/mbti/animal/16.앵무새.png');

-- cafe
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(3, 'INTJ', '아메리카노', '/images/mbti/cafe/americano.webp'),
(3, 'ENTJ', '에스프레소', '/images/mbti/cafe/espresso.webp'),
(3, 'INTP', '카페라떼', '/images/mbti/cafe/cafe_latte.webp'),
(3, 'ENTP', '카푸치노', '/images/mbti/cafe/cappuccino.webp'),
(3, 'INFJ', '바닐라 라떼', '/images/mbti/cafe/vanilla_latte.webp'),
(3, 'ENFJ', '카라멜 마키아토', '/images/mbti/cafe/caramel_macchiato.webp'),
(3, 'INFP', '허브티', '/images/mbti/cafe/herb_tea.webp'),
(3, 'ENFP', '과일 스무디', '/images/mbti/cafe/fruit_smoothie.webp'),
(3, 'ISTJ', '초콜릿 라떼', '/images/mbti/cafe/chocolate_latte.webp'),
(3, 'ESTJ', '카페모카', '/images/mbti/cafe/cafe_mocha.webp'),
(3, 'ISFJ', '그린티 라떼', '/images/mbti/cafe/green_tea_latte.webp'),
(3, 'ESFJ', '밀크티', '/images/mbti/cafe/milk_tea.webp'),
(3, 'ISTP', '블랙티', '/images/mbti/cafe/black_tea.webp'),
(3, 'ESTP', '레몬에이드', '/images/mbti/cafe/lemonade.webp'),
(3, 'ISFP', '딸기 프라푸치노', '/images/mbti/cafe/strawberry_frappuccino.webp'),
(3, 'ESFP', '아이스티', '/images/mbti/cafe/iced_tea.webp');

-- sports
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(4, 'INTJ', '체스', '/images/mbti/sports/chess.webp'),
(4, 'ENTJ', '농구', '/images/mbti/sports/basketball.webp'),
(4, 'INTP', '테니스', '/images/mbti/sports/tennis.webp'),
(4, 'ENTP', '축구', '/images/mbti/sports/soccer.webp'),
(4, 'INFJ', '요가', '/images/mbti/sports/yoga.webp'),
(4, 'ENFJ', '배구', '/images/mbti/sports/volleyball.webp'),
(4, 'INFP', '등산', '/images/mbti/sports/hiking.webp'),
(4, 'ENFP', '서핑', '/images/mbti/sports/surfing.webp'),
(4, 'ISTJ', '골프', '/images/mbti/sports/golf.webp'),
(4, 'ESTJ', '마라톤', '/images/mbti/sports/marathon.webp'),
(4, 'ISFJ', '볼링', '/images/mbti/sports/bowling.webp'),
(4, 'ESFJ', '에어로빅', '/images/mbti/sports/aerobics.webp'),
(4, 'ISTP', '스키', '/images/mbti/sports/ski.webp'),
(4, 'ESTP', '럭비', '/images/mbti/sports/rugby.webp'),
(4, 'ISFP', '배드민턴', '/images/mbti/sports/badminton.webp'),
(4, 'ESFP', '수영', '/images/mbti/sports/swimming.webp');

-- music
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(5, 'INTJ', '클래식', '/images/mbti/music/classical.webp'),
(5, 'ENTJ', '록', '/images/mbti/music/rock.webp'),
(5, 'INTP', '재즈', '/images/mbti/music/jazz.webp'),
(5, 'ENTP', '일렉트로닉', '/images/mbti/music/electronic.webp'),
(5, 'INFJ', '포크', '/images/mbti/music/folk.webp'),
(5, 'ENFJ', '소울', '/images/mbti/music/soul.webp'),
(5, 'INFP', '인디', '/images/mbti/music/indie.webp'),
(5, 'ENFP', '팝', '/images/mbti/music/pop.webp'),
(5, 'ISTJ', '컨트리', '/images/mbti/music/country.webp'),
(5, 'ESTJ', '메탈', '/images/mbti/music/metal.webp'),
(5, 'ISFJ', '뉴에이지', '/images/mbti/music/newage.webp'),
(5, 'ESFJ', 'R&B', '/images/mbti/music/rnb.webp'),
(5, 'ISTP', '블루스', '/images/mbti/music/blues.webp'),
(5, 'ESTP', '힙합', '/images/mbti/music/hiphop.webp'),
(5, 'ISFP', '레게', '/images/mbti/music/reggae.webp'),
(5, 'ESFP', '댄스', '/images/mbti/music/dance.webp');

-- icecream
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(6, 'INTJ', '다크 초코 아이스크림', '/images/mbti/icecream/dark_chocolate.webp'),
(6, 'ENTJ', '요거트 아이스크림', '/images/mbti/icecream/yogurt.webp'),
(6, 'INTP', '그린티 아이스크림', '/images/mbti/icecream/green_tea.webp'),
(6, 'ENTP', '멜론 아이스크림', '/images/mbti/icecream/melon.webp'),
(6, 'INFJ', '바닐라 아이스크림', '/images/mbti/icecream/vanilla.webp'),
(6, 'ENFJ', '딸기 아이스크림', '/images/mbti/icecream/strawberry.webp'),
(6, 'INFP', '민트 초코 아이스크림', '/images/mbti/icecream/mint_chocolate.webp'),
(6, 'ENFP', '쿠키 앤 크림 아이스크림', '/images/mbti/icecream/cookies_n_cream.webp'),
(6, 'ISTJ', '우유 아이스크림', '/images/mbti/icecream/milk.webp'),
(6, 'ESTJ', '초코 아이스크림', '/images/mbti/icecream/chocolate.webp'),
(6, 'ISFJ', '블루베리 아이스크림', '/images/mbti/icecream/blueberry.webp'),
(6, 'ESFJ', '체리 아이스크림', '/images/mbti/icecream/cherry.webp'),
(6, 'ISTP', '커피 아이스크림', '/images/mbti/icecream/coffee.webp'),
(6, 'ESTP', '망고 아이스크림', '/images/mbti/icecream/mango.webp'),
(6, 'ISFP', '라즈베리 아이스크림', '/images/mbti/icecream/raspberry.webp'),
(6, 'ESFP', '치즈 아이스크림', '/images/mbti/icecream/cheese.webp');

--cheese
INSERT INTO mbti_product (mbti_info_id, mbti_type, product, image) VALUES
(7, 'INTJ', '고르곤졸라 치즈', '/images/mbti/cheese/gorgonzola.webp'),
(7, 'ENTJ', '에멘탈 치즈', '/images/mbti/cheese/emmental.webp'),
(7, 'INTP', '블루 치즈', '/images/mbti/cheese/blue.webp'),
(7, 'ENTP', '할루미 치즈', '/images/mbti/cheese/halloumi.webp'),
(7, 'INFJ', '브리 치즈', '/images/mbti/cheese/brie.webp'),
(7, 'ENFJ', '그라나 파다노 치즈', '/images/mbti/cheese/grana_padano.webp'),
(7, 'INFP', '리코타 치즈', '/images/mbti/cheese/ricotta.webp'),
(7, 'ENFP', '구다 치즈', '/images/mbti/cheese/gouda.webp'),
(7, 'ISTJ', '체다 치즈', '/images/mbti/cheese/cheddar.webp'),
(7, 'ESTJ', '파르미지아노 레지아노 치즈', '/images/mbti/cheese/parmigiano_reggiano.webp'),
(7, 'ISFJ', '모짜렐라 치즈', '/images/mbti/cheese/mozzarella.webp'),
(7, 'ESFJ', '콜비 치즈', '/images/mbti/cheese/colby.webp'),
(7, 'ISTP', '프로볼로네 치즈', '/images/mbti/cheese/provolone.webp'),
(7, 'ESTP', '페퍼 잭 치즈', '/images/mbti/cheese/pepper_jack.webp'),
(7, 'ISFP', '카망베르 치즈', '/images/mbti/cheese/camembert.webp'),
(7, 'ESFP', '마스카포네 치즈', '/images/mbti/cheese/mascarpone.webp');