package management;

/**
 * Gathers all guestbook entries.
 */
public class GuestbookEntries implements java.io.Serializable {

	private String name;
	private String entry;
	private String date;

	/**
	 * Constructs a guestbook entry.
	 * 
	 * @param name is the author of the entry.
	 * @param entry is the entry/comment.
	 * @param date is the date the entry was written.
	 */
	public GuestbookEntries(String name, String entry, String date) {
		this.name = name;
		this.entry = entry;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEntry() {
		return entry;
	}

	public void setEntry(String entry) {
		this.entry = entry;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}