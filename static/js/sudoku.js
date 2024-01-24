document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('start-button').addEventListener('click', startGame);
    document.getElementById('reset-button').addEventListener('click', resetGame);
    document.getElementById('save-record').addEventListener('click', saveRecord);

    // 숫자 선택기에 대한 클릭 이벤트 리스너 설정
    document.querySelectorAll('#number-selector button').forEach(button => {
        button.addEventListener('click', function() {
            if (window.selectedInput) {
                window.selectedInput.value = this.getAttribute('data-number');
                window.selectedInput.dispatchEvent(new Event('input')); // Trigger the input event
                document.getElementById('number-selector').style.display = 'none'; // 숫자 선택 후 선택기 숨김
                handleInput(); // 입력 처리 함수 호출
            }
        });
    });

    // 외부 클릭 시 숫자 선택기 숨김 처리
    window.addEventListener('click', function(e) {
        const numberSelector = document.getElementById('number-selector');
        if (!numberSelector.contains(e.target) && (!window.selectedInput || !window.selectedInput.contains(e.target))) {
            numberSelector.style.display = 'none';
        }
    }, true);
});

let gameActive = false;
let interval;
let gameCompletedTime;
let selectedInput; // 현재 선택된 입력 필드를 저장하는 전역 변수

function startGame() {
    if (!gameActive) {
        gameActive = true;
        const difficulty = document.getElementById('difficulty').value;
        let blanks;
        switch (difficulty) {
            case 'easy':
                blanks = 10;
                break;
            case 'medium':
                blanks = 20;
                break;
            case 'hard':
                blanks = 30;
                break;
        }
        generateSudokuBoard(blanks);

        startTime = Date.now();
        interval = setInterval(updateTimer, 100);

        document.getElementById('save-record').style.display = 'none';
    }
}

function updateTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}

function resetGame() {
    gameActive = false;
    clearInterval(interval);
    document.getElementById('game-board').innerHTML = '';
    document.getElementById('timer').textContent = '0';
}

function generateSudokuBoard(blanks) {
    const board = document.getElementById('game-board');
    board.innerHTML = '';

    let solution = generateCompleteSolution();
    removeNumbers(solution, blanks);

    for (let i = 0; i < 81; i++) {
        const input = document.createElement('input');
        input.type = 'text'; // 'number' 대신 'text' 사용
        input.maxLength = 1; // 입력 최대 길이 제한
        input.pattern = '[1-9]*'; // 1에서 9까지의 숫자만 허용
        input.id = `cell-${Math.floor(i / 9)}-${i % 9}`;
        input.classList.add('sudoku-input');
        input.readOnly = true;
        if (solution[i]) {
            input.value = solution[i];
            input.classList.add('preset-cell');
        } else {
            input.addEventListener('focus', showNumberSelector);
        }
        board.appendChild(input);
    }
}

function showNumberSelector(e) {
    const rect = e.target.getBoundingClientRect();
    const numberSelector = document.getElementById('number-selector');

    numberSelector.style.display = 'grid';
    numberSelector.style.visibility = 'hidden';
    const rightSpace = window.innerWidth - (rect.left + rect.width);
    const selectorWidth = numberSelector.offsetWidth;

    if (rightSpace < selectorWidth) {
        numberSelector.style.left = `${Math.max(0, window.innerWidth - selectorWidth - 20)}px`;
    } else {
        numberSelector.style.left = `${rect.left}px`;
    }

    numberSelector.style.top = `${window.scrollY + rect.top - numberSelector.offsetHeight - 5}px`;

    numberSelector.style.visibility = 'visible';

    window.selectedInput = e.target;
}

function generateCompleteSolution() {
    let sudokuArray = makeSudokuArray();
    if (solveSudoku(sudokuArray, 0, 0)) {
        return sudokuArray;
    } else {
        throw new Error('No solution found');
    }
}

function solveSudoku(sudokuArray, row, col) {
    if (row === 9) {
        return true;
    }

    if (sudokuArray[row * 9 + col] !== 0) {
        return solveSudoku(sudokuArray, col === 8 ? row + 1 : row, (col + 1) % 9);
    }

    for (let num = 1; num <= 9; num++) {
        if (isValid(sudokuArray, row, col, num)) {
            sudokuArray[row * 9 + col] = num;
            if (solveSudoku(sudokuArray, col === 8 ? row + 1 : row, (col + 1) % 9)) {
                return true;
            }
            sudokuArray[row * 9 + col] = 0;
        }
    }
    return false;
}

function isValid(sudokuArray, row, col, num) {
    for (let i = 0; i < 9; i++) {
        if (sudokuArray[row * 9 + i] === num || sudokuArray[i * 9 + col] === num) {
            return false;
        }
        if (sudokuArray[3 * Math.floor(row / 3) * 9 + 3 * Math.floor(col / 3) + (i % 3) + 9 * Math.floor(i / 3)] === num) {
            return false;
        }
    }
    return true;
}

function removeNumbers(solution, blanks) {
    for (let i = 0; i < blanks; i++) {
        let index = Math.floor(Math.random() * 81);
        while (solution[index] === 0) {
            index = Math.floor(Math.random() * 81);
        }
        solution[index] = 0;
    }
}

function makeSudokuArray() {
    var array = new Array(81).fill(0);
    return array;
}

function checkSudokuSolution() {
    const size = 9;
    const board = [];
    let row, col, block;

    // 스도쿠 보드의 현재 상태를 2D 배열로 변환
    for (let i = 0; i < size; i++) {
        board.push([]);
        for (let j = 0; j < size; j++) {
            const input = document.querySelector(`#cell-${i}-${j}`).value; // 각 셀의 ID를 가정
            board[i][j] = input ? parseInt(input, 10) : null;
        }
    }

    // 각 행, 열, 블록을 검사
    for (let i = 0; i < size; i++) {
        row = new Set();
        col = new Set();
        block = new Set();

        for (let j = 0; j < size; j++) {
            // 행 검사
            if (board[i][j] && row.has(board[i][j])) return false;
            row.add(board[i][j]);

            // 열 검사
            if (board[j][i] && col.has(board[j][i])) return false;
            col.add(board[j][i]);

            // 블록 검사
            const rowIndex = 3 * Math.floor(i / 3) + Math.floor(j / 3);
            const colIndex = 3 * (i % 3) + (j % 3);
            if (board[rowIndex][colIndex] && block.has(board[rowIndex][colIndex])) return false;
            block.add(board[rowIndex][colIndex]);
        }
    }

    let isComplete = true;
    for (let i = 0; i < size; i++) {
        for (let j = 0; j < size; j++) {
            if (board[i][j] == null) {
                isComplete = false;
                break;
            }
        }
        if (!isComplete) break;
    }

    // 게임 완료 시간 기록
    if (isComplete) {
        gameCompletedTime = Date.now() - startTime;
    }

    return isComplete;
}

function handleInput() {
    // 모든 입력 칸에 값을 입력하면 정답 체크 로직 실행
    const inputs = document.querySelectorAll('.game-board input');
    const isFilled = Array.from(inputs).every(input => input.value !== '');
    const isValidInput = Array.from(inputs).every(input => {
        const num = parseInt(input.value, 10);
        return !isNaN(num) && num >= 1 && num <= 9;
    });

    // 모든 칸이 유효한 숫자로 채워졌다면 정답 확인
    if (isFilled && isValidInput) {
        const isCorrect = checkSudokuSolution();
        if (isCorrect) {
            clearInterval(interval); // 올바른 정답일 때만 타이머 중지
            const endTime = Date.now();
            gameCompletedTime = (endTime - startTime) / 1000;
            document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;
            alert('축하합니다! 스도쿠를 성공적으로 완료했습니다.');
            gameActive = false; // 게임 활성 상태 업데이트
            document.getElementById('save-record').style.display = 'block'; // 기록 저장 버튼 표시
        } else {
            alert('오류가 있습니다. 다시 확인해주세요.');
            // 여기서는 interval을 초기화하지 않으므로 타이머는 계속 진행됩니다.
        }
    }
}
function saveRecord() {
    const nickname = document.getElementById('nickname').value;

    // 서버로 데이터 전송
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
        body: JSON.stringify({ nickname: nickname, time: gameCompletedTime, gametype: 6 }),
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            location.reload();
        })
        .catch(error => console.error('Error:', error));
}
