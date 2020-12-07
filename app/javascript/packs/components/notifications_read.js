const readNotifs = () => {
  const iconsCalendar = document.querySelectorAll(".icon-calendar");

  if (iconsCalendar) {
    iconsCalendar.forEach((icon) => {
      icon.addEventListener('click', (event) => {
        icon.classList.remove("icon-calendar")
      });
    })
  };
};

export {readNotifs};
