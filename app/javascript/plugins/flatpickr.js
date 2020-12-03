import flatpickr from "flatpickr";

const datePicker = document.querySelector(".datepicker")

const picker = () => {
	if (datePicker) {
		flatpickr(".datepicker", {
			enableTime: true
		});
	};
};

export { picker };
