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
		
		// Get the selected whisky from ListServlet setAttribute("chosenWhisky")
		Whisky tempWhisky = (Whisky)request.getSession().getAttribute("chosenWhisky");
		
		// Get the user name and comment from the user's input.
		String name = request.getParameter("ajaxSelWhiskyName");
		String comment = request.getParameter("ajaxSelWhiskyComment");
		
		// Get which of the comments the user want to remove. (IF the user want to remove a comment).
		String commentNrAsString = request.getParameter("ajaxIdNumber");
		
		// Create today's date and time and convert to String.
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM YYYY HH:mm");
		String todaysDate = localDateTime.format(formatter).toString();

		// Check if the user wants to remove a comment.
		int commentNrAsInt;
		if (commentNrAsString != null) {
			commentNrAsInt = Integer.parseInt(commentNrAsString);			
		} else {
			commentNrAsInt = 999999;
		}

		// tempWhisky and correct whisky do not share object id. Finding the correct whisky.
		for (int i = 0; i < whiskies.size(); i++) {
			if (whiskies.get(i).getId().equals(tempWhisky.getId())) {
				
				// If the user has made the choice to delete a comment, removes it.
				if(commentNrAsInt != 999999) {
					whiskies.get(i).getComments().remove(commentNrAsInt);	
				}
				
				// Check if name and comment is not null and add comment to the correct whisky.
				if (name != null && comment != null) {
					WhiskyComments newComment = new WhiskyComments(name, comment, todaysDate);
					whiskies.get(i).addComment(newComment);
				}
			
				//Save changes to the file.
				SaveToFile saveToFile = new SaveToFile();
				saveToFile.saveWhiskiesToFile(whiskies, filePath);
				
				// Updating the attribute chosenWhisky to make sure the correct whisky-object is returned.
				request.getSession().setAttribute("chosenWhisky", whiskies.get(i));
			}
		}
	}	
	
}