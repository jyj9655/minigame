document.addEventListener('DOMContentLoaded', () => {
    const boxViewButton = document.getElementById('box-view');
    const listViewButton = document.getElementById('list-view');
    const gamesContainer = document.querySelector('.games');
  
    // 박스형식 버튼 클릭 이벤트 리스너
    boxViewButton.addEventListener('click', () => {
      gamesContainer.classList.add('box-view');
      gamesContainer.classList.remove('list-view');
    });
  
    // 리스트형식 버튼 클릭 이벤트 리스너
    listViewButton.addEventListener('click', () => {
      gamesContainer.classList.add('list-view');
      gamesContainer.classList.remove('box-view');
    });
  });