$(document).ready(function($) {
	var grade = $('#grade').attr("value");
	
	var $filledImg = "url(http://www.entypo.com/images/star.svg)";
	var $outlinedImg = "url(http://www.entypo.com/images/star-outlined.svg)";
	
	var $fillStars = function() {
	switch(grade) {
	case '1':
		$('#star1').css({'content' : $filledImg})
		break;
	case '2':
		$('#star1').css({'content' : $filledImg})
		$('#star2').css({'content' : $filledImg})
		break;
	case '3':
		$('#star1').css({'content' : $filledImg})
		$('#star2').css({'content' : $filledImg})
		$('#star3').css({'content' : $filledImg})
		break;
	case '4':
		$('#star1').css({'content' : $filledImg})
		$('#star2').css({'content' : $filledImg})
		$('#star3').css({'content' : $filledImg})
		$('#star4').css({'content' : $filledImg})
		break;
	case '5':
		$('#star1').css({'content' : $filledImg})
		$('#star2').css({'content' : $filledImg})
		$('#star3').css({'content' : $filledImg})
		$('#star4').css({'content' : $filledImg})
		$('#star5').css({'content' : $filledImg})
		break;
	}}
	
	var $unfillStars = function() {
		$('#star1').css({'content' : $outlinedImg})
		$('#star2').css({'content' : $outlinedImg})
		$('#star3').css({'content' : $outlinedImg})
		$('#star4').css({'content' : $outlinedImg})
		$('#star5').css({'content' : $outlinedImg})
	} 
	
	$fillStars();
	
	$('#star1').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $outlinedImg})
			$('#star3').css({'content' : $outlinedImg})
			$('#star4').css({'content' : $outlinedImg})
			$('#star5').css({'content' : $outlinedImg})
		},
		function() {
			$unfillStars();
			$fillStars();
		})	
	
	$('#star2').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $outlinedImg})
			$('#star4').css({'content' : $outlinedImg})
			$('#star5').css({'content' : $outlinedImg})
		},
		function() {
			$unfillStars();
			$fillStars();
		})
		
	$('#star3').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $filledImg})
			$('#star4').css({'content' : $outlinedImg})
			$('#star5').css({'content' : $outlinedImg})
		},
		function() {
			$unfillStars();
			$fillStars();
		})
		
	$('#star4').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $filledImg})
			$('#star4').css({'content' : $filledImg})
			$('#star5').css({'content' : $outlinedImg})
		},
		function() {
			$unfillStars();
			$fillStars();
		})
				
	$('#star5').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $filledImg})
			$('#star4').css({'content' : $filledImg})
			$('#star5').css({'content' : $filledImg})
		},
		function() {
			$unfillStars();
			$fillStars();
		})
		
});