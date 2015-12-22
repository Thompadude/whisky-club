var menuAnimation = function() {
	$("#iconOpenMenu").click(function() {
		$("#menu").animate({
			left : '0px'
		}, 200);
		$("#iconOpenMenu").toggle(false, 1000);
		$("#menu").toggle(true, 1000);
		$(".overlay").css("visibility", "visible");
	})
	$("#iconCloseMenu").click(function() {
		$("#menu").animate({
			left : '-225px'
		}, 200);
		$("#iconOpenMenu").toggle(50);
		$(".overlay").css("visibility", "hidden");
	})
};
$(document).ready(menuAnimation);