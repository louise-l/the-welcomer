const conversationWindowSearch = () => {
	const input = document.getElementById("conversation-window-search");
	const names = document.querySelectorAll(".names-windows");
	const listUser = document.querySelectorAll(".list-group-item");

  if (input) {
		input.addEventListener("keyup", (event) => {
			const valueInput = input.value.toLowerCase();
			listUser.forEach((user, index) => {
				if (names[index].innerHTML.toLocaleLowerCase().replace(/\s/, '').includes(valueInput)) {
					if (user.classList.contains("d-none")) {
						user.classList.remove("d-none");
					}
				} else {
					user.classList.add("d-none");
				}
			})
		})
  };
};

export { conversationWindowSearch };