package guestbook;

import java.util.ArrayList;
import java.util.List;

public class GuestbookHandler {

	private List<String> entries = new ArrayList<String>();

	public List<String> getEntries() {
		return entries;
	}

	public void addEntry(String entry) {
		if (this.entries == null) {
			this.entries = new ArrayList<String>();
		}
		this.entries.add(entry);
	}

}