$(document).ready(function(){
	
	var validateForm = function(){
		var isFieldsFilled = true;
		$('input').each(function(index){
			if ($(this).val() === '' || $(this).val() === null) {
				isFieldsFilled = false;
				$('#result').css('color', 'red');
				$('#result').html("Please fill in all forms!").hide().fadeIn('normal');
				return false;
			}
		});
		return isFieldsFilled;
	}
	
	var $name, $region, $country, $type, $info, $imgurl, $alc;
	
	$('#submit').click(function() {
		var isCreatingNewWhisky = validateForm();
		
		if (isCreatingNewWhisky) {
		$name = $('#name').val();
		$region = $('#region').val();
		$country = $('#country').val();
		$type = $('input:radio[name=type]:checked').val();
		$info = $('#info').val();
		$imgurl = $('#imgurl').val();
		$alc = $('#alc').val();
		
		if (!isNaN($alc)) {
			$.ajax(
				{
				type: 'POST',
				data: {name:$name, region:$region, country:$country, type:$type, info:$info, imgurl:$imgurl, alc:$alc},
				url: 'WhiskyManageServlet',
				success: function(servletResponse){
						$('#result').css('color', 'white');
						$('#result').html(servletResponse).hide().fadeIn('normal');
						$('form').trigger("reset");
						}
				});
			} else {
				$('#alc').val('Needs to be a number');
			}
		}
	})
});