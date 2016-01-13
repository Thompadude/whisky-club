$(document).ready(function() {
	var testName, testEntry;
	
	$('#submit').click(function() {
		
		// If-statement to validate name and entry.
		if (document.getElementById("testName").value == ""
			|| document.getElementById("testEntry").value == "") {
			document.getElementById("testName").value = "ERROR!";
		} else {
		testName = $('#testName').val();
		testEntry = $('#testEntry').val();
		
			$.ajax( {
				type: 'POST',
				// passes values of name and entry to GuestbookServlet.
				data: {ajaxName : testName, ajaxEntry : testEntry},
				url: '../GuestbookServlet',
				
				success: function() {
					$('#reload').load("guestbook.jsp");
					document.getElementById("testName").value = "";
					document.getElementById("testEntry").value = "";
					}
			});
		}
	});
});