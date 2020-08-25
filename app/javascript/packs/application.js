// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery #ない人追加
//= require serviceworker-companion #追加
//= require rails-ujs
//= require activestorage
//= require_tree .

// safari起動させないための記述
$(function(){
    $('a').click(function(){
      location.href = $(this).attr('href');
      return false;
    });
});


// body読み込み時に一度だけbodyサイズを設定
window.onload = ()=>{
  document.body.style.height = window.innerHeight + 'px';
}

// リサイズを停止して500ms後にbodyサイズを設定
let timeoutId;
window.addEventListener("resize", () => {
  clearTimeout(timeoutId);

  timeoutId = setTimeout(() => {
      document.body.style.height = window.innerHeight + 'px';
  }, 500);
});