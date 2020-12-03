const buttonAddFiles = () => {
  const buttonFile = document.querySelector("#addfile");

  if (buttonFile) {
    buttonFile.addEventListener("click", (event) => {
      const hide = document.querySelector("#tohide")
      hide.classList.toggle("d-block");
      buttonFile.classList.toggle("d-none")
    });
  }
}

export {buttonAddFiles};
