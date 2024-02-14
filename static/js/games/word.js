let gameActive = false;
let interval;
let gameCompletedTime;
let startTime;
let wordsFound = 0;

const words = ["다람쥐", "사람", "강아지"]; // 게임에 사용할 단어
// 자주 쓰이는 한글 글자 50개를 포함하는 배열
const letters = [
    "가", "나", "다", "라", "마", "바", "사", "아", "자", "차",
    "카", "타", "파", "하", "거", "너", "더", "러", "머", "버",
    "서", "어", "저", "처", "커", "터", "퍼", "허", "고", "노",
    "도", "로", "모", "보", "소", "오", "조", "초", "코", "토",
    "포", "호", "구", "누", "두", "루", "무", "부", "수", "우"
];

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('start-button').addEventListener('click', startGame);
    document.getElementById('reset-button').addEventListener('click', resetGame);
});

function startGame() {
    if (!gameActive) {
        gameActive = true;
        startTime = Date.now();
        interval = setInterval(updateTimer, 100);
        const board = document.getElementById('game-board');
        createGameBoard(board);
        document.getElementById('timer').style.display = 'block'; // 타이머 보이기
        wordsFound = 0;
    }
}

function createGameBoard(board) {
    board.innerHTML = ''; // 기존 게임 보드 초기화
    board.style.gridTemplateColumns = 'repeat(7, 1fr)'; // 7x7 그리드 설정
    const boardWidth = board.clientWidth; // 게임 보드의 너비
    const cellSize = Math.floor(boardWidth / 7); // 셀 크기 계산

    let grid = Array(49).fill('').map(() => letters[Math.floor(Math.random() * letters.length)]);

    // 단어 배치 로직
    words.forEach(word => {
        placeWord(word, grid, 7);
    });

    grid.forEach((letter, i) => {
        const cell = document.createElement('div');
        cell.className = 'game-cell';
        cell.style.height = `${cellSize}px`;
        cell.style.width = `${cellSize}px`;
        cell.textContent = letter;
        cell.addEventListener('click', () => handleCellClick(cell, letter));
        board.appendChild(cell);
    });
}

function placeWord(word, grid, size) {
    let placed = false;
    let attempts = 0;
    while (!placed && attempts < 100) {
        let direction = Math.random() < 0.5 ? 'horizontal' : 'vertical';
        let position = Math.floor(Math.random() * grid.length);
        let length = word.length; // 단어의 길이

        if (direction === 'horizontal') {
            let fitsInGrid = position % size + length <= size; // 단어가 그리드를 벗어나지 않는지 확인
            if (fitsInGrid && canPlaceWordAt(grid, word, position, direction, size)) {
                grid = placeWordInGrid(grid, word, position, direction, size);
                placed = true;
            } else {
                console.log("Failed to place horizontally:", word, position);
            }
        } else { // 'vertical'
            let fitsInGrid = Math.floor(position / size) + length <= size; // 단어가 그리드를 벗어나지 않는지 확인
            if (fitsInGrid && canPlaceWordAt(grid, word, position, direction, size)) {
                grid = placeWordInGrid(grid, word, position, direction, size);
                placed = true;
            } else {
                console.log("Failed to place vertically:", word, position);
            }
        }
        attempts++;
    }
    if (!placed) {
        console.error("Failed to place the word:", word);
    }
}


function placeWordInGrid(grid, word, position, direction, size) {
    let [row, col] = [Math.floor(position / size), position % size];
    let positions = []; // 사용된 위치를 추적하기 위한 배열
    for (let i = 0; i < word.length; i++) {
        let index = direction === 'horizontal' ? row * size + col + i : (row + i) * size + col;
        grid[index] = word[i];
        positions.push(index); // 사용된 위치 저장
    }
    // 중복된 위치를 제외하고 반환
    return grid.filter((_, index) => !positions.includes(index));
}


function canPlaceWordAt(grid, word, position, direction, size) {
    let [row, col] = [Math.floor(position / size), position % size];
    if (direction === 'horizontal') {
        if (col + word.length > size) return false; // 단어가 그리드를 벗어나지 않도록 함
        for (let i = 0; i < word.length; i++) {
            if (grid[row * size + col + i] !== '') return false; // 이미 다른 글자가 있는지 확인
        }
    } else { // 'vertical'
        if (row + word.length > size) return false;
        for (let i = 0; i < word.length; i++) {
            if (grid[(row + i) * size + col] !== '') return false;
        }
    }
    return true;
}

function handleCellClick(cell, letter) {
    if (gameActive && words.includes(letter)) {
        cell.classList.add('found');
        wordsFound++;
        checkGameCompletion();
    }
}

function checkGameCompletion() {
    if (wordsFound === words.length) {
        endGame();
    }
}

function endGame() {
    gameActive = false;
    clearInterval(interval);
    const endTime = Date.now();
    gameCompletedTime = (endTime - startTime) / 1000;
    document.getElementById('timer').textContent = `완료 시간: ${gameCompletedTime.toFixed(3)}초`;
    alert('모든 단어를 찾았습니다!');
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    const board = document.getElementById('game-board');
    board.innerHTML = '';
    document.getElementById('timer').textContent = '0';
    document.getElementById('timer').style.display = 'none';
    wordsFound = 0;
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}
