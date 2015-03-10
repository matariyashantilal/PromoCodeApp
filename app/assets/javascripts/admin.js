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
//= require turbolinks
//= require jquery-ui-1.10.3.custom.min
//= require less-1.5.0.min
//= require bootstrap.min
//= require bootstrap 
//= require jquery_nested_form
//= require wysihtml5-0.3.0
//= require wysihtml5-0.4.0pre.min
//= require bootstrap-wysihtml5.js
//= require summernote.min
//= require summernote
// require jquery.accordion
//= require core
//= require_self
// require demo
// require jquery.ml-keyboard
// require theme-options
// require_tree .
$( document ).ready(function() {
 	offer_type($(".offer_type_radio:checked").val());
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