// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.raty.js
//= require_tree .


// flash 表示用
$(function(){
  setTimeout("$('#flash-op').fadein('slow')", 500) 
  setTimeout("$('#flash-op').fadeOut('slow')", 10000) 
})

// ページトップへ「戻るボタン」（上がボタン自体の表示と非表示・下がクリックした時の動作）
$(function() {
  var backBtn = $('#back a')
  backBtn.hide();
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      backBtn.fadeIn(300);
    } else {
      backBtn.fadeOut(300);
    }
  });
  backBtn.on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

