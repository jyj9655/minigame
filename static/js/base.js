document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.moving-text').forEach(function(el) {
        var content = el.getAttribute('data-content'); // data-content 속성 값 가져오기
        el.style.setProperty('--content', JSON.stringify(content)); // CSS 변수로 설정
    });
    
    document.querySelectorAll('.share-button').forEach(function(button) {
        if (button.getAttribute('data-tooltip') === '카카오톡') {
            button.addEventListener('click', function() {
                console.log("카카오톡 공유 버튼 클릭했다");
                // 공유 관련 함수 호출 여부를 확인하기 위한 로그
                shareGameWithMetaImage();
            });
        }
    });

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