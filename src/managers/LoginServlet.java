package managers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.WhiskyDatabase;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

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