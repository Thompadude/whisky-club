$(document).ready(function() {
	$('#loginjumobtron').fadeIn('slow');
	var ajaxUsrName, ajaxPassword, userName, password;
	$('#submit').click(function() {
		
		writeAuth();
		
		// client-sided check if any field is empty.
		if((userName === "" || userName === null) ||
			(password === "" || password === null)) {
				$('#loginwelcomemsg').html("");
				$('#errormsg').html("Please enter a username/password.");
		
		}else {
			// remove error message if user passed if-statement.
			$('#errormsg').html("");
			// runs the ajax method with 2 seconds delay.
			setTimeout(function(){runAjax()}, 2000);
		}
	});
	
	// Prints message of the username
	function writeAuth() {
		// Caches a reference to the form before preventing default behavior.
		//$('#loginjumobtron').fadeOut(2000);
		setTimeout(function(){}, 3000);
		
		userName = $('#usrName').val();
		password = $('#password').val();
		
		$('#loginwelcomemsg').fadeIn('slow');
		$('#loginwelcomemsg').html("Authenticating " + userName + "...");
	}
	
	// Runs the username and password through the LoginServlet to check authentication.
	function runAjax() {
		formName = $('#usrName').val();
		formPassword = $('#password').val();
		
		$.ajax({
			type: 'POST',
			url: 'LoginServlet',
			data: {ajaxUsrName : formName, ajaxPassword : formPassword},
			success: function(servletResponse) {
				$('#loginAuth').html(servletResponse);
				// runs method to check where to redirect.
				setTimeout(function(){checkAuth(servletResponse)}, 1000);
			}
		});
	}
	
	// checks if the response from the server was a success or a failure.
	function checkAuth(servletResponse) {
		if(servletResponse === "Login Successful!") {
			document.location.replace("index.jsp");
		} else {
			document.location.replace("login.jsp");
		}
	}
});