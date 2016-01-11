package database;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import saveAndLoad.ReadFromFile;
import saveAndLoad.SaveToFile;
import whiskies.Aberlour;
import whiskies.Amrut;
import whiskies.Balvenie;
import whiskies.Dalwhinnie;
import whiskies.Glennfiddich;
import whiskies.HighlandPark;
import whiskies.Jura;
import whiskies.LaphroaigQuarterCask;
import whiskies.Oban;
import whiskies.RoyalLochnagar;
import whiskies.Springbank;
import whiskies.Talisker;
import whiskies.Whisky;

/**
 * Serves as the database for all whiskies.
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
	 * Loads all the whiskies from a file. If no whiskies are found in the
	 * file, creates new whiskies.
	 * 
	 * @see		addAllWhiskies()
	 * @param	filePath the file path to where the file is stored.
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
	 * Add all the hardcoded whiskes to this array list.
	 */
	public void addAllWhiskies() {
		this.whiskies.add(new Talisker());
		this.whiskies.add(new LaphroaigQuarterCask());
		this.whiskies.add(new Aberlour());
		this.whiskies.add(new Dalwhinnie());
		this.whiskies.add(new Glennfiddich());
		this.whiskies.add(new Oban());
		this.whiskies.add(new Amrut());
		this.whiskies.add(new Springbank());
		this.whiskies.add(new RoyalLochnagar());
		this.whiskies.add(new Balvenie());
		this.whiskies.add(new HighlandPark());
		this.whiskies.add(new Jura());		
		
		 // Bubble sorting all whiskies to make them appear in alphabetic order.
		for (int i = 0; i < whiskies.size(); i++) {
			for (int j = i+1; j < whiskies.size(); j++) {
				if (whiskies.get(i).getName().compareTo(whiskies.get(j).getName()) > 0) {
					Whisky tempWhisky = whiskies.get(j);
					whiskies.set(j, whiskies.get(i));
					whiskies.set(i, tempWhisky);
				}
			}
		}
	}
	
	public ArrayList<Whisky> resetWhiskes() {
		this.whiskies = new ArrayList<>();
		addAllWhiskies();
		return whiskies;
	}

}