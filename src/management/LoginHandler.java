package management;

/**
 * Authenticates the information the client sends to the login servlet.
 */
public class LoginHandler {

	/**
	 * Handles information sent from the client and returns
	 * true or false depending on if that information is correct
	 * or not.
	 * 
	 * @param	usrName user name entered.
	 * @param	password password entered.
	 * @return	true if user name and password is correct, else false.
	 */
	public boolean authenticate(String usrName, String password) {
		if (usrName.equals("boss") && password.equals("boss")) {
			return true;
		} else {
			return false;
		}
	}

}