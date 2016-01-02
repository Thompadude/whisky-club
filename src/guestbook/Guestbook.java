package guestbook;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuestBook
 */
@WebServlet("/Guestbook")
public class Guestbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GuestbookHandler guestbookHandler;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Guestbook() {
        super();
    }
    
    public void init() throws ServletException{    	
    	this.guestbookHandler = new GuestbookHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve new guestbook entry from guestbook.jsp
		String guestbookEntry = request.getParameter("entry");
		
		// Adds the entry to the guestbook.
		this.guestbookHandler.addEntry(guestbookEntry);
		
		// setAttribute for use in .jsp
		request.setAttribute("guestbook", this.guestbookHandler);
		
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
