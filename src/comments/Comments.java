package comments;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Comments
 */
@WebServlet("/Comments")
public class Comments extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CommentHandler commentHandler = new CommentHandler();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Comments() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newComment = request.getParameter("comment");
		commentHandler.addComment(newComment);

		for (String comments : commentHandler.getComments()) {
			System.out.println(comments);
		}

		response.sendRedirect("comments.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}