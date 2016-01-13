$(document).ready(function() {
	
	/**
	 * Checks the form for the empty inputs and textareas
	 * and flashes them if so. Also displays a error message.
	 */
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
	
	var guestbookName, guestbookEntry;
	
	$('#submit').click(function() {
		
		// Check if the form is valid for submit.
		if (validateForm()) {
		guestbookName = $('#guestbookName').val();
		guestbookEntry = $('#guestbookEntry').val();
		
			$.ajax( {
				type: 'POST',
				// Passes values of the name and entry to GuestbookServlet.
				data: {ajaxName : guestbookName, ajaxEntry : guestbookEntry},
				url: '../GuestbookServlet',
				
				success: function() {
					$('#reload').load(document.URL +  ' #reload');
					document.getElementById("guestbookName").value = "";
					document.getElementById("guestbookEntry").value = "";
					}
			});
		}
	});
});