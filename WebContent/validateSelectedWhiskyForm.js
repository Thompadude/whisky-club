// Function to check if all text fields is correctly filled

document.forms["validate"].onsubmit = function() {
	// boolean if the validation is correct
	var valid = true;
	var validationMessage = 'Error: \n';

	// Validation for userName
	if (document.getElementById('uName').value.length == 0) {
		validationMessage = validationMessage
				+ '  - You need to write a name\n';
		document.getElementById('uName').style.boxShadow = "0 0 0 2px red inset";
		valid = false;
	} else {
		document.getElementById('uName').style.boxShadow = "none";
	}

	// Validation for comment
	if (document.getElementById('cmnt').value.length == 0) {
		validationMessage = validationMessage
				+ '  - You need to write a comment\n';
		document.getElementById('cmnt').style.boxShadow = "0 0 0 2px red inset";
		valid = false;
	} else {
		document.getElementById('cmnt').style.boxShadow = "none";
	}
	// If error is found, shows an alert pop-up.
	if (valid == false) {
		alert(validationMessage);
	}

	return valid;
}

document.forms["validate"].onreset = function () {
	document.getElementById('uName').style.boxShadow = "none";
	document.getElementById('cmnt').style.boxShadow = "none";
}