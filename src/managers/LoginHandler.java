package managers;

public class LoginHandler {

	/**
	 * @param usrName is the name the user tries to login with.
	 * @param password is the password the user tries to login with.
	 * @return true if user enter valid login information.
	 */
	public boolean authenticate(String usrName, String password) {
		if (usrName.equals("boss") && password.equals("boss")) {
			return true;
		} else {
			return false;
		}
	}

}