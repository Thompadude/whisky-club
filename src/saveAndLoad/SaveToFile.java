package saveAndLoad;


import whiskies.Whisky;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

import management.GuestbookEntries;

public class SaveToFile {

    private FileOutputStream fileOut;
    private ObjectOutputStream objOut;

    public void saveWhiskiesToFile(ArrayList<Whisky> whisky, String filePath) {

        try {
        	fileOut = new FileOutputStream(filePath);
            objOut = new ObjectOutputStream(fileOut);
            objOut.writeObject(whisky);
        } catch (Exception ex) {
            System.out.println("Couldn't save to file!");
        }
    }
    
    public void saveGuestbookToFile(ArrayList<GuestbookEntries> entries, String filePath) {

        try {
        	fileOut = new FileOutputStream(filePath);
            objOut = new ObjectOutputStream(fileOut);
            objOut.writeObject(entries);
        } catch (Exception ex) {
            System.out.println("Couldn't save to file!");
        }
    }
}