$('a[href*=#]').on('click', function(event){     
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});

// Fade the whisky on hover.
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
	}	
);