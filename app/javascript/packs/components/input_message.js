const inputMessage = () => {
	const input = document.getElementById('input-message');
	const submit = document.getElementById('submit-message');

	if (input) {
		input.addEventListener("keyup", (event) => {
			if (event.keyCode === 13 && !event.shiftKey) {
				event.preventDefault();
				submit.click();
			}
		})
	}

};

export { inputMessage };