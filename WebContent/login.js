$(document).ready(function() {	
	$('#loginjumobtron').fadeIn('slow');
	var ajaxUsrName, ajaxPassword, userName, message;
	var timeOut;
	

	
	$('#submit').click(function() {
		
		writeAuth();
		setTimeout(function(){runAjax()}, 2000);
	});
	
	function writeAuth() {
		// Caches a reference to the form before preventing default behavior.
		$('#loginjumobtron').fadeOut(2000);
		setTimeout(function(){
		}, 3000
		);
		userName = $('#usrName').val();
		
		$('#loginwelcomemsg').fadeIn('slow');
		$('#loginwelcomemsg').html("Authenticating " + userName + "...");
	}
	
	function runAjax() {
		formName = $('#usrName').val();
		formPassword = $('#password').val();
		$.ajax({
			type: 'POST',
			url: 'LoginServlet',
			data: {ajaxUsrName : formName, ajaxPassword : formPassword},
			success: function(servletResponse) {
				$('#loginAuth').html(servletResponse);
				setTimeout(function(){checkAuth(servletResponse)}, 1000);
				}
			});
	}
	
	function checkAuth(servletResponse) {
		if(servletResponse === "Login Successful!") {
			document.location.replace("index.jsp");
		} else {
			location.replace("login.jsp");
		}
	}
	
	/*
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
		$('#loginwelcomemsg').html("Authenticating " + userName + "...");
		/*
		if (validation === "true"){
			$('#loginwelcomemsg').fadeIn('slow');
			$('#loginwelcomemsg').html("Hello, " + userName + "!<br>Authenticating...")
		} else {
			$('#loginwelcomemsg').fadeIn('slow');			
			$('#loginwelcomemsg').html("Hello noooooooooo!!!")
		}
	})
 */
});