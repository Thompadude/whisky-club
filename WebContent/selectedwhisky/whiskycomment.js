$(document).ready(function() {	

	// Check the form's inputs and text areas and flashes them if empty. Also displays a error message.
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
	 */
	$("#submit").click(function() {
		
		// Number to keep track of comments in order to create fadeIn-effect on latest comment.
		var commentCounter = $('#commentsize').val();
		
		// Check if the form inputs is valid.
		if (validateForm()){
		$('#result').fadeOut('slow');
		formName = $('#formName').val();
		formComment = $('#formComment').val();
		
			$.ajax( {
				type: 'POST',
				// Passes the values of name and comment to CommentServlet.
				data: {ajaxSelWhiskyName : formName, ajaxSelWhiskyComment : formComment},
				url: '../CommentServlet',			
				success: function() {					
					// Print the response into commentDiv.
					$('#commentDiv').load(
							document.URL +  ' #commentDiv', function() {
								$(window).scrollTop($('#formHeadline').offset().top)
								$('#fade' + commentCounter).hide().fadeIn('slow')
								}
							);
					$('form').trigger("reset");
					},
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
			// Pass the values of comment id to CommentServlet.
			data: {ajaxIdNumber : idNumber},
			url: '../CommentServlet',
			success: function() {
				// Prints the response into commentDiv.
				$('#commentDiv').load(document.URL +  ' #commentDiv')
			}})	}, 500);		
	});
	
});