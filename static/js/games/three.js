document.getElementById('start-button').addEventListener('click', startGame);
document.getElementById('reset-button').addEventListener('click', resetGame);

let numberToFind = 1;
let gameActive = false;
let interval;
let gameCompletedTime;
let startTime;

function startGame() {
  if (!gameActive) {
    gameActive = true;

    const countdownElement = document.getElementById('countdown');
    countdownElement.style.display = 'block';

    startCountdown(3, countdownElement, function() {
      const board = document.getElementById('game-board');
      board.innerHTML = '';
      board.style.display = 'grid';
      board.style.gridTemplateColumns = 'repeat(3, 100px)';
      board.style.gridTemplateRows = 'repeat(3, 100px)';
      board.style.height = '320px';
      board.style.gap = '10px';
      board.style.justifyContent = 'center';
      board.style.margin = '20px auto';

      // 타이머 초기화
      startTime = Date.now();
      interval = setInterval(updateTimer, 100); // 0.1초마다 타이머 업데이트

      // 랜덤 숫자 배치
      let numbers = Array.from({ length: 9 }, (_, i) => i + 1);
      numbers.sort(() => Math.random() - 0.5);

      for (let i = 0; i < 9; i++) {
        const cell = document.createElement('div');
        cell.textContent = numbers[i];
        cell.addEventListener('click', () => handleCellClick(cell));
        board.appendChild(cell);
      }

      document.getElementById('save-record').style.display = 'none';
      document.getElementById('nickname').style.display = 'none';
      document.getElementById('timer').style.display = 'block';
      countdownElement.style.display = 'none';
      countdownElement.innerHTML = '';
    });
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
  numberToFind = 1;
  const board = document.getElementById('game-board');
  board.innerHTML = '';
  board.style.height = '200px';
  document.getElementById('timer').textContent = '0';
  document.getElementById('timer').style.display = 'none';
  document.getElementById('save-record').style.display = 'none';
  document.getElementById('nickname').style.display = 'none';
  document.getElementById('share-container').style.display = 'none';
}

function getRandomPastelColor() {
  const hue = Math.floor(Math.random() * 360);
  const saturation = 100; 
  const lightness = 85; 
  return `hsl(${hue}, ${saturation}%, ${lightness}%)`;
}

function handleCellClick(cell) {
  if (parseInt(cell.textContent) === numberToFind) {
    cell.style.backgroundColor = getRandomPastelColor();
    numberToFind++;
    if (numberToFind > 9) {
      clearInterval(interval);
      const endTime = Date.now();
      gameCompletedTime = (endTime - startTime) / 1000;
      document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;

      // 게임 완료 시 기록 저장 버튼 나타나기
      document.getElementById('nickname').style.display = 'block';
      document.getElementById('save-record').style.display = 'block';
      document.getElementById('share-container').style.display = 'block';
    }
  }
}