package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import management.UserManagement;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet(name = "userServlet", urlPatterns = { "/userServlet" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Entró al Servlet Ususario");

		String btn = request.getParameter("button");

		switch (btn) {
		case "register":
			register(request, response);
			break;
		case "login":
			login(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: ");
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Process: login");

		String email, pass, url;

		email = request.getParameter("inputEmail") == null ? null : request.getParameter("inputEmail");
		pass = request.getParameter("inputPassword") == null ? null : request.getParameter("inputPassword");

		User u = new User();

		u = new UserManagement().get(email, pass);

		if (u == null) {
			url = "sign-in.jsp";
			System.out.println("No existen registro con '" + email + "' ni password '" + pass + "'");
		} else {
			url = "index.jsp";
		}
		request.setAttribute("user", u);
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Process: Register");

	}

}
