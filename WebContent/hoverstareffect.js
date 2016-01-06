$(document).ready(function($) {
	
	var $filledImg = "url(http://www.entypo.com/images/star.svg)";
	var $outlinedImg = "url(http://www.entypo.com/images/star-outlined.svg)";
	
	$('#star1').hover(
			function() {
				$('#star1').css({'content' : $filledImg})
			},
			function() {
				$('#star1').css({'content' : $outlinedImg})
			})	
	
	$('#star2').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
		},
		function() {
			$('#star1').css({'content' : $outlinedImg})
			$('#star2').css({'content' : $outlinedImg})
		})
		
	$('#star3').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $filledImg})
		},
		function() {
			$('#star1').css({'content' : $outlinedImg})
			$('#star2').css({'content' : $outlinedImg})
			$('#star3').css({'content' : $outlinedImg})
		})
		
	$('#star4').hover(
		function() {
			$('#star1').css({'content' : $filledImg})
			$('#star2').css({'content' : $filledImg})
			$('#star3').css({'content' : $filledImg})
			$('#star4').css({'content' : $filledImg})
		},
		function() {
			$('#star1').css({'content' : $outlinedImg})
			$('#star2').css({'content' : $outlinedImg})
			$('#star3').css({'content' : $outlinedImg})
			$('#star4').css({'content' : $outlinedImg})
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
			$('#star1').css({'content' : $outlinedImg})
			$('#star2').css({'content' : $outlinedImg})
			$('#star3').css({'content' : $outlinedImg})
			$('#star4').css({'content' : $outlinedImg})
			$('#star5').css({'content' : $outlinedImg})
		})	
});