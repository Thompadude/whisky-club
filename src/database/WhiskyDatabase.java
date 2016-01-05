package database;

import java.util.ArrayList;

import saveAndLoad.ReadFromFile;
import saveAndLoad.SaveToFile;
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

	private ArrayList<Whisky> whiskies;

	/**
	 * Loads a file with whiskies. If no file is found,
	 * adds all hardcoded whiskies.
	 */
	public ArrayList<Whisky> getWhiskies() {
		if (whiskies == null) {
			whiskies = new ArrayList<>();
			addAllWhiskies();
		}
		return whiskies;
	}
	
	public ArrayList<Whisky> loadWhiskies(String filePath) {
		ReadFromFile readFromFile = new ReadFromFile();
		whiskies = readFromFile.readWhisky(whiskies, filePath);
		if (whiskies == null) {
			whiskies = new ArrayList<>();
			addAllWhiskies();
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveWhiskiesToFile(whiskies, filePath);
		}
		return whiskies;
	}
	
	/**
	 * Adds hardcoded whiskies.
	 */
	public void addAllWhiskies() {
		this.whiskies.add(new Talisker());
		this.whiskies.add(new LaphroaigQuarterCask());
		this.whiskies.add(new Aberlour());
		this.whiskies.add(new Dalwhinnie());
		this.whiskies.add(new Glennfiddich());
		this.whiskies.add(new Oban());
	}
}