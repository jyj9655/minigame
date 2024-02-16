-- SQLite
CREATE TABLE mbti_environment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_type VARCHAR(4) NOT NULL,
    environment TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)
);

-- ISTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ISTJ', '혼자 일할 시간이 많고, 독립적으로 하는 일'),
(1, 'ISTJ', '뛰어난 집중력을 이용하여 임무를 완수하는 일'),
(1, 'ISTJ', '안정되고 전통적인 환경에서 하는 일'),
(1, 'ISTJ', '결과가 눈에 보이고 측정, 예측이 가능한 일'),
(1, 'ISTJ', '자신이 한 일로 평가받고 공헌이 인정되는 일'),
(1, 'ISTJ', '자신의 현실적 판단과 경험을 높이 평하고 보상해 주는 환경에서 하는 일'),
(1, 'ISTJ', '스스로 목표를 세우고 추진할 수 있는 일'),
(1, 'ISTJ', '목표가 분명하고 조직의 체계가 명확한 일');

-- ISFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ISFJ', '다른 사람들을 실질적으로 도울 수 있는 일'),
(1, 'ISFJ', '세심한 관찰력과 정확성이 요구되는 일'),
(1, 'ISFJ', '뒤에서 일하면서 내 헌신과 공감을 표현할 수 있는 일'),
(1, 'ISFJ', '세심하고 조직적인 방식으로 매듭을 짓는 일'),
(1, 'ISFJ', '한 번에 하나의 프로젝트를 할 수 있는 일'),
(1, 'ISFJ', '사적인 공간이 있어서 주의에 방해 받지 않고 완전히 집중할 수 있는 일'),
(1, 'ISFJ', '개인의 가치관과 신념을 공유할 수 있는 사람들과 함께 하는 일'),
(1, 'ISFJ', '사전에 준비할 시간이 충분한 일');

-- INFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'INFJ', '새로운 아이디어나 접근 방식을 찾아내서 사람과 함께 성장과 발전을 도울 수 있는 일'),
(1, 'INFJ', '업무 시간과 업무 환경을 스스로 조종할 수 있는 일'),
(1, 'INFJ', '업무 과정에 큰 영향력을 행사할 수 있고 권한을 가지고 있는 일'),
(1, 'INFJ', '프로젝트를 실행할 때 충분한 시간적 여유가 주어진 일'),
(1, 'INFJ', '공익적 일이나 봉사하는 일에 아이디어를 쓸 수 있는 일'),
(1, 'INFJ', '자신의 가치관과 신념과 조화를 이룰 수 있는 일'),
(1, 'INFJ', '자기 자신을 표현할 수이고 나타낼 수 있는 일'),
(1, 'INFJ', '친근하고 긴장감이 없는 환경에서 할 수 있는 일');

-- INTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'INTJ', '시스템을 혁신적이고 독창적으로 해결책을 개발해 내는 일'),
(1, 'INTJ', '주어진 보상이 논리적인 곳'),
(1, 'INTJ', '전문성을 갖춘 동료와 함께 할 수 있는 일'),
(1, 'INTJ', '독창적으로 권한이 주어지는 일'),
(1, 'INTJ', '세세하고 반복적인 것을 요구하지 않는 일');

-- ISTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ISTP', '자신의 기술을 활용할 수 있는 직업'),
(1, 'ISTP', '목표의 방향성이 뚜렷한 일'),
(1, 'ISTP', '독립적으로 할 수 있고 밖으로 자주 다니는 일'),
(1, 'ISTP', '다른 사람들을 철저히 감독할 필요가 없는 일'),
(1, 'ISTP', '즐길 수 있고 지속적인 자극이 필요한 일'),
(1, 'ISTP', '쓸데없는 것에 에너지를 쏟지 않는 일'),
(1, 'ISTP', '혼자만의 시간을 가질 수 있는 시간적 여유가 많은 일'),
(1, 'ISTP', '재미있고 활동적인 일');

-- ISFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ISFP', '팀원들과 성실하고 좋은 분위기에서 사람들과 함께 하는 일'),
(1, 'ISFP', '세심하고 주의력이 필요한 일'),
(1, 'ISFP', '예의 바르고 좋은 사람들과 함께 자율적으로 할 수 있는 일'),
(1, 'ISFP', '세심하고 주의력을 요하는 일, 헌신할 수 있는 일'),
(1, 'ISFP', '밝고 협조적인 환경에서 조용히 할 수 있는 일. 갈등이 거의 없는 일'),
(1, 'ISFP', '실질적인 도움을 제공해서 재빨리 문제를 해결할 수 있는 일'),
(1, 'ISFP', '대중 앞에 서지 않고 잘 모르는 집단을 지도하거나 낯선 사람을 만나지 않는 일'),
(1, 'ISFP', '중요성과 가치를 인정할 수 있는 일');

-- INFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'INFP', '규칙이나 규율이 엄격한 환경이 아닌 창조적이고 따뜻한 일을 만들어 내는 일'),
(1, 'INFP', '자신의 가치관과 이상을 표현할 수 있는 일'),
(1, 'INFP', '시간적 여유가 있고 일에 있어서 직접 결정권을 가진 일'),
(1, 'INFP', '개인적인 성적에 대한 격려와 보상이 주어지는 일'),
(1, 'INFP', '대중이나 사람들 앞에서 되도록이면 서지 않는 일'),
(1, 'INFP', '엄격한 실적이나 성과와 마감이 없는 일'),
(1, 'INFP', '사적인 공간과 남들의 방해를 적게 받는 공간에서 하는 일');

-- INTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'INTP', '아이디어를 개발하고, 분석하고, 비판하는 일'),
(1, 'INTP', '복잡한 문제를 다룰 수 있는 일'),
(1, 'INTP', '개인 시간이 많고 독립적으로 할 수 있는 일'),
(1, 'INTP', '지나친 규칙과 회의가 없는 환경'),
(1, 'INTP', '사람들을 직접 조직하거나 감독하지 않아도 되는 일');

-- ESTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ESTJ', '체계적으로 사실, 정책, 사람을 조직할 수 있는 일'),
(1, 'ESTJ', '논리적인 결과를 위해 시간과 자원을 효율적으로 사용할 수 있는 일'),
(1, 'ESTJ', '공정하고 논리적이며 분명하고 객관적인 기준으로 평가 받을 수 있는 일'),
(1, 'ESTJ', '안정적이고 예측 가능한 상황에서 하는 일'),
(1, 'ESTJ', '동적이고 다양한 사람들과 함께 할 수 있는 일'),
(1, 'ESTJ', '자기와 타인에 대해 책임을 지면서, 다른 사람과 함께할 수 있는 일'),
(1, 'ESTJ', '결정권이 있으며 권한과 책임이 많고 자신의 견해와 경험이 중요하게 생각되는 일'),
(1, 'ESTJ', '현실적이고 구체적인 일');

-- ESFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ESFJ', '사람들에게 현실적 이득을 줄 수 있는 일'),
(1, 'ESFJ', '많은 사람들과 함께 일하면서 권한을 행사할 수 있는 일'),
(1, 'ESFJ', '사람들이 공통의 목표를 향해 조화롭게 나아갈 수 있도록 돕는 일'),
(1, 'ESFJ', '기대치가 분명하고 객관적인 기준에 따라 자신의 일을 평가 받을 수 있는 일'),
(1, 'ESFJ', '스스로 결정할 수 있는 일'),
(1, 'ESFJ', '명령 계통이 분명하고 권위가 존중 받는 조직적인 환경에서 하는 일'),
(1, 'ESFJ', '의사 결정 과정에 주체적으로 참여할 수 있는 일'),
(1, 'ESFJ', '사람들에게 현실적 이득을 줄 수 있는 일');

-- ENFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ENFJ', '동료 및 고객들과 따뜻하고 서로 도움이 되는 인간관계를 맺을 수 있는 일'),
(1, 'ENFJ', '프로젝트의 문제점에 대해 창의적인 해결책을 제시할 수 있는 일'),
(1, 'ENFJ', '충분한 시간이 주어지고, 이에 대해 다른 사람들과 의견을 나눌 수 있는 일'),
(1, 'ENFJ', '여러 가지 프로젝트를 한 번에 추진할 수 있는 활동적이고 자극적인 환경'),
(1, 'ENFJ', '자신의 조직 능력과 의사 결정 능력을 활용할 수 있는 일'),
(1, 'ENFJ', '다양한 활동이 인정되는 한편 비교적 정돈된 환경에서 계획적으로 할 수 있는 일'),
(1, 'ENFJ', '사람들 간의 갈등과 긴장이 없는 환경에서 할 수 있는 일');

-- ENTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ENTJ', '기획, 지도, 통솔할 수 있으며 다른 사람을 감독하고 관리하는 일'),
(1, 'ENTJ', '장기적 계획 수립과 창조적 문제 해결이 필요한 일'),
(1, 'ENTJ', '다양한 문제에 대해 혁신적이고 논리적인 해결책을 생각해 내는 일'),
(1, 'ENTJ', '지적인 호기심을 자극하는 일'),
(1, 'ENTJ', '재미있고 유능하고 힘 있는 다양한 사람들과 만날 수 있는 일'),
(1, 'ENTJ', '자신의 능력을 계발하고 발휘하며, 조직 내에서 발전 기회가 있는 일'),
(1, 'ENTJ', '단계에 맞게 목표를 세우고 달성할 수 있는 일');

-- ESTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ESTP', '돌발적인 상황에 대응할 수 있는 일'),
(1, 'ESTP', '실질적이고 논리적인 일'),
(1, 'ESTP', '이론이나 아이디어가 아니라 실제 사람과 사물을 대하는 일'),
(1, 'ESTP', '많은 사람들과 자발적으로 만나서 교류할 수 있는 일'),
(1, 'ESTP', '직접 경험과 분석을 통해서 문제를 해결할 수 있는 일'),
(1, 'ESTP', '다른 사람의 기준보다 자신의 생각에 따라 활동할 수 있는 일'),
(1, 'ESTP', '위기 상황과 위급한 문제를 적절히 처리할 수 있는 일'),
(1, 'ESTP', '규칙, 규율, 제한이 많지 않은 일');

-- ESFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ESFP', '현장에서 고객들을 직접 상대하는 일'),
(1, 'ESFP', '활동적이고 사교적인 환경에서 많은 사람들과 일할 수 있는 일'),
(1, 'ESFP', '미적 취향과 디자인 감각을 이용할 수 있는 일'),
(1, 'ESFP', '조용하고 딱딱한 환경을 피하고 편안한 분위기에서 하는 일'),
(1, 'ESFP', '정보를 수집해서 새로운 접근으로 문제를 해결할 수 있는 일'),
(1, 'ESFP', '다른 사람들에게 동기 부여를 할 수 있는 일'),
(1, 'ESFP', '재밌고 색다르고 즐길 수 있는 일'),
(1, 'ESFP', '새로운 사람과 환경에서 하는 일');

-- ENFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ENFP', '창의적으로 다양하고 자유로운 환경에서 할 수 있는 일'),
(1, 'ENFP', '자신의 업무가 실현되어 직접 볼 수 있는 일'),
(1, 'ENFP', '재미있고 도전적인 일'),
(1, 'ENFP', '기존에 없는 새로운 아이디어, 상품, 서비스 조직을 만들어 내는 일'),
(1, 'ENFP', '수평적 분위기에서 여러 사람과 함께 진행하는 프로젝트를 하는 일'),
(1, 'ENFP', '창의력과 독창성을 인정해 주고 보상해 주는 일'),
(1, 'ENFP', '최소한의 규칙과 규율이 존재하는 일');

-- ENTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(1, 'ENTP', '창조적이고 혁신적인 일을 만들어 내는 일'),
(1, 'ENTP', '재미, 행동, 흥분으로 가득 찬 다양한 상황을 경험할 수 있게 해주는 일'),
(1, 'ENTP', '다양한 사람들, 특히 존경하는 사람들과 만나 지속적으로 교류할 수 있는 일'),
(1, 'ENTP', '짜여 있지 않은 환경에서 할 수 있는 일'),
(1, 'ENTP', '개인적 자유 외 시간적 여유가 있는 일'),
(1, 'ENTP', '논리적인 순서를 따라서 하는 일'),
(1, 'ENTP', '사람들과 깊은 관계를 맺으면서 에너지가 넘치는 환경에서 할 수 있는 일');

-- ISTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ISTJ', '세부 사항에 주의를 기울이는 환경'),
(2, 'ISTJ', '규칙과 절차를 따르는 환경'),
(2, 'ISTJ', '신뢰성과 책임감을 중시하는 환경'),
(2, 'ISTJ', '독립적 작업이 가능한 환경'),
(2, 'ISTJ', '체계적인 접근이 요구되는 환경');

-- ISFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ISFJ', '인간관계가 중시되는 환경'),
(2, 'ISFJ', '안정성과 보안이 보장되는 환경'),
(2, 'ISFJ', '협력적이고 친근한 분위기'),
(2, 'ISFJ', '상호 존중이 바탕이 되는 환경'),
(2, 'ISFJ', '구체적인 지시와 가이드라인이 있는 환경');

-- INFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'INFJ', '개인의 성장을 도모하는 환경'),
(2, 'INFJ', '창의적 사고가 장려되는 환경'),
(2, 'INFJ', '사회적 가치를 창출하는 일'),
(2, 'INFJ', '비전과 목표가 명확한 환경'),
(2, 'INFJ', '개방적이고 수용적인 분위기');

-- INTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'INTJ', '혁신을 추구하는 환경'),
(2, 'INTJ', '독립적인 사고가 가능한 환경'),
(2, 'INTJ', '장기적인 목표를 설정할 수 있는 환경'),
(2, 'INTJ', '지식과 아이디어가 존중받는 환경'),
(2, 'INTJ', '효율성과 생산성이 중시되는 환경');

-- ISTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ISTP', '실용적인 문제 해결을 즐길 수 있는 환경'),
(2, 'ISTP', '자유롭고 유연한 작업 스타일'),
(2, 'ISTP', '즉시 결과를 볼 수 있는 작업'),
(2, 'ISTP', '단조로움을 피하고 다양한 활동이 있는 환경'),
(2, 'ISTP', '손으로 직접 만들거나 조작하는 일');

-- ISFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ISFP', '개인적인 표현이 자유로운 환경'),
(2, 'ISFP', '감정과 가치를 중시하는 분위기'),
(2, 'ISFP', '조화롭고 평화로운 근무 환경'),
(2, 'ISFP', '실제적인 도움을 줄 수 있는 일'),
(2, 'ISFP', '예술적 감각을 발휘할 수 있는 환경');

-- INFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'INFP', '이상과 가치를 추구할 수 있는 환경'),
(2, 'INFP', '창의적이고 개방적인 분위기'),
(2, 'INFP', '개인적 성장과 발전을 중시하는 환경'),
(2, 'INFP', '갈등과 경쟁이 적은 평화로운 환경'),
(2, 'INFP', '사회적인 의미가 있는 일');

-- INTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'INTP', '논리적이고 분석적인 문제를 해결할 수 있는 환경'),
(2, 'INTP', '이론적 탐구가 가능한 환경'),
(2, 'INTP', '지적 호기심을 충족시킬 수 있는 일'),
(2, 'INTP', '독립적인 사고와 자율성을 중시하는 환경'),
(2, 'INTP', '새로운 아이디어와 실험을 환영하는 환경');

-- ESTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ESTJ', '질서 정연하고 체계적인 환경'),
(2, 'ESTJ', '규칙과 절차가 명확한 조직'),
(2, 'ESTJ', '리더십을 발휘할 수 있는 기회'),
(2, 'ESTJ', '목표 달성과 성과를 중시하는 환경'),
(2, 'ESTJ', '실질적이고 구체적인 결과물을 요구하는 작업');

-- ESFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ESFJ', '인간 관계가 중요시되는 환경'),
(2, 'ESFJ', '팀워크와 협력을 강조하는 조직'),
(2, 'ESFJ', '안정성과 예측 가능성이 있는 일'),
(2, 'ESFJ', '감사와 인정을 받을 수 있는 환경'),
(2, 'ESFJ', '사회적인 활동과 커뮤니티 참여');

-- ENFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ENFJ', '사람들을 돕고 영감을 줄 수 있는 환경'),
(2, 'ENFJ', '긍정적이고 활기찬 분위기'),
(2, 'ENFJ', '개인과 팀의 성장을 도모하는 일'),
(2, 'ENFJ', '열린 소통과 피드백이 장려되는 환경'),
(2, 'ENFJ', '비전을 공유하고 목표를 향해 나아가는 조직');

-- ENTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ENTJ', '도전적이고 목표 지향적인 환경'),
(2, 'ENTJ', '혁신과 변화를 추구하는 조직'),
(2, 'ENTJ', '전략적 사고와 결정이 요구되는 일'),
(2, 'ENTJ', '효율성과 성과를 중시하는 환경'),
(2, 'ENTJ', '리더십과 관리 능력을 발휘할 수 있는 기회');

-- ESTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ESTP', '즉각적인 행동과 반응이 필요한 환경'),
(2, 'ESTP', '다양하고 자극적인 활동이 있는 곳'),
(2, 'ESTP', '자유롭고 유연한 근무 스타일'),
(2, 'ESTP', '실질적인 결과를 즉시 볼 수 있는 일'),
(2, 'ESTP', '위험을 감수하고 모험을 즐길 수 있는 환경');

-- ESFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ESFP', '사교적이고 활발한 분위기'),
(2, 'ESFP', '창의적이고 표현의 자유가 있는 환경'),
(2, 'ESFP', '즐거움과 엔터테인먼트가 중시되는 곳'),
(2, 'ESFP', '변화와 다양성을 추구하는 환경'),
(2, 'ESFP', '감정과 경험을 공유할 수 있는 일');

-- ENFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ENFP', '새롭고 창의적인 아이디어를 탐색할 수 있는 환경'),
(2, 'ENFP', '개방적이고 수용적인 분위기'),
(2, 'ENFP', '개인적 가치와 일치하는 목표를 가진 환경'),
(2, 'ENFP', '유연성과 자유로운 탐구가 가능한 곳'),
(2, 'ENFP', '다양한 사람들과 교류하며 영감을 주고받을 수 있는 환경');

-- ENTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(2, 'ENTP', '혁신적이고 비전 있는 환경'),
(2, 'ENTP', '지적인 토론과 논쟁이 활발한 곳'),
(2, 'ENTP', '새로운 아이디어와 접근법을 시도할 수 있는 공간'),
(2, 'ENTP', '다양한 관점과 사상을 탐구하는 일'),
(2, 'ENTP', '자유로운 사고와 실험을 장려하는 환경');

-- ISTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ISTJ', '규칙적인 방문객을 위한 멤버십 혜택이 있는 카페'),
(3, 'ISTJ', '실용적이고 편리한 시설을 갖춘 카페'),
(3, 'ISTJ', '정돈되고 깔끔한 환경, 집중하기 좋은 조용한 카페'),
(3, 'ISTJ', '전통적인 커피 문화를 존중하는 카페');

-- ISFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ISFJ', '친근감과 안락함을 주는 전통적인 디자인의 카페'),
(3, 'ISFJ', '장기적인 관계를 중시하는 단골 고객을 위한 카페'),
(3, 'ISFJ', '편안하고 친근감 있는 서비스, 따뜻한 분위기의 카페'),
(3, 'ISFJ', '세심한 서비스와 친절한 직원이 있는 카페');

-- INFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'INFJ', '깊은 사색과 명상을 할 수 있는 조용하고 평화로운 카페'),
(3, 'INFJ', '따뜻하고 포근한 인테리어, 의미 있는 대화를 나눌 수 있는 카페'),
(3, 'INFJ', '사회적 가치와 의미 있는 활동을 지원하는 카페'),
(3, 'INFJ', '영감을 주는 아트워크와 음악이 있는 카페');

-- INTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'INTJ', '조용하고 고즈넉한 분위기에서 혼자 생각에 잠길 수 있는 카페'),
(3, 'INTJ', '개인 작업실 같은 조용한 카페, 집중이 필요할 때 방문하기 좋음'),
(3, 'INTJ', '고전적이고 역사적인 분위기를 가진 카페, 고요함 속에서 영감을 얻을 수 있음'),
(3, 'INTJ', '효율적인 자기 관리와 계획을 세울 수 있는 조용하고 평화로운 카페');

-- ISTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ISTP', '다양한 기계와 도구를 직접 다룰 수 있는 테마 카페'),
(3, 'ISTP', '실용적인 취미와 관심사를 탐구할 수 있는 카페'),
(3, 'ISTP', '심플하고 미니멀리스트 스타일, 취미 생활을 즐길 수 있는 카페'),
(3, 'ISTP', '독립적이고 자유로운 분위기의 카페');

-- ISFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ISFP', '예술적 영감을 받을 수 있는 갤러리 같은 카페'),
(3, 'ISFP', '조용하고 개인적인 감정을 즐길 수 있는 아늑한 카페'),
(3, 'ISFP', '자연 친화적이고 아늑한, 창작 활동을 할 수 있는 카페'),
(3, 'ISFP', '자연과 가까운, 실외 좌석이 있는 카페');

-- INFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'INFP', '창작 활동과 개인 프로젝트를 위한 조용한 카페'),
(3, 'INFP', '자연 친화적이고 지속 가능한 운영을 하는 카페'),
(3, 'INFP', '예술적이고 개성 있는 디자인, 편안한 분위기의 카페'),
(3, 'INFP', '소소한 행복과 따뜻한 분위기를 느낄 수 있는 소규모 카페');

-- INTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'INTP', '다양한 지식을 탐색할 수 있는 책과 자료가 가득한 카페'),
(3, 'INTP', '논리적 사고와 창의력을 자극하는 디자인과 분위기의 카페'),
(3, 'INTP', '다양한 책과 보드게임이 있는 창의적인 분위기의 카페'),
(3, 'INTP', '혼자만의 시간을 즐길 수 있는 조용한 구석이 있는 카페');

-- ESTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ESTJ', '질서 정연하고 체계적인 운영이 돋보이는 카페'),
(3, 'ESTJ', '업무와 미팅에 적합한 조용한 분위기의 카페'),
(3, 'ESTJ', '실용적이고 기능적인 디자인, 업무를 처리하기 좋은 카페'),
(3, 'ESTJ', '효과적인 시간 관리와 업무 집중을 위한 카페');

-- ESFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ESFJ', '가족 단위의 방문객을 위한 편안하고 넓은 공간의 카페'),
(3, 'ESFJ', '커뮤니티 중심의 활동과 모임을 지원하는 카페'),
(3, 'ESFJ', '가족이나 친구와 함께 시간을 보내기 좋은, 활발한 분위기의 카페'),
(3, 'ESFJ', '소통과 교류를 촉진하는 따뜻한 분위기의 카페');

-- ENFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ENFJ', '커뮤니티 모임과 워크숍을 개최할 수 있는 공간이 있는 카페'),
(3, 'ENFJ', '긍정적이고 영감을 주는 메시지를 공유하는 카페'),
(3, 'ENFJ', '친구나 동료와 모임을 갖기 좋은 넓은 테이블이 있는 카페'),
(3, 'ENFJ', '다양한 문화와 예술을 경험할 수 있는 다목적 공간 카페');

-- ENTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ENTJ', '리더십 미팅이나 비즈니스 미팅을 위한 프라이빗 룸이 있는 카페'),
(3, 'ENTJ', '효율적인 작업과 미팅이 가능한 카페, 충분한 콘센트와 빠른 와이파이'),
(3, 'ENTJ', '목표 달성과 성과를 위한 논의가 활발히 이루어지는 카페'),
(3, 'ENTJ', '신속한 서비스와 효율적인 공간 활용이 돋보이는 카페');

-- ESTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ESTP', '다양한 액티비티와 게임을 즐길 수 있는 역동적인 카페'),
(3, 'ESTP', '실시간 스포츠 경기 중계를 보며 흥미를 공유할 수 있는 카페'),
(3, 'ESTP', '활동적이고 역동적인 분위기, 다양한 이벤트가 있는 카페'),
(3, 'ESTP', '모험과 새로운 경험을 추구하는 테마가 있는 카페');

-- ESFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ESFP', '라이브 음악과 공연이 있는 엔터테인먼트 카페'),
(3, 'ESFP', '트렌디하고 스타일리시한, 사진 찍기 좋은 인스타그램 핫플레이스 카페'),
(3, 'ESFP', '색다른 메뉴와 트렌디한 디자인이 돋보이는 카페'),
(3, 'ESFP', '친구들과 사진을 찍기 좋은 인스타그램에 어울리는 카페');

-- ENFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ENFP', '새롭고 재미있는 이벤트가 자주 있는 카페'),
(3, 'ENFP', '창의력과 상상력을 자극하는 유니크한 인테리어의 카페'),
(3, 'ENFP', '밝고 캐주얼한 분위기에서 자유롭게 느낄 수 있는 카페'),
(3, 'ENFP', '다양한 사람들과 만남과 대화를 즐길 수 있는 카페');

-- ENTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES 
(3, 'ENTP', '새로운 사람들과 아이디어를 교환할 수 있는 네트워킹 공간이 있는 카페'),
(3, 'ENTP', '사람들이 많고 활기찬, 새로운 아이디어를 얻을 수 있는 카페'),
(3, 'ENTP', '실험적이고 혁신적인 메뉴를 제공하는 카페'),
(3, 'ENTP', '자유롭고 개방적인 대화가 가능한 편안한 분위기의 카페');