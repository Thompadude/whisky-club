$(document).ready(function() {
	var guestbookName, guestbookEntry;
	
	$('#submit').click(function() {
		
		// If-statement to validate name and entry.
		if (document.getElementById("guestbookName").value == ""
			|| document.getElementById("guestbookEntry").value == "") {
			document.getElementById("guestbookName").value = "ERROR!";
		} else {
		guestbookName = $('#guestbookName').val();
		guestbookEntry = $('#guestbookEntry').val();
		
			$.ajax( {
				type: 'POST',
				// passes values of name and entry to GuestbookServlet.
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