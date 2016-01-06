/*
 * Handles animation of the menu.
 * 
 * When open icon is clicked, move menu to the right.
 * When close icon is clicked, move menu back to the left, hiding it.
 * 
 * While the menu is open an overlay fades the rest of the screen,
 * thus putting the focus on the menu.
 * 
 * If link on menu is clicked, wait 250ms so user can see the menu close.
 */
var $openMenu = function() {
	// Moves the menu to the right.
	$("#menu").animate({
		left : '0px'
	}, 200);
	// Hides the open menu-icon.
	$("#iconOpenMenu").toggle(false, 1000);
	// Fades in an overlay covering the rest of the screen.
	$(".overlay").fadeIn('slow'); }

var $closeMenu = function() {
	// Moves the menu to the left.
	$("#menu").animate({
		left : '-225px'
		}, 200);
	// Shows the open-menu icon.
	$("#iconOpenMenu").toggle(50);
	// The screen overlay fades out.
	$(".overlay").fadeOut('slow'); }

$(document).ready( 		
		
function() {
	$("#iconOpenMenu").click(function() {
		$openMenu();
	})
	
	$("#iconCloseMenu").click(function() {
		$closeMenu();
	})
	
	$(".overlay").click(function() {
		$closeMenu();
	})
 	
	$('.menulink').click (function () {
		// Get the href attribute from the link for later use.
		var $index = $(this);
		// Prevent the link from being followed.
		event.preventDefault();
		
		$closeMenu();
		// Wait for 250ms before following the link, letting the menu close.
		setTimeout(function() {
			document.location = $index.attr('href');
			}, 250);
	})
});