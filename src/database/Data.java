package database;

public class Data {

	private static WhiskyDatabase whiskyHandler = new WhiskyDatabase();

	public static WhiskyDatabase getWhiskyHandler() {
		return whiskyHandler;
	}	
	
}