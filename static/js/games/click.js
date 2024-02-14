let clickCount = 0;
let gameActive = false;
let interval;
let gameCompletedTime;
let startTime;

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('start-button').addEventListener('click', startGame);
    document.getElementById('reset-button').addEventListener('click', resetGame);
});

function startGame() {
    if (!gameActive) {
        gameActive = true;
        // 카운트다운을 위한 엘리먼트를 가져옴
        const countdownElement = document.getElementById('countdown');
        // 카운트다운 보이기
        countdownElement.style.display = 'block';

        // 카운트다운 시작
        startCountdown(3, countdownElement, function() {
            startTime = Date.now();
            interval = setInterval(updateTimer, 100); // 타이머 시작

            // 원 생성 및 추가
            const board = document.getElementById('game-board');
            board.innerHTML = ''; // 기존 내용 클리어
            const circle = document.createElement('div');
            circle.id = 'click-circle';
            circle.className = 'click-circle';
            board.appendChild(circle);
    
            // 원 클릭 이벤트 추가
            circle.addEventListener('click', handleCircleClick);

            // 게임 시작 시 기록 저장 버튼 숨기기
            document.getElementById('save-record').style.display = 'none';
            // 게임 시작 시 닉네임 부분 숨기기
            document.getElementById('nickname').style.display = 'none';
            // 게임 시작 시 타이머 보이기
            document.getElementById('timer').style.display = 'block';
            // 카운트다운을 숨김
            countdownElement.style.display = 'none';
            countdownElement.innerHTML = '';
        });

        
    }
}

function handleCircleClick() {
    if (gameActive) {
        clickCount++;
        document.getElementById('click-count').textContent = `클릭 횟수: ${clickCount}`;

        if (clickCount >= 20) {
            gameActive = false; // 게임 활성 상태 비활성화
            clearInterval(interval);
            const endTime = Date.now();
            gameCompletedTime = (endTime - startTime) / 1000;
            document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;

            // 게임 완료 시 기록 저장 버튼 나타나기
            document.getElementById('save-record').style.display = 'block';
            // 게임 완료 시 닉네임 부분 나타나기
            document.getElementById('nickname').style.display = 'block';
            // 게임 완료 시 공유 부분 나타나기
            document.getElementById('share-container').style.display = 'block';
        }
    }
    
    const circle = document.getElementById('click-circle');
    circle.classList.add('clicked');

    setTimeout(function() {
        circle.classList.remove('clicked');
    }, 300); // 애니메이션 지속 시간과 일치
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    const board = document.getElementById('game-board');
    board.innerHTML = '';
    board.style.height = '200px';
    document.getElementById('click-count').textContent = '클릭 횟수: 0'; // 타이머 리셋
    document.getElementById('timer').textContent = '0'; // 타이머 리셋
    document.getElementById('timer').style.display = 'none'; // 타이머 숨기기
    document.getElementById('save-record').style.display = 'none'; // 기록 저장 버튼 숨기기
    document.getElementById('nickname').style.display = 'none'; // 닉네임 부분 숨기기
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}