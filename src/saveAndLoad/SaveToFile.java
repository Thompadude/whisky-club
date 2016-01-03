package saveAndLoad;


import whiskies.Whisky;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class SaveToFile {

    private FileOutputStream fileOut;
    private ObjectOutputStream objOut;

    public void saveToFile(ArrayList<Whisky> whisky, String filePath) {

        try {
        	fileOut = new FileOutputStream(filePath);
            objOut = new ObjectOutputStream(fileOut);
            objOut.writeObject(whisky);
        } catch (Exception ex) {
            System.out.println("Couldn't save to file!");
        }
    }
}