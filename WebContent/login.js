$(document).ready(function() {	
	var val = $('#validate').val();
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
		var userName = $('input[name=usrName]').val();
		
		$('#loginwelcomemsg').fadeIn('slow');
		$('#loginwelcomemsg').html("Hello, " + userName + "!<br>Authenticating...");
		
		/*
		if (val === "true"){
			$('#loginwelcomemsg').fadeIn('slow');
			$('#loginwelcomemsg').html("Hello, " + userName + "!<br>Authenticating...")
		} else {
			$('#loginwelcomemsg').fadeIn('slow');			
			$('#loginwelcomemsg').html("Hello noooooooooo!!!")
		}
		*/
	})
});