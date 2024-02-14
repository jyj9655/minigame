document.getElementById('start-button').addEventListener('click', startGame);
document.getElementById('reset-button').addEventListener('click', resetGame);

let cardDeck = [];
let selectedCards = [];
let pairsMatched = 0;
let gameActive = false;
let interval;
let startTime;
let gameCompletedTime;

function startGame() {
    if (!gameActive) {
        gameActive = true;
        pairsMatched = 0;
        selectedCards = [];
        cardDeck = [];

        const countdownElement = document.getElementById('countdown');
        countdownElement.style.display = 'block';

        startCountdown(3, countdownElement, function() {
            const board = document.getElementById('game-board');
            board.innerHTML = '';
            board.style.display = 'grid';
            board.style.gridTemplateColumns = 'repeat(3, 100px)';
            board.style.gridTemplateRows = 'repeat(3, 100px)';
            board.style.height = '430px';
            board.style.gap = '10px';
            board.style.justifyContent = 'center';
            board.style.margin = '20px auto';

            startTime = Date.now();
            interval = setInterval(updateGameTimer, 100);

            for (let i = 1; i <= 6; i++) {
                cardDeck.push(i, i);
            }

            shuffleCards(cardDeck);

            cardDeck.forEach((cardValue) => {
                const card = createCardElement(cardValue);
                board.appendChild(card);
            });

            setTimeout(() => {
                document.querySelectorAll('.card').forEach((card) => card.classList.add('flipped'));
                gameActive = false;
            }, 3000);

            document.getElementById('save-record').style.display = 'none';
            document.getElementById('nickname').style.display = 'none';
            document.getElementById('timer').style.display = 'block';
            countdownElement.style.display = 'none';
            countdownElement.innerHTML = '';
        });
    }
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
    if (gameActive || card.classList.contains('matched') || selectedCards.length === 2) {
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
            clearInterval(interval);
            alert("축하합니다! 모든 카드를 찾았습니다!");
            const endTime = Date.now();
            gameCompletedTime = (endTime - startTime) / 1000;
            document.getElementById('save-record').style.display = 'block';
            document.getElementById('nickname').style.display = 'block';
            document.getElementById('share-container').style.display = 'block';
        }
        
        selectedCards = [];
        gameActive = false;
    } else {
        selectedCards.forEach(card => card.classList.add('shake'));
        setTimeout(() => {
            selectedCards.forEach(card => {
                card.classList.remove('shake');
                card.classList.add('flipped');
            });
            
            selectedCards = [];
            gameActive = false;
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
    const timeElapsed = (currentTime - startTime) / 1000;
    document.getElementById('timer').textContent = `${timeElapsed.toFixed(3)}초`;
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
    document.getElementById('share-container').style.display = 'none';
}