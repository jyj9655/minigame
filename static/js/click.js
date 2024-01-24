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
        clickCount = 0;
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
    board.innerHTML = ''; // 게임 보드 클리어
    document.getElementById('timer').textContent = '0'; // 타이머 리셋
    document.getElementById('save-record').style.display = 'none'; // 기록 저장 버튼 숨기기
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}