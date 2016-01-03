// Function to check if all textfields is correctly filled

document.forms["validate"].onsubmit = function()
    {
        // boolean if the validation is correct
        var valid = true;
        var validationMessage = 'Error: \n';

        // Validation for userName
        if (document.getElementById('uName').value.length == 0)
        {
            validationMessage = validationMessage + '  - You need to write a name\n';
            valid = false;
        }
        
        // Validation for comment
        if (document.getElementById('cmnt').value.length == 0)
        {
            validationMessage = validationMessage + '  - You need to write a comment\n';
            valid = false;
        }
        // If error is found, shows the alertbox
        if (valid == false)
        {
            alert(validationMessage);
        }
        
        return valid;
    }