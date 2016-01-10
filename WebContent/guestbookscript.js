$(document).ready(function() {
	var formName, formEntry;
	
	/* 
	 * Prints out all guestbook entries.
	 * Runs through the GuestbookServlet which responds with
	 * the print of all saved entries to the entrydiv.
	*/	
	var printEntries = function() {
			var xhttp = new XMLHttpRequest();
			
			xhttp.open("GET", "GuestbookServlet", true);
			
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					document.getElementById("entryDiv").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.send();
		}
	
	// Runs the function to load all past entries to the webpage.
	printEntries();

	
	/*
	 * Function to post a new guestbook entry.
	 * If-statement to check that submit doesn't pass an entry without
	 * name or message.
	 * Ajax passes the values of the entry to the GuestbookServlet, which
	 * responds with the html that passes into the entrydiv, with a fadeIn.
	 * Finally the function clears the name and entry.
	 * 
	 */
	$('#submit').click(function() {
		
		// If-statement to validate name and entry.
		if (document.getElementById("formName").value == ""
			|| document.getElementById("formEntry").value == "") {
			document.getElementById("formName").value = "ERROR!";
		} else {
		formName = $('#formName').val();
		formEntry = $('#formEntry').val();
		
			$.ajax( {
				type: 'POST',
				// passes values of name and entry to GuestbookServlet.
				data: {ajaxName : formName, ajaxEntry : formEntry},
				url: 'GuestbookServlet',
				
				success: function(servletResponse) {					
					//prints the response into entryDiv.
					$('#entryDiv').html(servletResponse);
					//fading in the last entry to the page.
					$('#1').hide().fadeIn('slow');
					//clears the name and entry values
					document.getElementById("formName").value = "";
					document.getElementById("formEntry").value = "";
					}
			});
		}
	});
});