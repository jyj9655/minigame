-- SQLite
CREATE TABLE mbti_compatibility (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mbti_type VARCHAR(4) NOT NULL,
    compatible_type VARCHAR(4) NOT NULL,
    compatibility VARCHAR(4) NOT NULL
);

--ISTJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'ESFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'ESTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTJ', 'ENFJ', 'bad');

-- ISFJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'ESFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'ESTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFJ', 'ENFJ', 'bad');

-- INFJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ENTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ENFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ISFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ESFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ISTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ESTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ISFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ESFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ISTJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFJ', 'ESTJ', 'bad');

-- INTJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INTJ', 'ENTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INTJ', 'ENFP', 'good');

-- ISTP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'ESFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'ESTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISTP', 'ENFJ', 'bad');

-- ISFP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'ENTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'ESFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'ESTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ISFP', 'INFJ', 'bad');

-- INFP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ENTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ENFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ISFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ESFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ISTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ESTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ISFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ESFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ISTJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INFP', 'ESTJ', 'bad');

-- INTP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INTP', 'ENTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('INTP', 'ESTJ', 'good');

-- ESTJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'ISFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'ISTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTJ', 'ENFJ', 'bad');

-- ESFJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'ISFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'ISTP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFJ', 'ENFJ', 'bad');

-- ENFJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'INFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ISFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ESFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ISTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ESTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ISFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ESFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ISTJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFJ', 'ESTJ', 'bad');

-- ENTJ
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENTJ', 'INFP', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENTJ', 'INTP', 'good');

-- ESTP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'ISFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'ISTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESTP', 'ENFJ', 'bad');

-- ESFP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'ISFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'ISTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'INFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'ENFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'INFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ESFP', 'ENFJ', 'bad');

-- ENFP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'INFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'INTJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ISFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ESFP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ISTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ESTP', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ISFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ESFJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ISTJ', 'bad');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENFP', 'ESTJ', 'bad');

-- ENTP
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENTP', 'INFJ', 'good');
INSERT INTO mbti_compatibility (mbti_type, compatible_type, compatibility) VALUES ('ENTP', 'INTJ', 'good');
