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
//= require bootstrap.min
//= require_self
//= require jquery_nested_form
//= require core
//= require summernote.js
//= require summernote.min.js

$( document ).ready(function() {
 	offer_type($(".offer_type_radio:checked").val());
 	
  //editor setting
  $('#setting_content_terms_condition, #setting_content_about_us').summernote({
  height: 300,
  width: 800,   //set editable area's height
  focus: true    //set focus editable area after Initialize summernote
  });
  $('#setting_content_about_us').summernote({
  height: 200,
  width: 600,   //set editable area's height
  focus: true    //set focus editable area after Initialize summernote
  });

});
$(".offer_type_radio").on("change", function(){
	offer_type($(this).val());
});
function offer_type(val){
	if (val == "Punchcard"){
    $("div#task_perform").hide();
    $("div#punch_count").show();
    $("div#punch_count").css('display','block');
  }else if(val == "OneTime"){
     $("div#task_perform").show();
    $("div#punch_count").hide();
  }
}