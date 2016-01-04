package database;

import java.util.ArrayList;

import management.GuestbookEntries;

public class GuestbookDatabase implements java.io.Serializable {

	private ArrayList<GuestbookEntries> entries;

	public ArrayList<GuestbookEntries> getEntries() {
		if (entries != null) {
			return entries;
		} else {
			return new ArrayList<GuestbookEntries>();
		}
	}

	public void addEntry(GuestbookEntries entry) {
		if (this.entries == null) {
			this.entries = new ArrayList<GuestbookEntries>();
		} 
		this.entries.add(entry);
	}

}