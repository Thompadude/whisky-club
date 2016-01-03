package database;

import java.util.ArrayList;

import whiskies.LaphroaigQuarterCask;
import whiskies.Talisker;
import whiskies.Whisky;

/**
 * Class serves as a database for all whiskies.
 */

public class WhiskyDatabase {

	private ArrayList<Whisky> whiskies = new ArrayList<>();

	public WhiskyDatabase() {
		this.whiskies.add(new Talisker());
		this.whiskies.add(new LaphroaigQuarterCask());
	}

	public ArrayList<Whisky> getWhiskies() {
		return whiskies;
	}
}