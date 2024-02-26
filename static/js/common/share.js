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
                title: '게임하러 하기',
                link: {
                    mobileWebUrl: webUrl,
                    webUrl: webUrl
                },
            },
        ],
    });
}

function shareGameWithMetaImage() {
    var title = "";
    var description = "";
    var mbtiNameElement = document.getElementById("mbti-name");
    var gameNameElement = document.getElementById("game-name");
    if (mbtiNameElement) {
        title = mbtiNameElement.textContent;
    } else if (gameNameElement) {
        title = gameNameElement.textContent;
        description =`제가 이 게임을 ${gameCompletedTime.toFixed(3)}초 만에 완료했습니다! 도전해보세요!`;
    }
    
    var pathArray = window.location.pathname.split('/');
    var gameIdentifier = pathArray[pathArray.length - 1];

    var imageUrl = `https://exhilarate.kr/static/images/share/${gameIdentifier}.png`;
    // var imageUrl = `http://127.0.0.1:5000/static/images/share/${gameIdentifier}.png`;
    var webUrl = window.location.href;

    shareOnKakao(title, description, imageUrl, webUrl);
}