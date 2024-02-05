document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menu-toggle');
    const sidebarMenu = document.getElementById('sidebar-menu');
    const overlay = document.querySelector('.overlay');

    // 메뉴 토글 버튼 클릭 이벤트
    menuToggle.addEventListener('click', function() {
        sidebarMenu.classList.toggle('active');
        overlay.style.display = sidebarMenu.classList.contains('active') ? 'block' : 'none';
    });

    // 오버레이 클릭 이벤트
    overlay.addEventListener('click', function() {
        sidebarMenu.classList.remove('active');
        overlay.style.display = 'none';
    });

    // 스크롤 이벤트
    window.addEventListener('scroll', function() {
        if (sidebarMenu.classList.contains('active')) {
            sidebarMenu.classList.remove('active');
            overlay.style.display = 'none';
        }
    });
});

// 현재 페이지 URL 가져오기
const gameInfoElement = document.getElementById('game-info');
const gametype = gameInfoElement.dataset.gametype;

// 기록 저장 버튼 클릭 이벤트 핸들러
document.getElementById('save-record').addEventListener('click', () => {
    const nickname = document.getElementById('nickname').value;

    // 서버로 데이터 전송
    if (typeof gameCompletedTime === 'undefined') {
        alert("게임을 먼저 완료해주세요.");
        return;
    }

    // 서버로 데이터 전송 (gametype 값도 포함)
    fetch('/submit-record', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ nickname, time: gameCompletedTime, gametype }),
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

document.addEventListener('DOMContentLoaded', () => {
    const menuToggle = document.getElementById('menu-toggle');
    const mainMenu = document.getElementById('main-menu');

    menuToggle.addEventListener('click', () => {
        mainMenu.classList.toggle('active');
    });
});