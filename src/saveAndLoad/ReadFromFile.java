package saveAndLoad;

import whiskies.Whisky;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import management.GuestbookEntries;

/**
 * Reads the Whisky and the GuestbookEntries objects to a file.
 */
public class ReadFromFile {

	private FileInputStream fileIn;
	private ObjectInputStream objIn;

	/**
	 * Takes the argument containing Whisky objects, reads other Whisky objects
	 * from the file and returns a combined array list.
	 * 
	 * @param	whisky the list we want to add the objects from the file to.
	 * @param	filePath the file path to where the file is stored.
	 * @return	the array list with the whiskies from the file and the @param whisky.
	 */
	public ArrayList<Whisky> readWhisky(ArrayList<Whisky> whisky, String filePath) {
		try {
			fileIn = new FileInputStream(filePath);
			objIn = new ObjectInputStream(fileIn);

			whisky = (ArrayList<Whisky>) objIn.readObject();
		} catch (Exception e) {
			System.out.println("File not found.");
		}
		return whisky;
	}

	/**
	 * Takes the argument containing the guestbook entry objects, reads the other entry objects
	 * from the file and returns a combined array list.
	 * 
	 * @param	entries is the list we want to add the entries from the file to.
	 * @param	filePath filePath the file path to where the file is stored.
	 * @return	the array list with the entries from the file and the @param entries.
	 */
	public ArrayList<GuestbookEntries> readGuestbookEntries(ArrayList<GuestbookEntries> entries, String filePath) {
		try {
			fileIn = new FileInputStream(filePath);
			objIn = new ObjectInputStream(fileIn);

			entries = (ArrayList<GuestbookEntries>) objIn.readObject();
		} catch (Exception e) {
			System.out.println("File not found.");
		}
		return entries;
	}

}