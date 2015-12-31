package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import whiskies.Whisky;

/**
 * Servlet implementation class ListHandler
 */
@WebServlet("/ListHandler")
public class ListHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Whisky laphroaig = new Whisky();
		laphroaig.setId("laphroaig");
		laphroaig.setName("Laphroaig Quarter Cask");
		laphroaig.setRegion("Islay");
		laphroaig.setCountry("Scotland");
		laphroaig.setType("Single Malt Whisky");
		laphroaig.setImgUrl("laphroaigquartercask.jpg");
		laphroaig.setInfo("Released in 2004, this bottling was aged for around five "
						+ "years before being finished in a quarter cask for several "
						+ "months, the size of the cask is quite small, thus does not "
						+ "require such a long maturation. This remains a truly great achievement from Laphroaig.");
		laphroaig.setAlc(48);
		laphroaig.setGrade(0);
		
		
		Whisky talisker = new Whisky();
		talisker.setId("talisker");
		talisker.setName("Talisker");
		talisker.setRegion("Isle of Skye");
		talisker.setCountry("Scotland");
		talisker.setType("Single Malt Whisky");
		talisker.setImgUrl("talisker.jpg");
		talisker.setInfo("Write some info here please");
		talisker.setAlc(45.8);
		talisker.setGrade(0);
		
		ArrayList<Whisky> whiskies = new ArrayList<Whisky>();
		whiskies.add(talisker);
		whiskies.add(laphroaig);
		
		String userWhiskyChoice = request.getParameter("param");
		System.out.println(userWhiskyChoice);
		
		HttpSession session = request.getSession();
		
		for (int i = 0; i < whiskies.size(); i++) {
			if (whiskies.get(i).getId().equals(userWhiskyChoice)) {
				response.sendRedirect("selectedWhisky.jsp");
				session.setAttribute("chosenWhisky", whiskies.get(i));
			} else {
				System.out.println("Something was terribly wrong with what you just did!");
			}
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
