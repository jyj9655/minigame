-- SQLite
CREATE TABLE mbti_environment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_info_id INTEGER NOT NULL,
    mbti_type VARCHAR(4) NOT NULL,
    environment TEXT NOT NULL,
    FOREIGN KEY (mbti_info_id) REFERENCES mbti_info(id)
);

-- ISTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '혼자 일할 시간이 많고, 독립적으로 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '뛰어난 집중력을 이용하여 임무를 완수하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '안정되고 전통적인 환경에서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '결과가 눈에 보이고 측정, 예측이 가능한 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '자신이 한 일로 평가받고 공헌이 인정되는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '자신의 현실적 판단과 경험을 높이 평하고 보상해 주는 환경에서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '스스로 목표를 세우고 추진할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTJ', '목표가 분명하고 조직의 체계가 명확한 일');

-- ISFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '다른 사람들을 실질적으로 도울 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '세심한 관찰력과 정확성이 요구되는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '뒤에서 일하면서 내 헌신과 공감을 표현할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '세심하고 조직적인 방식으로 매듭을 짓는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '한 번에 하나의 프로젝트를 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '사적인 공간이 있어서 주의에 방해 받지 않고 완전히 집중할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '개인의 가치관과 신념을 공유할 수 있는 사람들과 함께 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFJ', '사전에 준비할 시간이 충분한 일');

-- INFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '새로운 아이디어나 접근 방식을 찾아내서 사람과 함께 성장과 발전을 도울 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '업무 시간과 업무 환경을 스스로 조종할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '업무 과정에 큰 영향력을 행사할 수 있고 권한을 가지고 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '프로젝트를 실행할 때 충분한 시간적 여유가 주어진 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '공익적 일이나 봉사하는 일에 아이디어를 쓸 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '자신의 가치관과 신념과 조화를 이룰 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '자기 자신을 표현할 수이고 나타낼 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFJ', '친근하고 긴장감이 없는 환경에서 할 수 있는 일');

-- INTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTJ', '시스템을 혁신적이고 독창적으로 해결책을 개발해 내는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTJ', '주어진 보상이 논리적인 곳');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTJ', '전문성을 갖춘 동료와 함께 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTJ', '독창적으로 권한이 주어지는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTJ', '세세하고 반복적인 것을 요구하지 않는 일');

-- ISTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '자신의 기술을 활용할 수 있는 직업');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '목표의 방향성이 뚜렷한 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '독립적으로 할 수 있고 밖으로 자주 다니는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '다른 사람들을 철저히 감독할 필요가 없는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '즐길 수 있고 지속적인 자극이 필요한 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '쓸데없는 것에 에너지를 쏟지 않는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '혼자만의 시간을 가질 수 있는 시간적 여유가 많은 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISTP', '재미있고 활동적인 일');

-- ISFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '팀원들과 성실하고 좋은 분위기에서 사람들과 함께 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '세심하고 주의력이 필요한 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '예의 바르고 좋은 사람들과 함께 자율적으로 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '세심하고 주의력을 요하는 일, 헌신할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '밝고 협조적인 환경에서 조용히 할 수 있는 일. 갈등이 거의 없는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '실질적인 도움을 제공해서 재빨리 문제를 해결할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '대중 앞에 서지 않고 잘 모르는 집단을 지도하거나 낯선 사람을 만나지 않는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ISFP', '중요성과 가치를 인정할 수 있는 일');

-- INFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '규칙이나 규율이 엄격한 환경이 아닌 창조적이고 따뜻한 일을 만들어 내는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '자신의 가치관과 이상을 표현할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '시간적 여유가 있고 일에 있어서 직접 결정권을 가진 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '개인적인 성적에 대한 격려와 보상이 주어지는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '대중이나 사람들 앞에서 되도록이면 서지 않는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '엄격한 실적이나 성과와 마감이 없는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INFP', '사적인 공간과 남들의 방해를 적게 받는 공간에서 하는 일');

-- INTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTP', '아이디어를 개발하고, 분석하고, 비판하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTP', '복잡한 문제를 다룰 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTP', '개인 시간이 많고 독립적으로 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTP', '지나친 규칙과 회의가 없는 환경');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'INTP', '사람들을 직접 조직하거나 감독하지 않아도 되는 일');

-- ESTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '체계적으로 사실, 정책, 사람을 조직할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '논리적인 결과를 위해 시간과 자원을 효율적으로 사용할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '공정하고 논리적이며 분명하고 객관적인 기준으로 평가 받을 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '안정적이고 예측 가능한 상황에서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '동적이고 다양한 사람들과 함께 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '자기와 타인에 대해 책임을 지면서, 다른 사람과 함께할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '결정권이 있으며 권한과 책임이 많고 자신의 견해와 경험이 중요하게 생각되는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTJ', '현실적이고 구체적인 일');

-- ESFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '사람들에게 현실적 이득을 줄 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '많은 사람들과 함께 일하면서 권한을 행사할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '사람들이 공통의 목표를 향해 조화롭게 나아갈 수 있도록 돕는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '기대치가 분명하고 객관적인 기준에 따라 자신의 일을 평가 받을 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '스스로 결정할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '명령 계통이 분명하고 권위가 존중 받는 조직적인 환경에서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '의사 결정 과정에 주체적으로 참여할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFJ', '사람들에게 현실적 이득을 줄 수 있는 일');

-- ENFJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '동료 및 고객들과 따뜻하고 서로 도움이 되는 인간관계를 맺을 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '프로젝트의 문제점에 대해 창의적인 해결책을 제시할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '충분한 시간이 주어지고, 이에 대해 다른 사람들과 의견을 나눌 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '여러 가지 프로젝트를 한 번에 추진할 수 있는 활동적이고 자극적인 환경');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '자신의 조직 능력과 의사 결정 능력을 활용할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '다양한 활동이 인정되는 한편 비교적 정돈된 환경에서 계획적으로 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFJ', '사람들 간의 갈등과 긴장이 없는 환경에서 할 수 있는 일');

-- ENTJ 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '기획, 지도, 통솔할 수 있으며 다른 사람을 감독하고 관리하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '장기적 계획 수립과 창조적 문제 해결이 필요한 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '다양한 문제에 대해 혁신적이고 논리적인 해결책을 생각해 내는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '지적인 호기심을 자극하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '재미있고 유능하고 힘 있는 다양한 사람들과 만날 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '자신의 능력을 계발하고 발휘하며, 조직 내에서 발전 기회가 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTJ', '단계에 맞게 목표를 세우고 달성할 수 있는 일');

-- ESTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '돌발적인 상황에 대응할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '실질적이고 논리적인 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '이론이나 아이디어가 아니라 실제 사람과 사물을 대하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '많은 사람들과 자발적으로 만나서 교류할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '직접 경험과 분석을 통해서 문제를 해결할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '다른 사람의 기준보다 자신의 생각에 따라 활동할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '위기 상황과 위급한 문제를 적절히 처리할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESTP', '규칙, 규율, 제한이 많지 않은 일');

-- ESFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '현장에서 고객들을 직접 상대하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '활동적이고 사교적인 환경에서 많은 사람들과 일할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '미적 취향과 디자인 감각을 이용할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '조용하고 딱딱한 환경을 피하고 편안한 분위기에서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '정보를 수집해서 새로운 접근으로 문제를 해결할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '다른 사람들에게 동기 부여를 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '재밌고 색다르고 즐길 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ESFP', '새로운 사람과 환경에서 하는 일');

-- ENFP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '창의적으로 다양하고 자유로운 환경에서 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '자신의 업무가 실현되어 직접 볼 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '재미있고 도전적인 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '기존에 없는 새로운 아이디어, 상품, 서비스 조직을 만들어 내는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '수평적 분위기에서 여러 사람과 함께 진행하는 프로젝트를 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '창의력과 독창성을 인정해 주고 보상해 주는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENFP', '최소한의 규칙과 규율이 존재하는 일');

-- ENTP 환경
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '창조적이고 혁신적인 일을 만들어 내는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '재미, 행동, 흥분으로 가득 찬 다양한 상황을 경험할 수 있게 해주는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '다양한 사람들, 특히 존경하는 사람들과 만나 지속적으로 교류할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '짜여 있지 않은 환경에서 할 수 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '개인적 자유 외 시간적 여유가 있는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '논리적인 순서를 따라서 하는 일');
INSERT INTO mbti_environment (mbti_info_id, mbti_type, environment) VALUES (1, 'ENTP', '사람들과 깊은 관계를 맺으면서 에너지가 넘치는 환경에서 할 수 있는 일');
