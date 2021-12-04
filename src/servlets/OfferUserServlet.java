package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import model.User;

/**
 * Servlet implementation class OfferUserServlet
 */
@WebServlet(name = "offerUserServlet", urlPatterns = { "/offerUserServlet" })
public class OfferUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String btn = request.getParameter("button");
		
		switch (btn) {
		case "applyOffer": {
			applyOffer(request, response);
			break;
		}
		default:
			request.getSession().invalidate();
			response.sendRedirect("sign-in.jsp");
		}
		
	}

	private void applyOffer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = null, url;
		int offerId = Integer.parseInt(request.getParameter("inputOfferId"));
		User u = (User)request.getSession().getAttribute("u");
		
		int rs = DAOFactory.getDAOFactory(DAOFactory.MYSQL).getOfferUserDAO().registerOfferUser(offerId, u.getCode());
		
		if(rs <= 0) {
			message = "Ocurrio un error al aplicar a la oferta";
		}
		
		request.setAttribute("message", message);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
