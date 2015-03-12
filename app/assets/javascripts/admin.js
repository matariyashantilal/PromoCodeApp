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
// require less-1.5.0.min
//= require bootstrap.min
//= require core
//= require jquery_nested_form
//= require_self

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