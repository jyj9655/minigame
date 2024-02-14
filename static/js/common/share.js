Kakao.init('20518f7d5d60fc2b9ac5a3eb79aefa3e');

function shareOnKakao(title, description, imageUrl, webUrl) {
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: title,
            description: description,
            imageUrl: imageUrl,
            link: {
                mobileWebUrl: webUrl,
                webUrl: webUrl
            },
        },
        buttons: [
            {
                title: '게임하기',
                link: {
                    mobileWebUrl: webUrl,
                    webUrl: webUrl
                },
            },
        ],
    });
}

function captureGameBoard() {
    html2canvas(document.getElementById("game-board")).then(canvas => {
        var image = canvas.toDataURL("image/png");
        var title = "";

        var currentPageUrl = window.location.href;

        var mbtiNameElement = document.getElementById("mbti-name");
        var gameNameElement = document.getElementById("game-name");
        if (mbtiNameElement) {
            title = mbtiNameElement.textContent + " 결과 공유";
        } else if (gameNameElement) {
            title = gameNameElement.textContent + " 완료!";
        }

        shareOnKakao(title, `제가 이 게임을 ${gameCompletedTime.toFixed(3)}초 만에 완료했습니다! 도전해보세요!`, image, currentPageUrl);
    });
}