package main;

/**
 * Handles security.
 */

public class LoginHandler {

	public boolean authenticate(String usrName, String password) {
		if (usrName.equals("boss") && password.equals("boss")) {
			return true;
		} else {
			return false;
		}
	}

}