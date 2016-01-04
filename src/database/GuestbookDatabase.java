package database;

import java.util.ArrayList;

import management.GuestbookEntries;
import saveAndLoad.ReadFromFile;
import whiskies.Whisky;

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
	
	public ArrayList<GuestbookEntries> loadGuestbookEntries(String filePath) {
		ReadFromFile readFromFile = new ReadFromFile();
		entries = readFromFile.readGuestbookEntries(entries, filePath);
		if (entries == null) {
			entries = new ArrayList<GuestbookEntries>();
		}
		return entries;
	}

}