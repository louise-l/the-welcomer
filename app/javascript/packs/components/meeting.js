const hideButtons = () => {
  const meetingsDays = document.querySelectorAll('.day')
  if (meetingsDays) {
    meetingsDays.forEach((day) => {
      day.addEventListener("mouseover", (event) => {
        day.children[1].classList.remove("d-none")
      })
      day.addEventListener("mouseleave", (event) => {
        day.children[1].classList.add("d-none")
      })

    });
  };
}


export {hideButtons};
