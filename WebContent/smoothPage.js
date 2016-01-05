$('a[href*=#]').on('click', function(event){     
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});

// Fade the whisky on hover.
$('.whiskywrapper').hover(
	function() {
		$(this).find('.whiskytitle').fadeIn('slow');
		$(this).find('.whiskygrade').fadeIn('slow');
		$(this).find('.img-responsive').fadeTo('slow', 0.5);
	},
	function() {
		$(this).find('.whiskytitle').fadeOut('slow');
		$(this).find('.whiskygrade').fadeOut('slow');
		$(this).find('.img-responsive').fadeTo('slow', 1);
	}	
);