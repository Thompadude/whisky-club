$(document).ready(function() {
	var formName, formEntry;
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
	
	printEntries();
	
	$('#submit').click(function() {
		formName = $('#formName').val();
		formEntry = $('#formEntry').val();
		
			$.ajax( {
				type: 'POST',
				data: {ajaxName : formName, ajaxEntry : formEntry},
				url: 'GuestbookServlet',
				success: function(servletResponse) {					
					$('#entryDiv').html(servletResponse);
					$('#1').hide().fadeIn('slow');
					}
			});	
	});
});