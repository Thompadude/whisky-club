var menuAnimation = function() {
	$("#iconOpenMenu").click(function() {
		$("#menu").animate({
			left : '0px'
		}, 200);
		$("#iconOpenMenu").toggle(false, 1000);
		$("#menu").toggle(true, 1000);
	})
	$("#iconCloseMenu").click(function() {
		$("#menu").animate({
			left : '-225px'
		}, 200);
		$("#iconOpenMenu").toggle(50);
	})
};
$(document).ready(menuAnimation);