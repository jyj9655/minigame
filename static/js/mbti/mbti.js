let currentQuestionIndex = 0;
let EI = 0;
let SN = 0;
let TF = 0;
let JP = 0;

document.addEventListener('DOMContentLoaded', function() {
    const headerElement = document.querySelector('#header');
    headerElement.style.backgroundColor = mbtiColor;

    const mbtiElement = document.querySelector('.mbti');
    mbtiElement.style.backgroundImage = `url('${mbtiImage}')`;
    mbtiElement.style.backgroundSize = 'cover';
    mbtiElement.style.backgroundPosition = 'center center';
    mbtiElement.style.backgroundRepeat = 'no-repeat';
    mbtiElement.style.position = 'relative';
    mbtiElement.style.overflow = 'hidden';
});

document.getElementById('start-button').addEventListener('click', function() {
    startTest(questions);
});

function startTest(questions) {
    currentQuestionIndex = 0;
    document.querySelector('.mbti').style.display = 'none';
    document.getElementById('mbti-board').style.display = 'block';
    document.getElementById('start-button').style.display = 'none';
    document.getElementById('reset-button').style.display = 'inline';
    document.getElementById('progress-bar').style.display = 'block';
    showQuestion(currentQuestionIndex);
}

function showQuestion(index) {
    updateProgress(index, questions.length);

    if (index >= questions.length) {
        submitAnswers();
        return;
    }

    const question = questions[index];
    const mbtiBoard = document.getElementById('mbti-board');
    mbtiBoard.innerHTML = `
        <div class="question">
            <h2>${index+1}. ${question.question}</h2>
            <button id="answer_a_${index}" class="answer" data-mbti-type="${question.mbti_code}">${question.answer_a_option}</button><br>
            <button id="answer_b_${index}" class="answer">${question.answer_b_option}</button>
        </div>
    `;

    document.querySelector(`#answer_a_${index}`).addEventListener('click', function() {
        const mbtiType = this.getAttribute('data-mbti-type');
        updateScores(mbtiType);
        moveToNextQuestion();
    });

    document.querySelector(`#answer_b_${index}`).addEventListener('click', function() {
        moveToNextQuestion();
    });

    function moveToNextQuestion() {
        currentQuestionIndex++;
        if (currentQuestionIndex < questions.length) {
            showQuestion(currentQuestionIndex);
        } else {
            submitAnswers();
        }
    }
}

function updateScores(mbtiType) {
    if (mbtiType === "EI") EI += 1;
    if (mbtiType === "SN") SN += 1;
    if (mbtiType === "TF") TF += 1;
    if (mbtiType === "JP") JP += 1;

    console.log(`Scores: EI=${EI}, SN=${SN}, TF=${TF}, JP=${JP}`);
}

function updateProgress(current, total) {
    var progressPercentage = (current / total) * 100;
    var progressBar = document.getElementById('progress-bar');
    var progressTooltip = document.getElementById('progress-tooltip');

    progressBar.style.width = progressPercentage + '%';
    progressTooltip.innerText = `${current}/${total}`;
    if (currentQuestionIndex > 0) {
        progressTooltip.style.display = 'block';
    }
    
    progressTooltip.style.left = `calc(${progressPercentage}%)`;
}

function resetTest() {
    currentQuestionIndex = 0;
    EI = 0;
    SN = 0;
    TF = 0;
    JP = 0;
    document.getElementById('mbti-board').innerHTML = '';
    document.querySelector('.mbti').style.display = 'flex';
    document.getElementById('mbti-board').style.display = 'none';
    document.getElementById('start-button').style.display = 'inline';
    document.getElementById('reset-button').style.display = 'none';
    document.getElementById('progress-bar').style.width = '0%';
}

function submitAnswers() {
    // 결과 계산 로직
    mbti = ""; // 결과를 저장할 변수 초기화
    (EI < 2) ? mbti += "I" : mbti += "E";
    (SN < 2) ? mbti += "N" : mbti += "S";
    (TF < 2) ? mbti += "T" : mbti += "F";
    (JP < 2) ? mbti += "J" : mbti += "P";

    // AJAX 요청을 사용하여 서버에 데이터 전송
    fetch(`/result`, { // 동적으로 URL 구성
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ mbti: mbti, mbti_id: mbtiId }),
    })
    .then(response => response.json())
    .then(data => {
        localStorage.setItem('mbtiResult', JSON.stringify(data));
        window.location.href = `/result`;
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}