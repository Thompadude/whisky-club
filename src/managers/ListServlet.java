package managers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Data;
import database.WhiskyDatabase;
import whiskies.Whisky;

/**
 * Servlet implementation class ListHandler
 */
@WebServlet("/ListHandler")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WhiskyDatabase whiskyHandler;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
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
		// Gets the database of whiskies.
				
		ArrayList<Whisky> whiskies = whiskyHandler.getWhiskies();
		
		// TODO add comment about what this do
		String userWhiskyChoice = request.getParameter("whisky");
		
		// For testing purposes.
		System.out.println(userWhiskyChoice);
		
		HttpSession session = request.getSession();
		
		for (int i = 0; i < whiskies.size(); i++) {
			if (whiskies.get(i).getId().equals(userWhiskyChoice)) {
				response.sendRedirect("selectedWhisky.jsp");
				session.setAttribute("chosenWhisky", whiskies.get(i));
				session.setAttribute("commentsKey", whiskies.get(i).getComments());
			} else {
				System.out.println("Something was terribly wrong with what you just did!");
			}
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
