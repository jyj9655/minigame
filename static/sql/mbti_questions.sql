-- SQLite
CREATE TABLE mbti_questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_code VARCHAR(2) NOT NULL,
    question_no INTEGER NOT NULL,
    question TEXT NOT NULL,
    answer_a_option TEXT NOT NULL,
    answer_b_option TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)  -- 외래 키 제약 조건 추가
);

-- company
INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option)
VALUES 
(1, 'SN', 1, '내일이면 첫 출근을 한다!', '별생각 없이 자고 출근한다.', '첫 출근인데 지각하면 어떡하지..? 회사랑 나랑 안맞으면 어떡하지..?'),
(1, 'EI', 2, '팀장님이 오늘 저녁 회식합시다~라고했을때', '오~완전좋아요~맛있는거 먹으러가요~', '(아... 갑자기...?집가서 쉬고싶은데,,,)'),
(1, 'TF', 3, '같이 밥먹던 동료가 머리가 아프다고 점심을 먹지 않는다고 한다', '뭐 잘못 먹은거 아니야? 약 먹으려면 조금이라도 먹어야할텐데?', '왜? 머리가 왜 아파? 많이 아픈거야?'),
(1, 'JP', 4, '프로젝트를 할때', '뭐부터 해야하는지 먼저 순서를 정하고 정한 순서대로 진행한다!', '자료 조사먼저 시작하자!'),
(1, 'SN', 5, '회사에서 일이 주어졌을 때', '할일을 구체적으로 지시해줘야 편하지!', '구체적인건 싫어!! 방향만 알려주고 나에게 맡겨주는게 편하지!'),
(1, 'EI', 6, '동료가 우리집 근처 볼 일이 있다고 같이 퇴근하자고 한다?', '좋아요~ 얘기하면서 같이가요~', '앗, 저는 약속이있어서요!다음에 같이가요~'),
(1, 'TF', 7, '회사에 늦었다...', '왜 늦었는지 늦은이유를 먼저 설명을 드린다...', '늦어서 죄송합니다 말한 후 그뒤에 이유를 설명한다 (이유를 먼저말하면 핑계같음)'),
(1, 'JP', 8, '내일이면 주말이다~ 데이트해야지~', '내일 1시에 만나서 어디서 밥먹고 3시에 공원산책하고 4시에 카페갔다가...등등..', '일어나는시간보고 밥먹고 영화보자~'),
(1, 'SN', 9, '1시간 뒤면 점심시간이다!!', '점심뭐먹을까? OOO 먹어야겠다!', '오늘은 뭐 먹지..? 파스타? 밥? 아 내일은 또 뭐 먹지?'),
(1, 'EI', 10, '회사에서 동호회를 가입하라고 한다', '동호회? 다들 어디 가입하세요??저도 같이해요~', '음..꼭 해야하나..영화보기?독서? 이런 동호회는 없나??'),
(1, 'TF', 11, '동료가 퇴사한다고 한다', '퇴사한다고? 퇴사후 계획은? 퇴직금은 나와?', '왜? 누구랑 안맞아? 회사랑 안맞아서? 뭐가 문제야?'),
(1, 'JP', 12, '어떤회사가 좋아?', '회사는 회사니까 체계적이어야해!', '딱딱한 회사는 별로야! 자유로운 회사가 최고지~');

-- animal
INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option) VALUES 
(2, 'SN', 1, '새로운 환경에 놓였을 때', '주변을 탐색하며 적응한다.', '먼저 생각하며 계획을 세운다.'),
(2, 'EI', 2, '친구들과의 모임', '활발하게 참여한다.', '상황을 지켜보며 조용히 참여한다.'),
(2, 'TF', 3, '문제에 직면했을 때', '논리적으로 해결 방안을 모색한다.', '감정에 기반하여 해결 방안을 고려한다.'),
(2, 'JP', 4, '일정 계획을 세울 때', '계획을 세우고 그대로 따른다.', '상황에 따라 유연하게 조정한다.'),
(2, 'SN', 5, '새로운 정보를 접할 때', '경험에 비추어 이해한다.', '직관적으로 이해한다.'),
(2, 'EI', 6, '혼자 있는 시간', '에너지를 충전하는 시간이다.', '다소 지루하게 느껴질 수 있다.'),
(2, 'TF', 7, '친구가 속상해 할 때', '해결책을 제시한다.', '공감하며 들어준다.'),
(2, 'JP', 8, '주말 계획이 틀어졌을 때', '계획 변경에 당황한다.', '순간을 즐기며 적응한다.'),
(2, 'SN', 9, '새로운 프로젝트를 시작할 때', '자세한 계획을 세운 후 진행한다.', '전체적인 그림을 보며 진행한다.'),
(2, 'EI', 10, '친구들과의 여행 계획을 세울 때', '활동적인 여행을 선호한다.', '휴식 위주의 여행을 선호한다.'),
(2, 'TF', 11, '중요한 결정을 내릴 때', '객관적 사실을 기반으로 결정한다.', '개인의 가치와 감정을 우선한다.'),
(2, 'JP', 12, '마감일이 다가올 때', '미리 준비하여 여유를 가진다.', '마감 시한에 맞춰 작업을 마친다.');

-- cafe
INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option) VALUES
(3, 'SN', 1, '새로운 카페를 방문할 때 중요하게 생각하는 것은?', '독특하고 새로운 메뉴', '편안하고 친숙한 메뉴'),
(3, 'EI', 2, '카페에 들어서면 가장 먼저 무엇을 하시나요?', '메뉴판을 보며 고민한다', '인기 메뉴나 추천 메뉴를 주문한다'),
(3, 'TF', 3, '친구가 추천하는 음료를 선택할 때 기준은?', '친구의 설명이 논리적일 때', '친구가 열정적으로 추천할 때'),
(3, 'JP', 4, '카페 방문 목적이 명확한가요?', '네, 보통 목적을 가지고 간다', '아니오, 기분에 따라 다름'),
(3, 'SN', 5, '음료를 선택하는 기준은?', '재료의 신선도와 건강함', '맛과 향의 조화'),
(3, 'EI', 6, '카페에서의 좋아하는 자리는 어디인가요?', '창가 근처의 조용한 자리', '사람들이 지나다니는 중앙의 자리'),
(3, 'TF', 7, '음료를 마시고 난 후의 행동은?', '맛과 품질을 분석하며 평가', '느낌과 경험에 초점을 맞추며 즐김'),
(3, 'JP', 8, '카페에서의 주문 방식은?', '항상 같은 메뉴를 주문', '그날의 기분에 따라 다른 메뉴를 시도'),
(3, 'SN', 9, '카페의 인테리어 스타일을 선택한다면?', '모던하고 스타일리시한', '레트로하고 클래식한'),
(3, 'EI', 10, '카페에서 시간을 보낼 때 선호하는 활동은?', '책 읽기나 노트북 작업', '친구들과 수다 떨기'),
(3, 'TF', 11, '카페 메뉴를 고를 때 중요시하는 것은?', '성분과 칼로리 정보', '메뉴의 창의성과 독창성'),
(3, 'JP', 12, '친구와 카페에서 만날 때 선호하는 방식은?', '미리 시간과 장소를 정해두고 만남', '당일 연락해서 갑자기 만남');

-- sports
INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option) VALUES
(4, 'EI', 1, '운동을 할 때 선호하는 스타일은?', '친구들과 함께 하는 팀 스포츠', '혼자서 집중할 수 있는 개인 운동'),
(4, 'SN', 2, '새로운 운동을 배울 때 중요한 것은?', '기본기와 기술을 단계적으로 배움', '즉각적인 피드백과 실전 적용'),
(4, 'TF', 3, '경기에서 이길 때 기분이 어떤가요?', '전략과 기술이 승리로 이끈 과정이 만족스러움', '팀워크와 상대방과의 경쟁을 즐김'),
(4, 'JP', 4, '운동 계획을 세울 때 어떻게 하나요?', '구체적인 목표와 계획을 세움', '그때그때 기분과 상황에 따라 결정'),
(4, 'EI', 5, '운동을 선택할 때 더 중요한 것은?', '에너지를 분출할 수 있는 활동', '내면의 평화를 찾을 수 있는 활동'),
(4, 'SN', 6, '운동을 할 때 선호하는 환경은?', '자연 속에서의 야외 활동', '실내에서의 조절된 환경'),
(4, 'TF', 7, '팀 스포츠를 할 때 중요하게 생각하는 것은?', '개인 기술과 성과', '팀워크와 동료애'),
(4, 'JP', 8, '새로운 운동을 시작할 때 어떤 접근을 선호하나요?', '철저한 계획과 준비', '즉흥적으로 도전'),
(4, 'EI', 9, '혼자 운동하는 것과 다른 사람과 운동하는 것 중 어떤 것을 더 선호하나요?', '혼자서 집중하는 것을 좋아함', '다른 사람과 함께하는 것이 더 동기 부여됨'),
(4, 'SN', 10, '운동을 통해 얻고 싶은 것은?', '체력 증진과 건강', '재미와 즐거움'),
(4, 'TF', 11, '패배했을 때의 반응은?', '패배 원인을 분석하고 개선점을 찾음', '경험을 통해 배우고 다음 기회에 임함'),
(4, 'JP', 12, '운동 스케줄을 세울 때 어떻게 하나요?', '정해진 시간과 계획을 따름', '그날의 기분과 상황에 맞춰 조정');

-- music
INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option) VALUES
(5, 'EI', 1, '음악을 들을 때 주로 어떤 환경을 선호하나요?', '혼자 조용히, 내면의 감정을 느끼며', '친구들과 함께, 분위기를 나누며'),
(5, 'SN', 2, '음악을 선택할 때 중요한 것은?', '가사의 의미와 메시지', '멜로디와 리듬'),
(5, 'TF', 3, '감정이 복잡할 때 어떤 음악을 듣나요?', '위로가 되는 가사가 있는 음악', '기분 전환할 수 있는 신나는 음악'),
(5, 'JP', 4, '새로운 음악을 탐색할 때 어떻게 하나요?', '추천받거나 리뷰를 찾아보며', '랜덤으로 재생하며 새로운 것을 발견'),
(5, 'SN', 5, '음악을 들을 때 가장 중요하게 생각하는 것은?', '음악의 분위기와 감성', '가사의 내용과 메시지'),
(5, 'TF', 6, '친구와 음악을 공유할 때 어떤 유형을 선호하나요?', '감정을 자극하는 음악', '사고를 자극하는 음악'),
(5, 'JP', 7, '음악을 선택하는 기준은 무엇인가요?', '계획적으로 선곡하는 편', '기분에 따라 임의로 선곡'),
(5, 'EI', 8, '활동적인 활동 중 음악 감상을 선호하나요?', '예, 활동적인 활동 중 음악을 듣는 것을 좋아함', '아니오, 조용히 앉아서 음악을 듣는 것을 선호함'),
(5, 'SN', 9, '새로운 음악을 발견하는 방법은?', '추천이나 리뷰를 통해', '랜덤 재생이나 탐색을 통해'),
(5, 'TF', 10, '음악 감상 시 가장 중시하는 요소는?', '멜로디와 하모니', '리듬과 비트'),
(5, 'JP', 11, '음악 감상의 목적은 무엇인가요?', '감정 이입과 위안', '분위기 조성과 에너지 충전'),
(5, 'EI', 12, '친구들과 음악을 듣는 장소를 선택한다면?', '집에서 편안하게', '음악 공연장이나 페스티벌에서');

INSERT INTO mbti_questions (mbti_info_id, mbti_code, question_no, question, answer_a_option, answer_b_option) VALUES
(6, 'EI', 1, '아이스크림을 먹을 때 선호하는 장소는?', '혼자 조용한 곳에서', '친구들과 북적이는 곳에서'),
(6, 'SN', 2, '아이스크림을 고를 때 중요한 것은?', '익숙하고 전통적인 맛', '새롭고 독특한 맛의 조합'),
(6, 'TF', 3, '어떤 아이스크림 토핑을 선호하나요?', '달콤한 과일이나 초콜릿', '짭짤한 너트나 캐러멜'),
(6, 'JP', 4, '아이스크림을 선택하는 방식은?', '미리 결정하고 가게로 감', '그때그때 기분에 따라 결정'),
(6, 'SN', 5, '아이스크림 맛을 선택하는 기준은?', '전통적이고 친숙한 맛', '새롭고 실험적인 맛'),
(6, 'TF', 6, '아이스크림을 먹을 때 중요한 것은?', '맛의 풍부함과 질감', '다양한 맛의 조화와 새로움'),
(6, 'JP', 7, '아이스크림을 먹는 시간은?', '특별한 날이나 보상으로', '기분이나 날씨에 따라 자주'),
(6, 'EI', 8, '아이스크림을 고를 때 누구와 함께하는 것을 선호하나요?', '혼자서 고르는 것을 선호', '친구나 가족과 함께 의견을 나누며'),
(6, 'SN', 9, '새로운 아이스크림 맛에 대한 태도는?', '신중하게 고른 후 시도', '즉각적으로 다양한 맛 시도'),
(6, 'TF', 10, '아이스크림을 먹는 목적은 무엇인가요?', '달콤함과 즐거움', '기분 전환과 새로운 맛 탐험'),
(6, 'JP', 11, '아이스크림을 저장하는 방법은?', '항상 같은 종류를 구비', '다양한 맛을 무작위로 구매'),
(6, 'EI', 12, '아이스크림을 먹는 장소 선호도는?', '조용한 개인 공간', '사람들이 많은 공공 장소');