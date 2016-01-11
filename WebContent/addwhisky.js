$(document).ready(function(){
	
	var $name, $region, $country, $type, $info, $imgurl, $alc;
	
	$('#submit').click(function() {
	
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
	
	})
});