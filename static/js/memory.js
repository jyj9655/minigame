let cardDeck = [];
let selectedCards = [];
let pairsMatched = 0;
let isGameStarted = false;
let timerInterval;
let gameStartTime;
let gameCompletedTime;

document.getElementById('start-button').addEventListener('click', startGame);
document.getElementById('reset-button').addEventListener('click', resetGame);

function startGame() {
    if (isGameStarted) {
        return; // 이미 게임이 시작된 경우, 추가 실행 방지
    }

    isGameStarted = true;
    pairsMatched = 0;
    selectedCards = [];
    cardDeck = [];

    const gameBoard = document.getElementById('game-board');
    gameBoard.innerHTML = '';
    gameStartTime = Date.now();
    timerInterval = setInterval(updateGameTimer, 100);

    for (let i = 1; i <= 6; i++) {
        cardDeck.push(i, i);
    }

    shuffleCards(cardDeck);

    cardDeck.forEach((cardValue) => {
        const card = createCardElement(cardValue);
        gameBoard.appendChild(card);
    });

    setTimeout(() => {
        document.querySelectorAll('.card').forEach((card) => card.classList.add('flipped'));
        isGameStarted = false;
    }, 3000);
}

function createCardElement(cardValue) {
    const cardElement = document.createElement('div');
    cardElement.classList.add('card');
    cardElement.dataset.value = cardValue;

    const cardFront = document.createElement('div');
    cardFront.textContent = cardValue;
    cardFront.classList.add('card-front');

    const cardBack = document.createElement('div');
    cardBack.classList.add('card-back');

    cardElement.appendChild(cardFront);
    cardElement.appendChild(cardBack);
    cardElement.addEventListener('click', () => handleCardClick(cardElement));

    return cardElement;
}

function handleCardClick(card) {
    if (isGameStarted || card.classList.contains('matched') || selectedCards.length === 2) {
        return;
    }

    card.classList.toggle('flipped');
    selectedCards.push(card);

    if (selectedCards.length === 2) {
        checkForMatch();
    }
}

function checkForMatch() {
    if (selectedCards[0].dataset.value === selectedCards[1].dataset.value) {
        selectedCards.forEach(card => card.classList.add('matched'));
        pairsMatched++;
        if (pairsMatched === 6) {
            clearInterval(timerInterval);
            alert("축하합니다! 모든 카드를 찾았습니다!");
            gameCompletedTime = (Date.now() - gameStartTime) / 1000;
            
            document.getElementById('save-record').style.display = 'block';
        }
        
        selectedCards = [];
        isGameStarted = false;
    } else {
        selectedCards.forEach(card => card.classList.add('shake'));
        setTimeout(() => {
            selectedCards.forEach(card => {
                card.classList.remove('shake');
                card.classList.add('flipped');
            });
            
            selectedCards = [];
            isGameStarted = false;
        }, 500);
    }
}

function shuffleCards(array) {
    for (let i = array.length - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
}

function updateGameTimer() {
    const currentTime = Date.now();
    const timeElapsed = (currentTime - gameStartTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
}

function resetGame() {
    isGameStarted = false;
    clearInterval(timerInterval);
    document.getElementById('game-board').innerHTML = '';
    document.getElementById('timer').textContent = '0';
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
        body: JSON.stringify({ nickname: nickname, time: gameCompletedTime, gametype: 'memory' }),
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