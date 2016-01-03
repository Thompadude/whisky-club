package database;

import java.util.ArrayList;

import whiskies.Aberlour;
import whiskies.Dalwhinnie;
import whiskies.Glennfiddich;
import whiskies.LaphroaigQuarterCask;
import whiskies.Oban;
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
		this.whiskies.add(new Aberlour());
		this.whiskies.add(new Dalwhinnie());
		this.whiskies.add(new Glennfiddich());
		this.whiskies.add(new Oban());
	}

	public ArrayList<Whisky> getWhiskies() {
		return whiskies;
	}
}