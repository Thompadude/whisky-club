package whiskies;

import java.util.ArrayList;

/**
 * Class serves as a database for all whiskies.
 */

public class WhiskyHandler {

	private ArrayList<Whisky> whiskies = new ArrayList<>();

	public WhiskyHandler() {
		this.whiskies.add(new Talisker());
		this.whiskies.add(new LaphroaigQuarterCask());
	}

	public ArrayList<Whisky> getWhiskies() {
		return whiskies;
	}
}