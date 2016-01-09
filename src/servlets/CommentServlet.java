package servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import whiskies.WhiskyComments;

/**
 * Servlet implementation class CommentHandler
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private WhiskyDatabase whiskyDatabase;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
    }
    
    public void init() throws ServletException{
    	// Gets the database of the whiskies.
    	whiskyDatabase = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");

		// Load the whiskies from the file.		
		String filePath = getServletContext().getRealPath("/whiskyData.dat");	
		ArrayList<Whisky> whiskies = whiskyDatabase.loadWhiskies(filePath);
		
		// Get the user name and comment from the user's input.
		String userName = request.getParameter("userName");
		String comment = request.getParameter("comment");
		
		// Create today's date and time and convert to String.
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM YYYY HH:mm");
		String todaysDate = localDateTime.format(formatter).toString();

		// Create a new WhiskyComments object with the above information.
		WhiskyComments whiskyComment = new WhiskyComments(userName, comment, todaysDate);
		
		// Get the id from the whisky currently shown.
		String currentwhiskyId = request.getParameter("whiskyId");
		
		// Check to see if the user has written in all of the form fields.
		boolean isFieldsEmpty = true;
		if ((comment != null && comment != "") && (userName != null && userName != "")){
			isFieldsEmpty = false;
		}
		
		// If all fields are filled - add them to the whisky.
		if (!isFieldsEmpty) {
			for (int i = 0; i < whiskies.size(); i++) {
				// Using the whisky id previously recovered - add the comment to correct whisky.
				if (whiskies.get(i).getId().equals(currentwhiskyId)) {					
					whiskies.get(i).addComment(whiskyComment);
					
					//Save changes to the file.
					SaveToFile saveToFile = new SaveToFile();
					saveToFile.saveWhiskiesToFile(whiskies, filePath);
					
					// Reload the page with a redirect.
					response.sendRedirect("selectedWhisky.jsp");
					request.getSession().setAttribute("chosenWhisky", whiskies.get(i));
					request.getSession().setAttribute("commentObjects", whiskies.get(i).getComments());
				}
			}
		} else {
			request.setAttribute("error", "Something went wrong!");
			response.sendRedirect("list.jsp");
		}
	}

}
