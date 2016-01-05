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
import management.LoginHandler;
import whiskies.Whisky;

/**
 * Servlet implementation class Main
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WhiskyDatabase whiskyDatabase;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}
	
	public void init() throws ServletException{    	
    	whiskyDatabase = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> whiskies = whiskyDatabase.loadWhiskies(filePath);
		
		request.getSession().setAttribute("allWhiskies", whiskies);

		// Get a user name and a password from login.jsp
		String usrName = request.getParameter("usrName");
		String password = request.getParameter("password");

		// Checks if login is valid.
		LoginHandler loginHandler = new LoginHandler();
		boolean isSuccessfulLogin = loginHandler.authenticate(usrName, password);

		// If login is OK, redirect to main page, if not - nothing happens.
		if (isSuccessfulLogin) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}