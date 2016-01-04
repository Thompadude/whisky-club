package database;

public class Data {

	private static WhiskyDatabase whiskyDatabase = new WhiskyDatabase();
	private static GuestbookDatabase guestbookDatabase = new GuestbookDatabase();
	
	public static WhiskyDatabase getWhiskyHandler() {
		return whiskyDatabase;
	}
	
	public static GuestbookDatabase getGuestbookDatabase() {
		return guestbookDatabase;
	}
	
}