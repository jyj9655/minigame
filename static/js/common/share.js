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
    let title = "";
    let description = "";
    let buttonTitle = "";
    let imageUrl = ""; // 초기화 위치 수정
    let webUrl = window.location.href;
    const resultData = localStorage.getItem('mbtiResult');
    const pathArray = window.location.pathname.split('/');
    const gameIdentifier = pathArray[pathArray.length - 1];

    if (resultData) {
        const data = JSON.parse(resultData);
        title = `${data.product_info.name}`;
        description = `나의 ${data.product_info.name}의 결과는 ${data.product_info.product} !!`;
        buttonTitle = '테스트하러 하기';
        imageUrl = data.product_info.image ? `https://exhilarate.kr/static${data.product_info.image}` : `https://exhilarate.kr/static/images/share/default.png`;
        webUrl = `https://exhilarate.kr/mbti/${data.product_info.url}`;
    } else {
        const gameNameElement = document.getElementById("game-name");
        if (gameNameElement) {
            title = gameNameElement.textContent;
            description = `제가 이 게임을 완료했습니다!! 도전해보세요!!`;
            buttonTitle = '게임하러 가기';
        }
        imageUrl = `https://exhilarate.kr/static/images/share/${gameIdentifier}.png`;
    }

    shareOnKakao(title, description, imageUrl, webUrl, buttonTitle);
}
