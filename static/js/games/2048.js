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
        const countdownElement = document.getElementById('timer');
        countdownElement.style.display = 'block';

        startCountdown(3, countdownElement, function() {
            startTime = Date.now();
            interval = setInterval(updateTimer, 100);
            
            const board = document.getElementById('game-board');
            board.innerHTML = '';
            createGameBoard(board);
            
            countdownElement.style.display = 'none';
        });
    }
}

function createGameBoard(board) {
    board.className = 'game-board-2048';
    for (let i = 0; i < 16; i++) {
        const cell = document.createElement('div');
        cell.className = 'cell';
        board.appendChild(cell);
    }
    // Initialize two tiles
    addRandomTile(board);
    addRandomTile(board);
}

function addRandomTile(board) {
    const emptyCells = board.querySelectorAll('.cell:not(.tile)');
    const randomCellIndex = Math.floor(Math.random() * emptyCells.length);
    const cell = emptyCells[randomCellIndex];
    const tile = document.createElement('div');
    tile.textContent = '2';
    tile.className = 'tile';
    cell.appendChild(tile);
    cell.classList.add('tile');
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    const board = document.getElementById('game-board');
    board.innerHTML = '';
    document.getElementById('timer').textContent = '0';
}

function startCountdown(seconds, element, callback) {
    let remaining = seconds;
    const countdown = setInterval(() => {
        element.textContent = remaining;
        if (remaining <= 0) {
            clearInterval(countdown);
            callback();
        }
        remaining--;
    }, 1000);
}

// Add event listeners for tile movement (e.g., using arrow keys)
// Implement the logic for moving and merging tiles
// Check for the 2048 tile to determine game completion

// Note: This script assumes basic styles and structures are defined in your CSS.
// You'll need to add handling for player actions (e.g., arrow key presses to move tiles)
// and implement the game logic for merging tiles and adding new ones after moves.
