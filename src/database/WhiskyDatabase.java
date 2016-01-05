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
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveWhiskiesToFile(whiskies, filePath);
		}
		addAllWhiskies();
		return whiskies;
	}
	
	/**
	 * Adds hardcoded whiskies.
	 */
	public void addAllWhiskies() {
		Talisker talisker = new Talisker();
		LaphroaigQuarterCask laphroaigQuarterCask = new LaphroaigQuarterCask();
		Aberlour aberlour = new Aberlour();
		Dalwhinnie dalwhinnie = new Dalwhinnie();
		Glennfiddich glennfiddich = new Glennfiddich();
		Oban oban = new Oban();

		if(!whiskies.contains(talisker)) {
			this.whiskies.add(talisker);			
		}
		if(!whiskies.contains(laphroaigQuarterCask)) {
			this.whiskies.add(laphroaigQuarterCask);			
		}
		if(!whiskies.contains(aberlour)) {
			this.whiskies.add(aberlour);			
		}
		if(!whiskies.contains(dalwhinnie)) {
			this.whiskies.add(dalwhinnie);			
		}
		if(!whiskies.contains(glennfiddich)) {
			this.whiskies.add(glennfiddich);			
		}
		if(!whiskies.contains(oban)) {
			this.whiskies.add(oban);			
		}
	}
}