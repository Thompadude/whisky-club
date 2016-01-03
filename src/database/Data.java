package database;

import whiskies.WhiskyHandler;

public class Data {

	private static WhiskyHandler whiskyHandler = new WhiskyHandler();

	public static WhiskyHandler getWhiskyHandler() {
		return whiskyHandler;
	}	
	
}