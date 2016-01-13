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
    	// Gets the database of the whiskies.
    	whiskyHandler = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// Load the previous whiskies from the file.
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyHandler.loadWhiskies(filePath);
		
		/*
		 * Get the user's whisky choice by requesting the parameter from the href.
		 * For example: <a href="ListServlet?whisky=dalwhinnie">
		 */
		String userWhiskyChoice = request.getParameter("whisky");
		
		/*
		 * Get which of the comments the user want to remove.
		 * If-statement to check if the user wanted to remove comment,
		 * or used servlet as redirection.
		 */
		String commentNrAsString = request.getParameter("deleteWhiskyCommentItemNr");
		int commentNrAsInt;
		if (commentNrAsString != null) {
			commentNrAsInt = Integer.parseInt(commentNrAsString);			
		} else {
			commentNrAsInt = 999999;
		}
		
		// boolean to check if the whisky is found. Primarily used to help the developer.
		boolean whiskyFound = false;	
		
		// Search in the database for the whisky the user has clicked on.
		for (int i = 0; i < whiskies.size(); i++) {
			if (whiskies.get(i).getId().equals(userWhiskyChoice)) {
				
				// If the user has made the choice to delete a comment, removes it.
				if(commentNrAsInt != 999999) {
					whiskies.get(i).getComments().remove(commentNrAsInt);
				}
				
				// Redirect the user to the selectedWhisky.jsp.
				response.sendRedirect("selectedWhisky.jsp");
				// Sets the attributes used in selectedWhisky.jsp.
				HttpSession session = request.getSession();
				session.setAttribute("chosenWhisky", whiskies.get(i));
				
				// Saves any changes to the file.
				SaveToFile saveToFile = new SaveToFile();
				saveToFile.saveWhiskiesToFile(whiskies, filePath);
				
				whiskyFound = true;
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
