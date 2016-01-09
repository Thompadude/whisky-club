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
 * Serves as a database for all whiskies.
 */
public class WhiskyDatabase {

	private ArrayList<Whisky> whiskies;

	public ArrayList<Whisky> getWhiskies() {
		if (whiskies == null) {
			whiskies = new ArrayList<>();
			addAllWhiskies();
		}
		return whiskies;
	}

	/**
	 * Loads all whiskies from a file. If no whiskies are found in the
	 * file, creates new whiskies.
	 * 
	 * @see addAllWhiskies()
	 * @param	filePath the file path to where to file is stored.
	 * @return	the whisky objects stored in the file.
	 */
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
	 * Add all hardcoded whiskes to this array list.
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