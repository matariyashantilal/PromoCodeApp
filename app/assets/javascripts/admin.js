// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_self
//= require bootstrap.min
//= require jquery_nested_form
//= require core
//= require summernote.js

$( document ).ready(function() {
  $(".offer_type_radio:checked").each(function( index ) {
    offer_type($(this).val(), $(this).data('offerid'));
   });
  setNavigation();
  $('#setting_content_terms_condition, #setting_content_about_us').summernote({
  height: 300,
  width: 800,   //set editable area's height
  focus: true    //set focus editable area after Initialize summernote
  });
});
$(".offer_type_radio").on("change", function(){
    offer_type($(this).val(),$(this).data('offerid'));	
});
function offer_type(val,id){
  if (id !==null &&  id!== undefined) {
      var task_perform="div#task_perform_" + id
      var punch_count="div#punch_count_" + id
  }else
  {
      var task_perform="div#task_perform"
      var punch_count="div#punch_count"
  
  }
  	if (val == "Punchcard"){
      $(task_perform).hide();
      $(punch_count).show();
      $(punch_count).css('display','block');
    }else if(val == "OneTime"){
       $(task_perform).show();
      $(punch_count).hide();
    }
}
$(function () {
  setNavigation();
});
function setNavigation() {
  var path = window.location.pathname;
  path = path.replace(/\/$/, "");
  path = decodeURIComponent(path);

  $(".nav-list a").each(function () {
    var href = $(this).attr('href');
    if (path.substring(0, href.length) === href) {
      $(this).closest('li').addClass('active');
    }
  });
}
