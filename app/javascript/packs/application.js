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
import { previewImageOnFileSelect } from '../components/photo_preview';

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initChatroomCable();
  previewImageOnFileSelect();
  (function detectMob() {
    const toMatch = [
      /Android/i,
      /webOS/i,
      /iPhone/i,
      /iPad/i,
      /iPod/i,
      /BlackBerry/i,
      /Windows Phone/i,
    ];

    if (
      toMatch.some((toMatchItem) => {
        return navigator.userAgent.match(toMatchItem);
      })
    ) {
      const p = document.createElement('p');
      p.innerText = 'Scroll to the left to view table';
      p.classList.add('font-italic');
      if (document.getElementById('calendar-main')) {
        document.getElementById('calendar-main').append(p);
      }
    }
  })();
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//Code to hide submit btn in pets show
import 'controllers';
