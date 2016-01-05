/*
 * Handles animation of the menu.
 * 
 * When open icon is clicked, move menu to the right.
 * When close icon is clicked, move menu back to the left, hiding it.
 * 
 * While the menu is open an overlay fades the rest of the screen,
 * thus putting the focus on the menu.
 */
var $closeMenu = function() {
	$("#menu").animate({
		left : '-225px'
		}, 200);
	$("#iconOpenMenu").toggle(50);
	$(".overlay").fadeOut('slow'); }

var $openMenu = function() {
	$("#menu").animate({
		left : '0px'
	}, 200);
	$("#iconOpenMenu").toggle(false, 1000);
	$("#menu").toggle(true, 1000);
	$(".overlay").fadeIn('slow'); }

$(document).ready( 		
		
function() {
	$("#iconOpenMenu").click(function() {
		$openMenu();
	})
	$("#iconCloseMenu").click(function() {
		$closeMenu();
	})
	
/*
 * 
 * UTVECKLA DENNA KOD 
 	
	$('#home').click (function () {
		setTimeout(function (event) {
			$closeMenu();
			event.preventDefault();
			var goTo = this.getAttribute("href");
			setTimeout(function(){
				window.location = goTo;}
				,3000);
		})
	})
 */
});