package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Data;
import database.WhiskyDatabase;
import whiskies.Whisky;

/**
 * Servlet implementation class WhiskyManageServlet
 */
@WebServlet("/WhiskyManageServlet")
public class WhiskyManageServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private WhiskyDatabase whiskyDatabase;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WhiskyManageServlet() {
        super();
    }
    
    public void init() throws ServletException {
    	whiskyDatabase = Data.getWhiskyHandler();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String region = request.getParameter("region");
		String country = request.getParameter("country");
		String type = request.getParameter("type");
		String info = request.getParameter("info");
		String imgurl = request.getParameter("imgurl");
		String alc = request.getParameter("alc");
		double alcDouble = Double.parseDouble(alc);
		
		String id = name.toLowerCase();
		
		System.out.println("hej från whiskymanageservlet");
		System.out.println(type);
		System.out.println(name);
		//Whisky newWhisky = new Whisky(id, name, region, country, type, info, imgurl, alcDouble, 0);
		//whiskyDatabase.getWhiskies().add(newWhisky);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
