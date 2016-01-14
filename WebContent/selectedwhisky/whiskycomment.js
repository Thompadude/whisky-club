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
				$('#result').css({'color' : 'red', 'margin-top' : '25%'});
				$('#result').hide().fadeIn('slow').html("Please fill in all forms!").hide().fadeIn('normal');
				isFieldsFilled = false;
			}
		});
		return isFieldsFilled;
	}
	
	var formName, formComment, idNumber;
	
	/*
	 * Function to post a new whisky comment.
	 * Ajax passes the values of the comment to the CommentServlet, which
	 * responds with the html that passes into the commentdiv, with a fadeIn.
	 * Finally the function clears the name and comment.
	 * 
	 */
	$("#submit").click(function() {
		// If-statement to validate name and comment.
		if (validateForm()){
		$('#result').fadeOut('slow');
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
	
	/*
	 * $(document).on("click", ".deleteComment", function(event) is to make buttons inside
	 * a loaded entry from another ajax call 'live', and be able to use these buttons
	 * in this ajax call.
	 * event.preventDefault(); is called to disable the <a href=""> .
	 */
	$(document).on("click", ".deleteComment", function(event) {
		event.preventDefault();
		
		idNumber = $(this).attr('id');
		$('#fade' + idNumber).fadeOut('slow');
		
		setTimeout(function() {
		$.ajax({	
			type: 'POST',
			// passes values of comment id to CommentServlet.
			data: {ajaxIdNumber : idNumber},
			url: '../CommentServlet',
			
			success: function() {
				//prints the response into commentDiv.
				$('#commentDiv').load(document.URL +  ' #commentDiv');
			}})	}, 500);		
	});
	
});