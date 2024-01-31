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
        const countdownElement = document.getElementById('countdown');
        // 카운트다운 보이기
        countdownElement.style.display = 'block';

        startCountdown(3, countdownElement, function() {
            startTime = Date.now();
            interval = setInterval(updateTimer, 100);
            
            const board = document.getElementById('game-board');
            board.innerHTML = '';
            createGameBoard(board);
            document.getElementById('save-record').style.display = 'none';
            document.getElementById('nickname').style.display = 'none';
            document.getElementById('timer').style.display = 'block'; // 타이머 보이기
            
            countdownElement.style.display = 'none';
            countdownElement.innerHTML = '';
        });
    }
}

function createGameBoard(board) {
    const totalCells = 100;
    let correctCellIndex = Math.floor(Math.random() * totalCells);

    for (let i = 0; i < totalCells; i++) {
        const cell = document.createElement('div');
        cell.className = 'game-cell';
        if (i === correctCellIndex) {
            cell.textContent = '제육';
            cell.addEventListener('click', handleCorrectCellClick);
        } else {
            cell.textContent = '체육';
        }
        board.appendChild(cell);
    }
   
    board.style.display = 'grid';
    board.style.gridTemplateColumns = 'repeat(10, 40px)';
    board.style.gridGap = '0px';
    board.style.gridAutoRows = '1fr';
    board.style.height = '500px';
}

function handleCorrectCellClick() {
    if (gameActive) {
        gameActive = false;
        clearInterval(interval);
        const endTime = Date.now();
        gameCompletedTime = (endTime - startTime) / 1000;
        document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;
        alert('제육을 찾았습니다.');
        document.getElementById('save-record').style.display = 'block';
        document.getElementById('nickname').style.display = 'block';
    }
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    const board = document.getElementById('game-board');
    board.innerHTML = '';
    board.style.height = '200px';
    document.getElementById('timer').textContent = '0';
    document.getElementById('timer').style.display = 'none';
    document.getElementById('save-record').style.display = 'none';
    document.getElementById('nickname').style.display = 'none';
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}