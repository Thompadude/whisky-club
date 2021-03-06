/*
 * When entering with mouse, images in the class 'indexdiv' fades to
 * opacity 1 and the p elements set a new font size with an animation.
 * 
 * When mouse leaves, return to previous state. Works best with CSS-stylesheet
 * with default values for the p element and with different media settings
 * (font-size 2em and 3em). 
 */

$(document).ready(function(){
	// Mouse enter the element.
	$('.indexdiv').hover(function(){
		// Find img elements and fade them to opacity 1.
		$(this).find('img').stop(true, true).fadeTo('slow', 1)
		/*
		 * If windows size is equal or less than 639px, find the p-elements
		 * and set font size to 200%, else to 250%. The 'stop' function prevent
		 * loops.
		 */
		if ($(window).width() <= 639) {
			$(this).find('p').stop(true, true).animate({fontSize: '200%'}, 'medium')			
		} else {		
			$(this).find('p').stop(true, true).animate({fontSize: '250%'}, 'medium')
		}
	},
	// Mouse leave the element.
	function(){
		// Find img elements and fade them to opacity .6.
		$(this).find('img').stop(true, true).fadeTo('slow', .6)
		/*
		 * If windows size is equal or less than 639px, find the p-elements
		 * and set font size to 175%, else to 225%em. The 'stop' function prevent
		 * loops.
		 */
		if ($(window).width() <= 639) {		
			$(this).find('p').stop(true, true).animate({fontSize: '175%'}, 'slow')
		} else { 
			$(this).find('p').stop(true, true).animate({fontSize: '225%'}, 'slow')
		}
	});
});