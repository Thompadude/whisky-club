package database;

public class Data {

	private static WhiskyDatabase whiskyDatabase = new WhiskyDatabase();

	public static WhiskyDatabase getWhiskyHandler() {
		return whiskyDatabase;
	}	
	
}