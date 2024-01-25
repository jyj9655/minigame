let tc = 21; // tile count (must be odd number)
let gs = 20; // grid size in pixels
let field; // map position array: 0 for wall, 1 for path
let playerPosition; // player's position on the maze
let canv, ctx; // canvas and context
let gameCompletedTime;
let interval;
let gameActive = false;
let startTime;

window.onload = function () {
    canv = document.getElementById("maze");
    ctx = canv.getContext("2d");
    document.getElementById('start-button').addEventListener('click', startGame);
    document.getElementById('reset-button').addEventListener('click', resetGame);
    document.addEventListener("keydown", keyPush);
}

window.addEventListener('resize', adjustCanvasSize);

function startGame() {
    if (!gameActive) {
        gameActive = true;
        const countdownElement = document.getElementById('countdown');
        countdownElement.style.display = 'block';

        startCountdown(3, countdownElement, function() {
            initializeMaze();
            document.getElementById('game-board').style.height = `${tc * gs}px`;
            startTime = Date.now();
            interval = setInterval(updateTimer, 100);
            document.getElementById('timer').style.display = 'block';
            document.getElementById('save-record').style.display = 'none';
            document.getElementById('nickname').style.display = 'none';
            countdownElement.style.display = 'none';
            countdownElement.innerHTML = '';
        });
    }
}

function updateTimer() {
    let currentTime = Date.now();
    let timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    if (ctx) {
        ctx.clearRect(0, 0, canv.width, canv.height);
    }
    document.getElementById('timer').textContent = '0';
    document.getElementById('timer').style.display = 'none';
    document.getElementById('save-record').style.display = 'none';
    document.getElementById('nickname').style.display = 'none';
}

function initializeMaze() {
    adjustCanvasSize();
    make2DArray();
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, canv.width, canv.height);
    playerPosition = { x: 1, y: 1 };
    drawMaze();
    placePlayer();
}

function adjustCanvasSize() {
    let gameBoardMaxWidth = parseInt(getComputedStyle(document.getElementById('game-board')).maxWidth, 10);
    
    let maxWidth = Math.min(window.innerWidth, gameBoardMaxWidth) - 30;
    let size = Math.floor(maxWidth / tc) * tc;

    canv.width = canv.height = size;
    gs = size / tc;
}

function make2DArray() {
    field = new Array(tc);
    for (let i = 0; i < tc; i++) {
        field[i] = new Array(tc).fill(0);
    }
    randomMazeGenerator();
}

function randomMazeGenerator() {
    stack = [];
    stack.push({ x: 1, y: 1 }); // 시작 위치에서 탐색 시작
    field[1][1] = 1; // 시작 위치 방문 표시

    while (stack.length > 0) {
        let current = stack[stack.length - 1];
        let directions = shuffle([0, 1, 2, 3]); // 무작위 방향으로 탐색
        let moved = false;

        for (let i = 0; i < directions.length; i++) {
            let dir = directions[i];
            let nx = current.x, ny = current.y;

            switch (dir) {
                case 0: nx -= 2; break; // 왼쪽
                case 1: ny -= 2; break; // 위
                case 2: nx += 2; break; // 오른쪽
                case 3: ny += 2; break; // 아래
            }

            if (nx > 0 && nx < tc - 1 && ny > 0 && ny < tc - 1 && field[ny][nx] === 0) {
                field[current.y + (ny - current.y) / 2][current.x + (nx - current.x) / 2] = 1; // 벽 제거
                field[ny][nx] = 1; // 새 위치 방문 표시
                stack.push({ x: nx, y: ny }); // 스택에 새 위치 추가
                moved = true;
                break;
            }
        }

        if (!moved) {
            stack.pop(); // 이동할 수 없으면 이전 위치로 되돌아감
        }
    }
}

// 배열을 무작위로 섞는 함수
function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

function placePlayer() {
    ctx.fillStyle = "red";
    ctx.fillRect(playerPosition.x * gs, playerPosition.y * gs, gs, gs);
}

function drawMaze() {
    for (let y = 0; y < tc; y++) {
        for (let x = 0; x < tc; x++) {
            if (x === tc - 2 && y === tc - 2) {
                // 도착 지점에 다른 색상 적용
                ctx.fillStyle = "green";
            } else {
                // 일반 셀은 벽이면 검은색, 경로면 흰색으로 채움
                ctx.fillStyle = field[y][x] === 0 ? "black" : "white";
            }
            ctx.fillRect(x * gs, y * gs, gs, gs);
        }
    }
}

function movePlayer(dx, dy) {
    if (!gameActive) return;

    let newX = playerPosition.x + dx;
    let newY = playerPosition.y + dy;

    if (newX >= 0 && newX < tc && newY >= 0 && newY < tc && field[newY][newX] === 1) {
        playerPosition.x = newX;
        playerPosition.y = newY;
        drawMaze();
        placePlayer();
        checkGameOver();
    }
}

function keyPush(evt) {
    switch (evt.keyCode) {
        case 37: // 왼쪽
        case 38: // 위
        case 39: // 오른쪽
        case 40: // 아래
            evt.preventDefault(); // 방향키에 대해서만 기본 동작을 방지
            movePlayer(evt.keyCode === 37 ? -1 : evt.keyCode === 39 ? 1 : 0, evt.keyCode === 38 ? -1 : evt.keyCode === 40 ? 1 : 0);
            break;
        default:
            break; // 다른 키에 대해서는 기본 동작을 방지하지 않음
    }
}

function checkGameOver() {
    // 출구에 도달했는지 확인
    if (playerPosition.x === tc - 2 && playerPosition.y === tc - 2) {
        gameActive = false;
        clearInterval(interval);
        const endTime = Date.now();
        gameCompletedTime = (endTime - startTime) / 1000;
        document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;
        
        alert("탈출에 성공하셨습니다.");

        document.getElementById('save-record').style.display = 'block';
        document.getElementById('nickname').style.display = 'block';
    }
}
