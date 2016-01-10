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
 * Servlet implementation class WhiskyManageServlet
 */
@WebServlet("/WhiskyManageServlet")
public class WhiskyManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WhiskyDatabase whiskyHandler;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WhiskyManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		whiskyHandler = Data.getWhiskyHandler();
		
		// Load the previous whiskies from the file.
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyHandler.loadWhiskies(filePath);
		
		String resetAllWhiskies = request.getParameter("reset");
		
		if(resetAllWhiskies.equals("reset")) {
			whiskies = whiskyHandler.resetWhiskes();
			
			// Saves any changes to the file.
			SaveToFile saveToFile = new SaveToFile();
			saveToFile.saveWhiskiesToFile(whiskies, filePath);
			
			response.sendRedirect("index.jsp");
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
