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
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{    	
    	whiskyHandler = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyHandler.loadWhiskies(filePath);
		
		request.getSession().setAttribute("allWhiskies", whiskies);
		
		String setWhiskyFavorite = request.getParameter("setWhiskyFavorite");
		String chosenWhiskyID = request.getParameter("chosenWhiskyId");
		boolean favorite;
		if (setWhiskyFavorite.equals("true")) {
			favorite = true;
		} else {
			favorite = false;
		}
		
		for(int i = 0; i < whiskies.size(); i++ ) {
			if(chosenWhiskyID.equals(whiskies.get(i).getId())) {
				whiskies.get(i).setFavorite(favorite);
				SaveToFile saveToFile = new SaveToFile();
				saveToFile.saveWhiskiesToFile(whiskies, filePath);
				response.sendRedirect("list.jsp");
			}
		}
		
		
		//whisky.get(i).setFavorite(favorite);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
