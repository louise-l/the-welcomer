


const hideIcons = () => {
  const buttonHabit = document.querySelectorAll('.icon-habit')
  const buttonEditM = document.querySelector('#button-edit-mission')
  const buttonEditH = document.querySelector('#button-edit-habit')

  if (buttonEditM) {
    const buttonMission = document.querySelectorAll('.icon-mission')
    buttonEditM.addEventListener("click", (event) => {
      buttonMission.forEach((button) => {
        button.classList.toggle("d-none")
      })
    });
  };

    if (buttonEditH) {
    const buttonMission = document.querySelectorAll('.icon-habit')
    buttonEditH.addEventListener("click", (event) => {
      buttonHabit.forEach((button) => {
        button.classList.toggle("d-none")
      })
    });
  };
}

export {hideIcons};
