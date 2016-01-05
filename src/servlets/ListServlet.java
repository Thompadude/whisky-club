package servlets;

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
import saveAndLoad.SaveToFile;
import whiskies.Whisky;

/**
 * Servlet implementation class ListHandler
 */
@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WhiskyDatabase whiskyHandler;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
    }
    
    public void init() throws ServletException{    	
    	whiskyHandler = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Gets the database of whiskies.
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyHandler.loadWhiskies(filePath);
		
		// Get user whisky choice from list.jsp
		String userWhiskyChoice = request.getParameter("whisky");
		
		/*
		 * Get which comment user wants to remove.
		 * If-statement to check if user wanted to remove comment,
		 * or used servlet as redirection.
		 */
		String commentNrAsString = request.getParameter("deleteWhiskyCommentItemNr");
		int commentNrAsInt;
		if (commentNrAsString != null) {
			commentNrAsInt = Integer.parseInt(commentNrAsString);			
		} else {
			commentNrAsInt = 999999;
		}
		
		
		
		HttpSession session = request.getSession();
		// boolean to check if whisky is found.
		boolean whiskyFound = false;	
		
		for (int i = 0; i < whiskies.size(); i++) {
			if (whiskies.get(i).getId().equals(userWhiskyChoice)) {
				
				// Removes selected whisky comment if that choice has been made.
				if(commentNrAsInt != 999999) {
					whiskies.get(i).getComments().remove(commentNrAsInt);
				}
				
				// Redirect user to selected whisky.
				response.sendRedirect("selectedWhisky.jsp");
				session.setAttribute("chosenWhisky", whiskies.get(i));
				session.setAttribute("commentObjects", whiskies.get(i).getComments());
				whiskyFound = true;
				
				//Save changes
				SaveToFile saveToFile = new SaveToFile();
				saveToFile.saveWhiskiesToFile(whiskies, filePath);
			}
		}
		// Error message for developers.
		if (!whiskyFound) {
			System.out.println("Error! No whisky found. No hardcoded whiskies?");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
