package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet("/GuestbookServlet")
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
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		// Get filepath for all guestbook entries.
		String filePath = getServletContext().getRealPath("/guestbookData.dat");
		
		ArrayList<GuestbookEntries> allEntries = guestbookDatabase.loadGuestbookEntries(filePath);

		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("ajaxName");
		String entry = request.getParameter("ajaxEntry");
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM YYYY HH:mm");
		String todaysDate = localDateTime.format(formatter).toString();

		if (name == null || entry == null) {
			for(int i = guestbookDatabase.getEntries().size()-1; i >= 0; i--) {
				out.println("<div class=\"row\"><div class=\"col-lg-11\"><p>" + guestbookDatabase.getEntries().get(i).getName() + "<br>");
				out.println(guestbookDatabase.getEntries().get(i).getDate() + "</p>");
				out.println("<h4>" + guestbookDatabase.getEntries().get(i).getEntry() + "</h4></div>"
							+ "<div class=\"col-lg-1\"></div></div>");
			}
		} else {
		GuestbookEntries newEntry = new GuestbookEntries(name, entry, todaysDate);
		
		guestbookDatabase.addEntry(newEntry);
		
		for(int i = guestbookDatabase.getEntries().size()-1; i >= 0; i--) {
			out.println("<div class=\"row\" id=\"" + (guestbookDatabase.getEntries().size()-i) + "\"><div class=\"col-lg-11\"><p>" + guestbookDatabase.getEntries().get(i).getName() + "<br>");
			out.println(guestbookDatabase.getEntries().get(i).getDate() + "</p>");
			out.println("<h4>" + guestbookDatabase.getEntries().get(i).getEntry() + "</h4></div>"
						+ "<div class=\"col-lg-1\"></div></div>");
		}
		
		SaveToFile saveToFile = new SaveToFile();
		saveToFile.saveGuestbookToFile(allEntries, filePath);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
