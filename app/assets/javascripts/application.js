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
//= require bootstrap
//= require redactor-rails
//= require social-share-button
//= require toastr
//= require_tree .


function like(id) {
  $.ajax({
      Default: "GET",
      dataType: "json",
      url: "/articles/like/"+id,
      success: function(data){
        var like = data.like;
        $('#like').html(like);
        $('#like_it').attr("disabled", "disabled");
      }
  }); 
} 

  

  
