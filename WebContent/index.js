$(document).ready(function(){
	$('.indexdiv').hover(function(){
		$(this).find('img').stop(true, true).fadeTo('slow', 1)
		$(this).find('p').stop(true, true).animate({fontSize: '400%'}, 'medium')
	},
	function(){
		$(this).find('img').stop(true, true).fadeTo('slow', .6)
		$(this).find('p').stop(true, true).animate({fontSize: '300%'}, 'slow')
	});
});