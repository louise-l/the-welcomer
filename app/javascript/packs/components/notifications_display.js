const displayNotifs = () => {
  const bell = document.querySelector("#bell");

  if (bell) {
    bell.addEventListener("click", (event) => {
      const notifs = document.querySelector('#notifications-dropdown')
      notifs.classList.toggle("d-none")
    });
  }
}

export {displayNotifs};
