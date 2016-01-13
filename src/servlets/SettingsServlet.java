package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import database.GuestbookDatabase;
import database.WhiskyDatabase;
import management.GuestbookEntries;
import saveAndLoad.SaveToFile;
import whiskies.Whisky;

/**
 * Servlet implementation class SettingsServlet
 */
@WebServlet("/SettingsServlet")
public class SettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WhiskyDatabase whiskyDatabase;
	private GuestbookDatabase guestbookDatabase;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingsServlet() {
        super();
    }
    
    public void init() throws ServletException{
    	// Gets the database of the whiskies.
    	whiskyDatabase = Data.getWhiskyHandler();
    	
    	// Gets the database of the guestbook entries.
    	guestbookDatabase = Data.getGuestbookDatabase();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// Load the previous whiskies from the file.
		String filePathWhiskies = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyDatabase.loadWhiskies(filePathWhiskies);
		
		// Check if the user has choosen to reset whiskies. If so, value will be "reset".
		String resetAllWhiskies = request.getParameter("resetWhiskies");
		
		if(resetAllWhiskies != null && resetAllWhiskies.equals("reset")) {
			whiskies = whiskyDatabase.resetWhiskies();
			
			// Saves any changes to the file.
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveWhiskiesToFile(whiskies, filePathWhiskies);
			
			// Returns response
			RequestDispatcher dispatcher = request.getRequestDispatcher("settings.jsp");
			request.setAttribute("clearmessage", "Whiskies Cleared!");
			request.setAttribute("pathmessage", "File saved at:<br> " + filePathWhiskies);
			dispatcher.forward(request, response);
			
		}
		
		// Get the file path for previous guestbook entries and load them to the array list.
		String filePathGuestbook = getServletContext().getRealPath("/guestbookData.dat");
		ArrayList<GuestbookEntries> allEntries = guestbookDatabase.loadGuestbookEntries(filePathGuestbook);
		
		// Check if the user has choosen to reset guestbook entries. If so, value will be "reset".
		String resetAllGuestbookEntries = request.getParameter("resetGuestbook");
		
		if(resetAllGuestbookEntries != null && resetAllGuestbookEntries.equals("reset")) {
			allEntries = new ArrayList<>();
			
			// Save any changes to the file.
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveGuestbookToFile(allEntries, filePathGuestbook);
			
			// Returns response
			RequestDispatcher dispatcher = request.getRequestDispatcher("settings.jsp");
			request.setAttribute("clearmessage", "Guestbook Cleared!");
			request.setAttribute("pathmessage", "File saved at:<br> " + filePathGuestbook);
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
