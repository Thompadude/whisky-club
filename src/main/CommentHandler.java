package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import guestbook.GuestbookHandler;
import whiskies.Whisky;
import whiskies.WhiskyHandler;

/**
 * Servlet implementation class CommentHandler
 */
@WebServlet("/CommentHandler")
public class CommentHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WhiskyHandler whiskyHandler;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentHandler() {
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
		
		String writtenComment = request.getParameter("theName");
		String currentwhiskyId = request.getParameter("whiskyId");

		if (writtenComment != null && writtenComment != "") {
			for (int i = 0; i < whiskies.size(); i++) {
				if (whiskies.get(i).getId().equals(currentwhiskyId)) {
					System.out.println("Kommentar: " + writtenComment + ", Whisky: " + whiskies.get(i));
					whiskies.get(i).addComment(writtenComment);
					System.out.println("Storlek på listan" + whiskies.get(i).getComments().size());
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
