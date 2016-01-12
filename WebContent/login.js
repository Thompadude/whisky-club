$(document).ready(function() {
	
	$('.jumbotron').fadeIn('slow');
	
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
			setTimeout(function(){runAjax()}, 1000);
		}
	});
	
	// Prints feedback to user to let it know we are processing the login information.
	function writeAuth() {
		// Caches a reference to the form before preventing default behavior.
		setTimeout(function(){}, 1000);
		
		userName = $('#usrName').val();
		password = $('#password').val();
		
		$('#loginwelcomemsg').fadeIn('slow');
		$('#loginwelcomemsg').html("Authenticating " + userName + "...");
	}
	
	// Authenticates the user name and password through the LoginServlet.
	function runAjax() {

		formName = $('#usrName').val();
		formPassword = $('#password').val();
		
		$.ajax({
			type: 'POST',
			url: 'LoginServlet',
			data: {ajaxUsrName : formName, ajaxPassword : formPassword},
			success: function(servletResponse) {
				$('#loginAuth').hide().fadeIn('slow').html(servletResponse);
				// Runs method to check where to redirect.
				setTimeout(function(){checkAuth(servletResponse)}, 1000);
			}
		});
	}
	
	// Checks if the response from the server was a success or a failure.
	function checkAuth(servletResponse) {
		if(servletResponse === "Login Successful!") {
			document.location.replace("index.jsp");
		} else {
			document.location.replace("login.jsp");
		}
	}

});