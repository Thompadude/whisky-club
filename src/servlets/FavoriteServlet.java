package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.Data;
import database.WhiskyDatabase;
import saveAndLoad.SaveToFile;
import whiskies.Whisky;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private WhiskyDatabase whiskyHandler;
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	public FavoriteServlet() {
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
		// Load the whiskies from the file.		
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyHandler.loadWhiskies(filePath);
		
		// Getting params from selectedWhisky.jsp depending on what link the user has clicked on.
		String setWhiskyFavorite = request.getParameter("setWhiskyFavorite");
		String chosenWhiskyID = request.getParameter("chosenWhiskyId");
		String setGradeAsString = request.getParameter("setWhiskyGrade");
		
		// Converts the user's whisky rating to String. If no rating is clicked on, set to null.
		if (setGradeAsString == null) {
			setGradeAsString = "0";
		}
		int gradeAsInt = Integer.parseInt(setGradeAsString);
		
		// Creates the favorite boolean. If the user has clicked on the favorite link - set to true.
		boolean favorite;
		if (setWhiskyFavorite.equals("true")) {
			favorite = true;
		} else {
			favorite = false;
		}

		for(int i = 0; i < whiskies.size(); i++ ) {
			if(chosenWhiskyID.equals(whiskies.get(i).getId())) {
				// Set rating and favorite value depending on the user's choice.
				whiskies.get(i).setGrade(gradeAsInt);
				whiskies.get(i).setFavorite(favorite);
				
				// Save any changes to the file.
				SaveToFile saveToFile = new SaveToFile();
				saveToFile.saveWhiskiesToFile(whiskies, filePath);
				
				// Reloads the page with a redirect.
				response.sendRedirect("selectedWhisky.jsp");
				request.getSession().setAttribute("chosenWhisky", whiskies.get(i));
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
