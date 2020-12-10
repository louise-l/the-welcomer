// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr"

// Internal imports, e.g:

import { initSelect2 } from '../plugins/init_select2';
import { picker } from '../plugins/flatpickr'
import { anchor } from '../plugins/anchor'
import { buttonAddFiles } from './components/hide_button'
import { hideIcons } from './components/hide_icon'
import { initConversationCable } from '../channels/conversation_channel'
import { chat_window } from './components/conversation'
import { pickernotime } from "../plugins/flatpickr"
import { displayNotifs } from './components/notifications_display'
import { hideButtons } from './components/meeting'
import { findActivities} from './components/geocode'
import { inputMessage } from './components/input_message'


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();


  picker();
  anchor();
  buttonAddFiles();
  hideIcons();
  initConversationCable();
  initSelect2();
  pickernotime();
  displayNotifs();
  chat_window();
  hideButtons();
  findActivities();
  inputMessage();
});
