document.addEventListener('DOMContentLoaded', function () {
    const shareButton = document.getElementById('share-button');
    if (shareButton) {
        shareButton.addEventListener('click', captureGameBoard);
    }

    const menuToggle = document.querySelector('.menu-toggle');
    const sidebarMenu = document.getElementById('sidebar-menu');
    const overlay = document.querySelector('.overlay');

    if (menuToggle && sidebarMenu && overlay) {
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
    }

    const gameInfoElement = document.getElementById('game-info');
    if (gameInfoElement) {
        const gametype = gameInfoElement.dataset.gametype;

        // 기록 저장 버튼 클릭 이벤트 핸들러
        const saveRecordButton = document.getElementById('save-record');
        if (saveRecordButton) {
            saveRecordButton.addEventListener('click', () => {
                const nickname = document.getElementById('nickname').value;
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
                    alert(data.message);
                    location.reload();
                })
                .catch(error => console.error('Error:', error));
            });
        }
    }
});