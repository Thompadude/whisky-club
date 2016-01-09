package saveAndLoad;

import whiskies.Whisky;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import management.GuestbookEntries;

/**
 * Writes the Whisky and the GuestbookEntries objects to the file.
 */
public class SaveToFile {

	private FileOutputStream fileOut;
	private ObjectOutputStream objOut;

	/**
	 * Takes the argument containing the Whisky objects and saves them to the file.
	 * 
	 * @param whisky is the objects to be saved.
	 * @param filePath the file path to where the file will be stored.
	 */
	public void saveWhiskiesToFile(ArrayList<Whisky> whisky, String filePath) {
		try {
			fileOut = new FileOutputStream(filePath);
			objOut = new ObjectOutputStream(fileOut);
			objOut.writeObject(whisky);
			System.out.println("File saved at: " + filePath);
		} catch (Exception ex) {
			System.out.println("Couldn't save to file!");
		}
	}

	/**
	 * Takes the argument containing the guestbook entries and saves them to the file.
	 * 
	 * @param entries is the entries to be saved.
	 * @param filePath the file path to where the file will be stored.
	 */
	public void saveGuestbookToFile(ArrayList<GuestbookEntries> entries, String filePath) {
		try {
			fileOut = new FileOutputStream(filePath);
			objOut = new ObjectOutputStream(fileOut);
			objOut.writeObject(entries);
			System.out.println("File saved at: " + filePath);
		} catch (Exception ex) {
			System.out.println("Couldn't save to file!");
		}
	}

}