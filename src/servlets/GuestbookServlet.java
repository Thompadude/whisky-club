package servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import database.GuestbookDatabase;
import management.GuestbookEntries;
import saveAndLoad.SaveToFile;

/**
 * Servlet implementation class GuestBook
 */
@WebServlet("/Guestbook")
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GuestbookDatabase guestbookDatabase;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestbookServlet() {
        super();
    }
    
    public void init() throws ServletException{    	
    	guestbookDatabase = Data.getGuestbookDatabase();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve new guestbook entry from guestbook.jsp
		String entry = request.getParameter("cmnt");
		String name = request.getParameter("Name");
		LocalDate localDate = LocalDate.now();
		String todaysDate = localDate.toString();
		
		GuestbookEntries guestbookEntry = new GuestbookEntries(name, entry, todaysDate);
		
		// Get filepath for all guestbook entries.
		String filePath = getServletContext().getRealPath("/guestbookData.dat");
		
		ArrayList<GuestbookEntries> allEntries = guestbookDatabase.getEntries(filePath);		
		
		// Adds the entry to the guestbook.		
		guestbookDatabase.addEntry(guestbookEntry);
		
		// setAttribute for use in .jsp
		//request.getSession().setAttribute("guestbook", guestbookDatabase.getEntries(filePath));
		request.getSession().setAttribute("guestbook", allEntries);
		
		SaveToFile saveToFile = new SaveToFile();
		saveToFile.saveGuestbookToFile(allEntries, filePath);
				
		// Send user to guestbook page to view all the entries.
		response.sendRedirect("guestbook/guestbookform.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
