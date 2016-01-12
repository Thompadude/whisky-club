$(document).ready(function(){
	
	var validateForm = function(){
		var isFieldsFilled = true;
		$('input').each(function(index){
			if ($(this).val() === '' || $(this).val() === null) {
				isFieldsFilled = false;
				$('#result').html("Please fill in all forms");
				return false;
			}
		});
		return isFieldsFilled;;
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
		
		$.ajax(
			{
			type: 'POST',
			data: {name:$name, region:$region, country:$country, type:$type, info:$info, imgurl:$imgurl, alc:$alc},
			url: 'WhiskyManageServlet',
			success: function(servletResponse){
					$('#result').html(servletResponse);
					$('form').trigger("reset");
					}
			});
		}
	})
});