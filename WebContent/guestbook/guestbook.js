$(document).ready(function() {
	var idEntryNumber;
	
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
	
	/*
	 * $(document).on("click", ".deleteEntry", function(event) is to make buttons inside
	 * a loaded entry from another ajax call 'live', and be able to use these buttons
	 * in this ajax call.
	 * event.preventDefault(); is called to disable the <a href=""> .
	 * 
	 */
	
	$(document).on("click", ".deleteEntry", function() {
		
		idEntryNumber = $(this).attr('id');
		
		$.ajax({	
			type: 'POST',
			// passes values of entry id to GuestbookServlet.
			data: {ajaxIdEntryNumber : idEntryNumber},
			url: '../GuestbookServlet',
			
			success: function() {
				//prints the response into the reload div.
				$('#reload').load(document.URL +  ' #reload');
			}
			
		});		
	});
});