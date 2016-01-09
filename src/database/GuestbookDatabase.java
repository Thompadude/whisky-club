package database;

import java.util.ArrayList;
import management.GuestbookEntries;
import saveAndLoad.ReadFromFile;

/**
 * Serves as the database for all the guestbook entries.
 */
public class GuestbookDatabase {

	private ArrayList<GuestbookEntries> entries;

	public ArrayList<GuestbookEntries> getEntries() {
		if (entries == null) {
			entries = new ArrayList<GuestbookEntries>();
		}
		return entries;
	}

	public void addEntry(GuestbookEntries entry) {
		if (this.entries == null) {
			this.entries = new ArrayList<GuestbookEntries>();
		}
		this.entries.add(entry);
	}

	/**
	 * Loads the previous guestbook entries from a file.
	 * 
	 * @param	filePath the file path to where the file is stored.
	 * @return	the guestbook entries stored in the file.
	 */
	public ArrayList<GuestbookEntries> loadGuestbookEntries(String filePath) {
		ReadFromFile readFromFile = new ReadFromFile();
		entries = readFromFile.readGuestbookEntries(entries, filePath);
		if (entries == null) {
			entries = new ArrayList<GuestbookEntries>();
		}
		return entries;
	}

}