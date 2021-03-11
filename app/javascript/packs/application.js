// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');
import 'bootstrap';
import { initFlatpickr } from '../plugins/flatpickr';
import { initChatroomCable } from '../channels/chatroom_channel';
document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initChatroomCable();
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//Code to hide submit btn in pets show
const add = document.querySelector('#add-photo');
const submit = document.querySelector('#submit-photo');

const addPhoto = () => {
  if (add) {
    add.addEventListener('change', () => {
      submit.style.display = "";
      ;
    })
  }
}
export { addPhoto };

import "controllers"
