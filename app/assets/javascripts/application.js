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

$(document).ready(function() {
  WebFontConfig = {
    google: { families: [ 'Kaushan+Script::latin', 'Source+Sans+Pro:400,300,600,300italic,400italic,600italic:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();  

  // update social icons for twitter
  $('a.social-share-button-twitter').append( "<i class='fa fa-twitter'></i>" );
  $('a.social-share-button-twitter').removeClass('social-share-button-twitter').addClass('btn bg-aqua btn-circle')
  // update social icons for facebook
  $('a.social-share-button-facebook').append( "<i class='fa fa-facebook'></i>" );
  $('a.social-share-button-facebook').removeClass('social-share-button-facebook').addClass('btn bg-blue btn-circle')
  // update social icons for google-plus
  $('a.social-share-button-google_plus').append( "<i class='fa fa-google-plus'></i>" );
  $('a.social-share-button-google_plus').removeClass('social-share-button-google_plus').addClass('btn bg-red btn-circle')
  // update social icons for google
  $('a.social-share-button-pinterest').append( "<i class='fa fa-pinterest'></i>" );
  $('a.social-share-button-pinterest').removeClass('social-share-button-pinterest').addClass('btn bg-dark-red btn-circle')
  $('div.redactor_form-control').css('height', '414px');
});  

  
