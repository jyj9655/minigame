document.addEventListener('DOMContentLoaded', () => {
    const sentenceDisplay = document.getElementById('sentence');
    const userInput = document.getElementById('user-input');
    const startButton = document.getElementById('start-button');
    const resetButton = document.getElementById('reset-button');
    const timerDisplay = document.getElementById('timer');
    const cpmDisplay = document.getElementById('cpm');
    let startTime, interval;

    function generateRandomKoreanSentence() {
        const words = [
            "사과", "행복", "공원", "인생", "여행",
            "책상", "음악", "축구", "미래", "휴식",
            "사랑", "휴가", "바다", "산", "강아지"
        ];
        const sentenceLength = Math.floor(Math.random() * 5) + 3; // 3에서 7개 단어로 문장을 생성
        let sentence = "";
        for (let i = 0; i < sentenceLength; i++) {
            sentence += words[Math.floor(Math.random() * words.length)] + " ";
        }
        return sentence.trim();
    }

    function displayRandomSentence() {
        sentenceDisplay.textContent = generateRandomKoreanSentence();
    }

    // 타이머 시작 및 업데이트
    function startTimer() {
        startTime = new Date();
        interval = setInterval(() => {
            const currentTime = new Date();
            const timeElapsed = (currentTime - startTime) / 1000;
            timerDisplay.textContent = timeElapsed.toFixed(1);
            updateCPM();
        }, 100);
    }

    // CPM 업데이트
    function updateCPM() {
        const currentTime = new Date();
        const timeElapsed = (currentTime - startTime) / 1000;
        const cpm = (userInput.value.length / timeElapsed) * 60;
        cpmDisplay.textContent = Math.round(cpm);
    }

    // 게임 시작
    startButton.addEventListener('click', () => {
        displayRandomSentence();
        userInput.value = '';
        userInput.focus();
        startTimer();
    });

    // 게임 리셋
    resetButton.addEventListener('click', resetGame);

    // 게임 초기화
    function resetGame() {
        clearInterval(interval);
        userInput.value = '';
        sentenceDisplay.textContent = '여기에 랜덤 문장이 표시됩니다.';
        timerDisplay.textContent = '0';
        cpmDisplay.textContent = '0';

        userInput.disabled = false;
    }

    // 사용자 입력 확인 및 처리
    userInput.addEventListener('input', () => {
        const inputValue = userInput.value;
        const sentence = sentenceDisplay.textContent;
        let correct = true;

        // 입력값과 문장 비교
        for (let i = 0; i < inputValue.length; i++) {
            if (inputValue[i] !== sentence[i]) {
                correct = false;
                break;
            }
        }

        // 오류 시 글자 색상 변경
        userInput.style.color = correct ? 'black' : 'red';

        // 문장이 완성되었을 때 결과 표시
        if (inputValue === sentence) {
            finishGame();
        }
    });

    function finishGame() {
        clearInterval(interval);
        const finishMessage = document.getElementById('finish-message');
        const currentTime = new Date();
        const timeElapsed = (currentTime - startTime) / 1000;
        finishMessage.innerHTML = `종료! 소요시간: ${timeElapsed.toFixed(1)}초, 타자 속도: ${cpmDisplay.textContent} CPM`;
    
        userInput.disabled = true;
    
        // 게임 완료 시간 저장
        gameCompletedTime = timeElapsed.toFixed(1);

        document.getElementById('save-record').style.display = 'block';
    }
});

document.getElementById('save-record').addEventListener('click', function() {
    const nickname = document.getElementById('nickname').value;
    
    if (typeof gameCompletedTime === 'undefined') {
      alert("게임을 먼저 완료해주세요.");
      return;
    }
  
    // 서버로 데이터 전송
    fetch('/submit-record', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ nickname: nickname, time: gameCompletedTime, gametype: 3 }),
    })
    .then(response => response.json())
    .then(data => {
        // alert 메시지 표시
        alert(data.message);
  
        // 수동으로 페이지 새로고침
        location.reload();
    })
    .catch(error => console.error('Error:', error));
});