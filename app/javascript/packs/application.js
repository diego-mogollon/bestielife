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

import 'controllers';
window.dispatchMapsEvent = function (...args) {
  console.log(args);
  //   const event = document.createEvent('Events');
  //   event.initEvent('google-maps-callback', true, true);
  //   event.args = args;
  //   window.dispatchEvent(event);
};

const addPhoto = () => {
  // we select the photo input
  const input = document.getElementById('add-photo');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('submit-photo').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('submit-photo').classList.remove('hidden');
  }
}
export { addPhoto };
