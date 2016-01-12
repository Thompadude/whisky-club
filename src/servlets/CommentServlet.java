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
		
		Whisky tempWhisky = (Whisky)request.getSession().getAttribute("chosenWhisky");

		//Test!!!!
		System.out.println(tempWhisky.getComments().size());
		
		// Get the user name and comment from the user's input.
		String name = request.getParameter("ajaxSelWhiskyName");
		String comment = request.getParameter("ajaxSelWhiskyComment");
		
		// Create today's date and time and convert to String.
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM YYYY HH:mm");
		String todaysDate = localDateTime.format(formatter).toString();
		
		PrintWriter out = response.getWriter();

		// Get the right whisky by id.
		if (name == null || comment == null) {
			// Print all comments
			loadWhiskyCommentsHTML(tempWhisky, out);
		} else {
			for(int i=0; i < whiskies.size(); i++) {
				if(whiskies.get(i).getId().equals(tempWhisky.getId())) {
				
					// Create a new WhiskyComments object with the above information.
					WhiskyComments whiskyComment = new WhiskyComments(name, comment, todaysDate);
					whiskies.get(i).addComment(whiskyComment);
					loadWhiskyCommentsHTML(whiskies.get(i), out);
				
					//Save changes to the file.
					SaveToFile saveToFile = new SaveToFile();
					saveToFile.saveWhiskiesToFile(whiskies, filePath);
				}
			}	
		}
		
		
	}
	
	public void loadWhiskyCommentsHTML(Whisky whisky, PrintWriter out) {
		for(int i = whisky.getComments().size()-1; i >= 0; i--) {
			out.println("<div class=\"row\"><div class=\"col-lg-11\"><p>"
					+ whisky.getComments().get(i).getUserName() + "<br>");
			out.println(whisky.getComments().get(i).getDate() + "</p>");
			out.println("<h4>" + whisky.getComments().get(i).getComment()
					+ "</h4></div><div class=\"col-lg-1\"></div></div>");
		}
	}
}