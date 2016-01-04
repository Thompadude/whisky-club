package saveAndLoad;

import whiskies.Whisky;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;

public class ReadFromFile {

    private FileInputStream fileIn;
    private ObjectInputStream objIn;

    public ArrayList<Whisky> readWhisky(ArrayList<Whisky> whisky, String filePath) {
        try {
            fileIn = new FileInputStream(filePath);
            objIn = new ObjectInputStream(fileIn);

            whisky = (ArrayList<Whisky>) objIn.readObject();
        } catch (Exception e) {
            System.out.println("Error! Couldn't load file.");
        }
        return whisky;
    }
}