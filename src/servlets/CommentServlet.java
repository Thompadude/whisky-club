package servlets;

import java.io.IOException;
import java.time.LocalDate;
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
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{
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
		
		String filePath = getServletContext().getRealPath("/whiskyData.dat");	
		ArrayList<Whisky> whiskies = whiskyDatabase.getWhiskies(filePath);
		
		// Get user user name and comment. Create today's date.
		String userName = request.getParameter("userName");
		String comment = request.getParameter("comment");		
		LocalDate localDate = LocalDate.now();
		String todaysDate = localDate.toString();
		
		String currentwhiskyId = request.getParameter("whiskyId");
		
		WhiskyComments whiskyComment = new WhiskyComments(userName, comment, todaysDate);

		// Check if user has filled in all fields.
		boolean isFieldsEmpty = true;
		if ((comment != null && comment != "") && (userName != null && userName != "")){
			isFieldsEmpty = false;
		}
		
		// If all fields are filled - add them to currently selected whisky.
		if (!isFieldsEmpty) {
			for (int i = 0; i < whiskies.size(); i++) {
				if (whiskies.get(i).getId().equals(currentwhiskyId)) {					
					whiskies.get(i).addComment(whiskyComment);
					//Save changes
					SaveToFile saveToFile = new SaveToFile();
					saveToFile.saveWhiskiesToFile(whiskies, filePath);
				}
			}
			response.sendRedirect("list.jsp");
		} else {
			request.setAttribute("error", "Something went wrong!");
		}
	}

}
