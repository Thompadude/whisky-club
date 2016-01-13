$(document).ready(function() {
	var formName, formComment;
	
	/*
	 * Function to post a new whisky comment.
	 * If-statement to check that submit doesn't pass an comment without
	 * name or message.
	 * Ajax passes the values of the comment to the CommentServlet, which
	 * responds with the html that passes into the commentdiv, with a fadeIn.
	 * Finally the function clears the name and comment.
	 * 
	 */
	$('#submit').click(function() {
		
		// If-statement to validate name and comment.
		if (document.getElementById("formName").value == ""
			|| document.getElementById("formComment").value == "") {
			document.getElementById("formName").value = "ERROR!";
		} else {
		formName = $('#formName').val();
		formComment = $('#formComment').val();
		
			$.ajax( {
				type: 'POST',
				// passes values of name and comment to CommentServlet.
				data: {ajaxSelWhiskyName : formName, ajaxSelWhiskyComment : formComment},
				url: '../CommentServlet',
				
				success: function() {					
					//prints the response into commentDiv.
					$('#commentDiv').load(document.URL +  ' #commentDiv');
					//fading in the last entry to the page.
					$('#1').hide().fadeIn('slow');
					//clears the name and entry values
					document.getElementById("formName").value = "";
					document.getElementById("formComment").value = "";
					}
			});
		}
	});
});