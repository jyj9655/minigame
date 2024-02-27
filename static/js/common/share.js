Kakao.init('20518f7d5d60fc2b9ac5a3eb79aefa3e');

function shareOnKakao(title, description, imageUrl, webUrl, buttonTitle) {
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
                title: buttonTitle,
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
    var buttonTitle = "";
    var imageUrl; // imageUrl 초기화 위치를 함수 시작 부분으로 이동

    const resultData = localStorage.getItem('mbtiResult');
    if (resultData) {
        const data = JSON.parse(resultData);
        title = `나의 ${data.product_info.name}의 결과는 ${data.product_info.product} !!`;
        buttonTitle = '테스트하러 하기';
        imageUrl = data.product_info.image ? `https://exhilarate.kr/static${data.product_info.image}` : `https://exhilarate.kr/static/images/share/default.png`;
    } else {
        var gameNameElement = document.getElementById("game-name");
        if (gameNameElement) {
            title = gameNameElement.textContent;
            description = `제가 이 게임을 ${gameCompletedTime.toFixed(3)}초 만에 완료했습니다!! 도전해보세요!!`;
            buttonTitle = '게임하러 가기';
        }
        var pathArray = window.location.pathname.split('/');
        var gameIdentifier = pathArray[pathArray.length - 1];
        // 여기서 imageUrl 설정을 제거하거나 조건에 따라 다시 설정하지 않도록 주의
    }

    if (!imageUrl) { // imageUrl이 아직 설정되지 않았다면, 기본 게임 식별자 기반 이미지 사용
        imageUrl = `https://exhilarate.kr/static/images/share/${gameIdentifier}.png`;
    }

    var webUrl = window.location.href;

    shareOnKakao(title, description, imageUrl, webUrl, buttonTitle);
}
