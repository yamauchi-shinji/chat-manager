if (document.URL.match( /rooms/ )) {
  window.addEventListener('load', function(){
    const clickButton = document.getElementById("room-participate")
    clickButton.addEventListener('click', function(){
      const renderDom = document.getElementById("select-form");
      const selectUser = document.getElementById("select-user");
      const idx = selectUser.selectedIndex;
      if (idx != 0) {
        const userObj = `<li>${selectUser.options[idx].text}</li><input name="room[user_ids][]" type="hidden" value="${selectUser.options[idx].value}">`;
        renderDom.insertAdjacentHTML("beforeend", userObj);
        const optionContent = document.getElementById(`user-id${selectUser.options[idx].value}`);
        if (optionContent){
          optionContent.remove();
        };
      };
    });
  });
};