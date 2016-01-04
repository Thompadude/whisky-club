package servlets;

import java.util.ArrayList;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import database.GuestbookDatabase;
import management.GuestbookEntries;

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
		
		// Adds the entry to the guestbook.		
		guestbookDatabase.addEntry(guestbookEntry);
		
		// setAttribute for use in .jsp
		request.getSession().setAttribute("guestbook", guestbookDatabase.getEntries());
				
		// Send user to guestbook page to view all the entries.
		response.sendRedirect("guestbook/guestbook.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
