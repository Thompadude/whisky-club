$(document).ready(function() {
		
	$('#loginjumobtron').fadeIn('slow');
		
	$('form').submit(function(event){
		// Caches a reference to the form before preventing default behavior.
        form = this;
		event.preventDefault();
		$('#loginjumobtron').fadeOut(2000);
		setTimeout(function(){
			form.submit();
		}, 3000
		);
		var userName = $('input[name=usrName').val();
		$('#loginwelcomemsg').append("Hello, " + userName + "!<br>Authenticating...")
		$('#loginwelcomemsg').fadeIn('slow');
	})
});