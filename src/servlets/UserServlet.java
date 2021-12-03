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

	DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);

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
		case "restore":
			restore(request, response);
		default:
			request.getSession().invalidate();
			response.sendRedirect("sign-in.jsp");
		}
	}

	private void restore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email, pass, retryPass, url, message = "";

		email = request.getParameter("inputEmail") == null ? null : request.getParameter("inputEmail");
		pass = request.getParameter("inputPassword") == null ? null : request.getParameter("inputPassword");
		retryPass = request.getParameter("inputPassword") == null ? null : request.getParameter("inputRetryPassword");

		// To do
		int ok = factory.getUserDAO().restorePassword(email, pass);

		if (ok == 0) {
			url = "login.jsp";
		} else {
			url = "new-password.jsp";
			message = "Usuario o contraseña inválidos";
		}
		request.getSession().setAttribute("ok", ok);
		request.setAttribute("message", message);
		request.getRequestDispatcher(url).forward(request, response);

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email, pass, url, message = "";

		email = request.getParameter("inputEmail") == null ? null : request.getParameter("inputEmail");
		pass = request.getParameter("inputPassword") == null ? null : request.getParameter("inputPassword");

		User u = factory.getUserDAO().get(email, pass);

		u = new DAOUserMySQL().get(email, pass);

		if (u != null) {
			url = "index.jsp";
		} else {
			url = "sign-in.jsp";
			message = "Usuario o contraseña inválidos";
		}
		request.getSession().setAttribute("u", u);
		request.getSession().setAttribute("message", message);
//		request.getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(request.getHeader("Referer"));
	}

	private void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("entraste a register \n");
		String email, pass, retryPass, name, lastName, birthDate;
		int ok = -1;

		email = request.getParameter("inputEmail");
		name = request.getParameter("inputName");
		lastName = request.getParameter("inputLastName");
		birthDate = request.getParameter("inputBirthDate");
		pass = request.getParameter("inputPassword");
		retryPass = request.getParameter("inputRetryPassword");

		if (!pass.equals(retryPass)) {
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}

		User u = new User(email, pass, name, lastName, birthDate, 0, birthDate);
		ok = factory.getUserDAO().register(u);

		request.getSession().setAttribute("ok", ok);

		if (ok == 0) {
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}

		request.getRequestDispatcher("register.jsp").forward(request, response);

	}

}
