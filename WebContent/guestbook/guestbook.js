$(document).ready(function() {
	var idEntryNumber;
	
	// Check the form's inputs and text areas and flashes them if empty. Also displays a error message.
	var validateForm = function(){
		var isFieldsFilled = true;
		$('input, textarea').each(function(index){
			if ($(this).val() === '' || $(this).val() === null) {
				isFieldsFilled = false;
				$(this).fadeOut().fadeIn();
				$('#result').css({'color' : 'red', 'margin-top' : '15%'});
				$('#result').html("&nbsp;&nbsp;Please fill in all forms!").hide().fadeIn('normal');
				isFieldsFilled = false;
			}
		});
		return isFieldsFilled;
	}
	
	var guestbookName, guestbookEntry;
	
	$('#submit').click(function() {
		// Number to keep track of entries in order to create fadeIn-effect on latest entry.
		var guestbookCounter = $('#guestbookSize').val();
		
		// Check if the form inputs is valid.
		if (validateForm()) {
		$('#result').fadeOut('slow');
		guestbookName = $('#guestbookName').val();
		guestbookEntry = $('#guestbookEntry').val();
		
			$.ajax( {
				type: 'POST',
				// Passes values of the name and entry to GuestbookServlet.
				data: {ajaxName : guestbookName, ajaxEntry : guestbookEntry},
				url: '../GuestbookServlet',
				success: function() {
					// Refresh content and reset the form.
					$('#guestbookDiv').load(
							document.URL +  ' #guestbookDiv', function() {
								$('#newEntry' + guestbookCounter).hide().fadeIn('slow')
							});
					$('form').trigger("reset");
					}
			});
		}
	});
	
	/*
	 * $(document).on("click", ".deleteEntry", function(event) is to make buttons inside
	 * a loaded entry from another ajax call 'live', and be able to use these buttons
	 * in this ajax call.
	 * event.preventDefault(); is called to disable the <a href=""> .
	 */
	$(document).on("click", ".deleteEntry", function(event) {
		event.preventDefault();
		
		idEntryNumber = $(this).attr('id');
		$('#newEntry' + idEntryNumber).fadeOut('slow');
		
		setTimeout(function() {
		$.ajax({	
			type: 'POST',
			// Pass the values of the entry id to the GuestbookServlet.
			data: {ajaxIdEntryNumber : idEntryNumber},
			url: '../GuestbookServlet',
			
			success: function() {
				// Refresh guestbookDiv content.
				$('#guestbookDiv').load(document.URL +  ' #guestbookDiv');
			}})	}, 500);		
	});
	
});