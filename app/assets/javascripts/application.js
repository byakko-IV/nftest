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
//= require jquery-ui
//= require bootstrap
//= require cocoon
//= require turbolinks
//= require_tree ./channels
//= require_tree .

$(document).on('turbolinks:load', function(){
  $('[data-toggle="tooltip"]').tooltip();
  $('#alert').FadeTo(5000, 500).slideUp(500, function() {
    $('#alert').alert('close');
  });
});

function set_dates(){
  date = new Date();
  if($("#type").val() == 'Transferencia'){
    $("#payment_creation_date").val(new Date().toISOString().slice(0,10));
    $("#payment_apply_date").val(new Date().toISOString().slice(0,10));
  }else{
    $("#payment_creation_date").val(new Date().toISOString().slice(0,10));
    $("#payment_apply_date").val((date.getDate() + 1).toISOString().slice(0,10));
  }
}
