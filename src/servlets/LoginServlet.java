package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.LoginHandler;

/**
 * Servlet implementation class Main
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		// Get the user name and password from AJAX.
		String usrName = request.getParameter("ajaxUsrName");
		String password = request.getParameter("ajaxPassword");

		// Check if the login information is valid.
		LoginHandler loginHandler = new LoginHandler();
		boolean isSuccessfulLogin = loginHandler.authenticate(usrName, password);

		// Prints out a message to the user depending on if login is successful or not.
		PrintWriter out = response.getWriter();
		if (isSuccessfulLogin) {
			// The success print is important in login.js. The string is the key for redirection.
			out.print("Login Successful!");
		} else {
			out.print("Login Failed!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}