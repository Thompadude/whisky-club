var menuAnimation = function() {

	$("#iconOpenMenu").click(function(){
		$("#menu").animate(
			{left: '0px'},
			200);
		$("#home").animate(
			{left: '250px'},
			200);
	})
	$("#iconCloseMenu").click(function(){
		$("#menu").animate(
			{left: '-250px'},
			200);
		$("#home").animate(
			{left: '0px'},
			200);		
	})
};

$(document).ready(menuAnimation);