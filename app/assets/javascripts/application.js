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
//= require popper
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .



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


// メインアイコン
$(function() {
  $('#main-fadein').hide().fadeIn(4000);

  $(window).scroll(function(){
    if ($(this).scrollTop() > 400) {
      $('#main-fadein').fadeOut(1200);
    } else {
      $('#main-fadein').fadeIn(1200);
    }
  });
});
  



  // _flash-notice用
$(function(){
    setTimeout("$('.flash-notice, .flash-back').fadein('slow')", 500) 
    setTimeout("$('.flash-notice, .flash-back').fadeOut('slow')", 2000) 
  })
  // flash-alert用
  $(function(){
    setTimeout("$('.flash-alert').fadein('slow')", 500) 
    setTimeout("$('.flash-alert').fadeOut('slow')", 3000) 
  })