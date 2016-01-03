package managers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import database.WhiskyDatabase;
import guestbook.GuestbookHandler;
import whiskies.Whisky;

/**
 * Servlet implementation class CommentHandler
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WhiskyDatabase whiskyHandler;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
    	whiskyHandler = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		ArrayList<Whisky> whiskies = whiskyHandler.getWhiskies();
		
		String userName = request.getParameter("userName");
		String writtenComment = request.getParameter("comment");
		String currentwhiskyId = request.getParameter("whiskyId");

		if (writtenComment != null && writtenComment != "") {
			for (int i = 0; i < whiskies.size(); i++) {
				if (whiskies.get(i).getId().equals(currentwhiskyId)) {
					System.out.println("Kommentar: " + writtenComment + ", Whisky: " + whiskies.get(i));
					whiskies.get(i).addComment(writtenComment);
					System.out.println("Storlek p� listan" + whiskies.get(i).getComments().size());
				}
			}
			response.sendRedirect("list.jsp");
		} else {
			System.out.println("Ay Caramba!!");
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
