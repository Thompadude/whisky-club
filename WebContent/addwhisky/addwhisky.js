$(document).ready(function(){
	
	 // Check the form's inputs and text areas and flashes them if empty. Also displays a error message.
	var validateForm = function(){
		var isFieldsFilled = true;
		$('input, textarea').each(function(index){
			if ($(this).val() === '' || $(this).val() === null) {
				isFieldsFilled = false;
				$(this).fadeOut().fadeIn();
				$('#result').css('color', 'red');
				$('#result').html("Please fill in all forms!").hide().fadeIn('normal');
				isFieldsFilled = false;
			}
		});
		return isFieldsFilled;
	}
	
	var $name, $region, $country, $type, $info, $imgurl, $alc;
	
	$('#submit').click(function() {		
		// Check if the form inputs is valid.
		if (validateForm()) {
			// Get the user's input.
			$name = $('#name').val();
			$region = $('#region').val();
			$country = $('#country').val();
			$type = $('input:radio[name=type]:checked').val();
			$info = $('#info').val();
			$imgurl = $('#imgurl').val();
			$alc = $('#alc').val();
			
			// Check if the alcohol volume input is a number.
			if (!isNaN($alc)) {
				$.ajax(
					{
					type: 'POST',
					data: {name:$name, region:$region, country:$country, type:$type, info:$info, imgurl:$imgurl, alc:$alc},
					url: '../WhiskyManageServlet',
					success: function(servletResponse){
							// Display a success message and reset the form.
							$('#result').css('color', 'white');
							$('#result').html(servletResponse).hide().fadeIn('normal');
							$('form').trigger("reset");
							}
					});
				} else {
					// Display an error message if alcohol volume input is not a number.
					$('#alc').val('Number without percent sign.').css('color', 'red').fadeOut().fadeIn();
				}
		}
	})
});