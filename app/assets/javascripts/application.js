// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	// On download, bring in download link slow
	setTimeout(function() {
	  $('.mediafiles-show #bg, .mediafiles-show ul.hmenu, .mediafiles-show .billboard-link').fadeIn().show();		
	}, 10000 );
	setTimeout(function() {
	  $('.mediafiles-show .download-link').fadeIn().show();		
	}, 12000 );
			
   $('img.download-loader').fadeIn().delay(9000).fadeOut();
	
   // Show upload form on click	
   $('.upload-link').click(function(){
     $('.upload-link').hide();
	 $('form#new_mediafile').show();	 
   });
   // Hide upload form on cancel
   $('#cancel-button').click(function(){
     $('.upload-link').show();
	 $('form#new_mediafile').hide();
   });

 });
 
 // Flash notice and dissapear
 $(function() {
   $('#flash_notice').delay(500).fadeIn('normal', function() {
      $(this).delay(5500).fadeOut();
   });
});

 // Upload File and hide form
 $(function() {
   $('.action-upload').click(function() {
	 $('form#new_mediafile').fadeOut();
	 $('img.loader').fadeIn().delay(200); 
   });
});