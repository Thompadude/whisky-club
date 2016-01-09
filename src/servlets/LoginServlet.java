package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		// Get a user name and a password from login.jsp
		String usrName = request.getParameter("ajaxUsrName");
		String password = request.getParameter("ajaxPassword");

		// Checks if login is valid.
		LoginHandler loginHandler = new LoginHandler();
		boolean isSuccessfulLogin = loginHandler.authenticate(usrName, password);
		System.out.println(isSuccessfulLogin);
		// If login is OK, redirect to main page, if not - nothing happens.
		if (isSuccessfulLogin) {
			out.print("Login Successful!");
			//response.sendRedirect("index.jsp");
		} else {
			out.print("Login Failed!");
			//response.sendRedirect("login.jsp");
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