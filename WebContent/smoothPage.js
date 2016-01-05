$('a[href*=#]').on('click', function(event){     
    event.preventDefault();
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});

// Fade the whisky title on hover.
$('.whiskywrapper').hover(
	function() {
		$('.whiskytitle').fadeIn('slow');
	},
	function() {
		$('.whiskytitle').fadeOut('slow');
	}	
);