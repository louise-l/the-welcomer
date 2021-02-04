import AOS from "aos"

document.addEventListener('DOMContentLoaded', function() {
  AOS.init({
    startEvent: 'turbolinks:load' // if you are using turbolinks
  });
});