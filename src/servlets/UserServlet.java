package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import management.DAOUserMySQL;
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

		String btn = request.getParameter("button");
		if (btn == null)
			btn = "logout";

		switch (btn) {
		case "register":
			register(request, response);
			break;
		case "login":
			login(request, response);
			break;
		default:
			request.getSession().invalidate();
			response.sendRedirect("sign-in.jsp");
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email, pass, url, message = "";

		email = request.getParameter("inputEmail") == null ? null : request.getParameter("inputEmail");
		pass = request.getParameter("inputPassword") == null ? null : request.getParameter("inputPassword");

		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
		User u = factory.getUserDAO().get(email, pass);

		u = new DAOUserMySQL().get(email, pass);

		if (u != null) {
			url = "index.jsp";
		} else {
			url = "sign-in.jsp";
			message = "Usuario o contraseña inválidos";
		}
		request.getSession().setAttribute("u", u);
		request.setAttribute("message", message);
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Process: Register");

	}

}
