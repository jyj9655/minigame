document.addEventListener('DOMContentLoaded', () => {
    const sentenceDisplay = document.getElementById('sentence');
    const userInput = document.getElementById('user-input');
    const startButton = document.getElementById('start-button');
    const resetButton = document.getElementById('reset-button');
    const timerDisplay = document.getElementById('timer');
    const cpmDisplay = document.getElementById('cpm');
    let startTime, interval;
    let gameActive = false;

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
        if (!gameActive) {
            gameActive = true;
            const countdownElement = document.getElementById('countdown');
            countdownElement.style.display = 'block';

            startCountdown(3, countdownElement, function() {
                displayRandomSentence();
                userInput.value = '';
                userInput.focus();
                startTimer();
                countdownElement.style.display = 'none';
                countdownElement.innerHTML = '';
            });
        }
    });

    // 게임 리셋
    resetButton.addEventListener('click', resetGame);

    // 게임 초기화
    function resetGame() {
        gameActive = false;
        clearInterval(interval);
        userInput.value = '';
        sentenceDisplay.textContent = '여기에 랜덤 문장이 표시됩니다.';
        timerDisplay.textContent = '0';
        cpmDisplay.textContent = '0';
        document.getElementById('finish-message').innerHTML = '';
        document.getElementById('nickname').style.display = 'none';
        document.getElementById('save-record').style.display = 'none';
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
        finishMessage.innerHTML = `종료! 소요시간: ${timeElapsed.toFixed(3)}초, 타자 속도: ${cpmDisplay.textContent} CPM`;
    
        userInput.disabled = true;
    
        // 게임 완료 시간 저장
        gameCompletedTime = timeElapsed.toFixed(1);
        document.getElementById('nickname').style.display = 'block';
        document.getElementById('save-record').style.display = 'block';
    }
});