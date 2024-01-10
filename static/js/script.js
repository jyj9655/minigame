document.getElementById('start-button').addEventListener('click', startGame);
document.getElementById('reset-button').addEventListener('click', resetGame);

let startTime;
let numberToFind = 1;
let gameActive = false;
let interval;

function startGame() {
  if (!gameActive) {
    gameActive = true;
    numberToFind = 1;
    const board = document.getElementById('game-board');
    board.innerHTML = '';

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

    // 게임 시작 시 기록 저장 버튼 숨기기
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
  const board = document.getElementById('game-board');
  board.innerHTML = '';
  clearInterval(interval);
  document.getElementById('timer').textContent = '';

  // 게임 리셋 시 기록 저장 버튼 다시 표시
  document.getElementById('save-record').style.display = 'block'; // 버튼 표시
}

function handleCellClick(cell) {
  if (parseInt(cell.textContent) === numberToFind) {
    cell.style.backgroundColor = 'lightgreen';
    numberToFind++;
    if (numberToFind > 9) {
      clearInterval(interval);
      const endTime = Date.now();
      gameCompletedTime = (endTime - startTime) / 1000; // 밀리초를 초로 변환
      document.getElementById('timer').textContent = `${gameCompletedTime.toFixed(3)}초`;

      // 게임 완료 시 기록 저장 버튼 나타나기
      document.getElementById('save-record').style.display = 'block'; // 버튼 표시
    }
  }
}

document.getElementById('save-record').addEventListener('click', function() {
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
      body: JSON.stringify({ nickname: nickname, time: gameCompletedTime }),
  })
  .then(response => response.json())
  .then(data => {
      // alert 메시지 표시
      alert(data.message);

      // 수동으로 페이지 새로고침
      location.reload();
  })
  .catch(error => console.error('Error:', error));
});