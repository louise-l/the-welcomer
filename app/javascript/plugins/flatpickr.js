import flatpickr from "flatpickr";


const picker = () => {
  const datePicker = document.querySelector(".datepicker")
	if (datePicker) {
		flatpickr(".datepicker", {
			enableTime: true
		});
	};
};

const pickernotime = () => {
  const datePicker = document.querySelector(".datepickernotime")
  if (datePicker) {
    flatpickr(".datepickernotime", {
    });
  };
};

export { picker };
export { pickernotime };

