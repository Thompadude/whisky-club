$(document).ready(function() {

	/**
	 * When clicking on a-element, first prevent default behavior on links starting with #
	 * Then follow the link with an animation, resulting in a smooth scrolling effect.
	 */
	$('a[href*=#]').on('click', function(event){     
		event.preventDefault();
		 /** 
		 * this.hash gets the attribute of 'this' excluding the # and scrolls the user
		 * to ABC, DEF etc, etc.
		 */
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
	})
	
	/**
	 * Fade the whisky on hover.
	 * The stop method prevents the animation to loop if hovering too much.
	 */
	$('.whiskywrapper').hover(
		function() {
			$(this).find('.whiskytitle').stop(true, true).fadeIn('slow');
			$(this).find('.whiskygrade').stop(true, true).fadeIn('slow');
			$(this).find('.img-responsive').stop(true, true).fadeTo('slow', 0.5);
		},
		function() {
			$(this).find('.whiskytitle').stop(true, true).fadeOut('slow');
			$(this).find('.whiskygrade').stop(true, true).fadeOut('slow');
			$(this).find('.img-responsive').stop(true, true).fadeTo('slow', 1);
		})
		
});