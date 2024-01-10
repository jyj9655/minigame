# 공식 Python 이미지를 베이스 이미지로 사용
FROM python:3.9

# 컨테이너 내에서 작업 디렉토리 설정
WORKDIR /app

# 컨테이너 내로 requirements.txt 파일 복사
COPY minigame/requirements.txt .

# requirements.txt에 지정된 Python 패키지 설치
RUN pip install -r requirements.txt

# 나머지 애플리케이션 코드를 컨테이너 내로 복사
COPY minigame/ .

# 플라스크 애플리케이션 실행 명령어 지정
CMD ["python", "app.py"]