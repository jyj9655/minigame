let tc = 21; // tile count (must be odd number)
let gs = 20; // grid size in pixels
let field; // map position array: 0 for wall, 1 for path
let playerPosition; // player's position on the maze
let canv, ctx; // canvas and context
let gameStartTime;
let timerInterval;

window.onload = function() {
    canv = document.getElementById("game-board");
    ctx = canv.getContext("2d");
    document.getElementById('start-button').addEventListener('click', startGame);
    document.getElementById('reset-button').addEventListener('click', resetGame);
    document.addEventListener("keydown", keyPush);
}

function startGame() {
    initializeMaze();
    gameStartTime = Date.now();
    timerInterval = setInterval(updateGameTimer, 100);
    document.getElementById('timer').style.display = 'block';
}

function resetGame() {
    clearInterval(timerInterval);
    document.getElementById('timer').textContent = '0';
    document.getElementById('timer').style.display = 'none';
    startGame(); // Restart game immediately
}

function initializeMaze() {
    make2DArray();
    canv.width = canv.height = tc * gs;
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, canv.width, canv.height);
    playerPosition = { x: 1, y: 1 };
    drawMaze();
    placePlayer();
}

function make2DArray() {
    field = new Array(tc);
    for (let i = 0; i < tc; i++) {
        field[i] = new Array(tc).fill(0);
    }
    randomMazeGenerator();
}

function randomMazeGenerator() {
    // Initial step: Mark all cells as walls
    for (let y = 0; y < tc; y++) {
        for (let x = 0; x < tc; x++) {
            field[y][x] = 0;
        }
    }
    // Generate maze logic here
    // For simplicity, this example will not implement the full maze generation logic
    // But you can integrate the provided script's randomMazeGenerator logic here
}

function placePlayer() {
    ctx.fillStyle = "red";
    ctx.fillRect(playerPosition.x * gs, playerPosition.y * gs, gs, gs);
}

function drawMaze() {
    for (let y = 0; y < tc; y++) {
        for (let x = 0; x < tc; x++) {
            ctx.fillStyle = field[y][x] === 0 ? "black" : "white";
            ctx.fillRect(x * gs, y * gs, gs, gs);
        }
    }
}

function keyPush(evt) {
    switch(evt.keyCode) {
        case 37:
            playerPosition.x--;
            break;
        case 38:
            playerPosition.y--;
            break;
        case 39:
            playerPosition.x++;
            break;
        case 40:
            playerPosition.y++;
            break;
    }
    if (playerPosition.x < 0 || playerPosition.x >= tc || 
        playerPosition.y < 0 || playerPosition.y >= tc || 
        field[playerPosition.y][playerPosition.x] === 0) {
        // Undo move
        switch(evt.keyCode) {
            case 37: playerPosition.x++; break;
            case 38: playerPosition.y++; break;
            case 39: playerPosition.x--; break;
            case 40: playerPosition.y--; break;
        }
    }
    drawMaze();
    placePlayer();
}

function updateGameTimer() {
    let currentTime = Date.now();
    let timeElapsed = (currentTime - gameStartTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}
