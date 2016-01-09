package database;

/**
 * An assemblage of all the data objects. The methods in this class is static
 * to ensure to always refer to the same data.
 */
public class Data {

	private static WhiskyDatabase whiskyDatabase = new WhiskyDatabase();
	private static GuestbookDatabase guestbookDatabase = new GuestbookDatabase();

	/**
	 * @return the WhiskyDatabase object containing all whiskies objects.
	 */
	public static WhiskyDatabase getWhiskyHandler() {
		return whiskyDatabase;
	}

	/**
	 * @return the GusebookDatabase object containing all guestbook entries.
	 */
	public static GuestbookDatabase getGuestbookDatabase() {
		return guestbookDatabase;
	}

}