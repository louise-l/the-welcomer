const newMessage = () => {
  const buttonPen = document.querySelector(".target-pen");

  if (buttonPen) {
    buttonPen.addEventListener("click", (event) => {
      const hide = document.querySelector("#new-message")
      hide.classList.toggle("d-none")
    });
  }
}

export {newMessage};
