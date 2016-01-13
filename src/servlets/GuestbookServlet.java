package servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Data;
import database.GuestbookDatabase;
import management.GuestbookEntries;
import saveAndLoad.SaveToFile;

/**
 * Servlet implementation class GuestbookServlet
 */
@WebServlet("/GuestbookServlet")
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GuestbookDatabase guestbookDatabase;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestbookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
    	// Gets the database of the whiskies.
    	guestbookDatabase = Data.getGuestbookDatabase();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		// Get the file path for previous guestbook entries and load them to the array list.
		String filePath = getServletContext().getRealPath("/guestbookData.dat");
		ArrayList<GuestbookEntries> allEntries = guestbookDatabase.loadGuestbookEntries(filePath);

		// Get the the user's name and guestbook entry from AJAX.
		String name = request.getParameter("ajaxName");
		String entry = request.getParameter("ajaxEntry");
		
		// Create today's date and time and convert to String.
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM YYYY HH:mm");
		String todaysDate = localDateTime.format(formatter).toString();
		
		// If guestbook form is empty - load all previous entries.
		if (name != null && entry != null) {
			GuestbookEntries newEntry = new GuestbookEntries(name, entry, todaysDate);
			allEntries.add(newEntry);
			
			// Save any changes to the file.
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveGuestbookToFile(allEntries, filePath);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}