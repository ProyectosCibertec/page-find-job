package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import model.Language;
import model.Offer;

/**
 * Servlet implementation class OfferServlet
 */
@WebServlet(name = "offerServlet", urlPatterns = { "/offerServlet" })
public class OfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("button");
		switch (btn) {
		case "add":
			add(request, response);
			break;
		case "register":
			register(request, response);
			break;
		case "remove":
			remove(request, response);
			break;
		case "buscar":
			buscar(request, response);
			break;
		default:
			request.getSession().invalidate();
			response.sendRedirect("sign-in.jsp");
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("inputSearch");
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
		ArrayList<Offer> offerList = new ArrayList<Offer>();
		
		if(search != null && !search.isEmpty()) {
			offerList = factory.getOfferDAO().listByTitle(search);
			request.setAttribute("newOfferList", offerList);
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Language> languagesOfferList = new ArrayList<>();
		
		String title = request.getParameter("inputTitle");
		String descripcion = request.getParameter("inputDescripcion");
		String vacantesString = request.getParameter("inputVacantes");
		String fecha = request.getParameter("inputFecha");
		
		request.setAttribute("title", title);
		request.setAttribute("descripcion", descripcion);
		request.setAttribute("vacantes", vacantesString);
		request.setAttribute("fecha", fecha);
		request.getSession().setAttribute("languagesOfferList", languagesOfferList);
		request.getRequestDispatcher("publicar-ofertas.jsp").forward(request, response);
	}

	@SuppressWarnings("unchecked")
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFactory factory =  DAOFactory.getDAOFactory(DAOFactory.MYSQL);
		
		String message = null, url = "publicar-ofertas.jsp", title, descripcion, vacantesString, fecha;
		ArrayList<Language> languagesOfferList = (ArrayList<Language>) request.getSession().getAttribute("languagesOfferList");
		
		title = request.getParameter("inputTitle");
		descripcion = request.getParameter("inputDescripcion");
		vacantesString = request.getParameter("inputVacantes");
		fecha = request.getParameter("inputFecha");
		
		if(languagesOfferList == null) {
			languagesOfferList = new ArrayList<Language>();
		}
		
		if(title == null || title.isEmpty() || descripcion == null || descripcion.isEmpty() || vacantesString == null || vacantesString.isEmpty()
				|| fecha == null || languagesOfferList.size() == 0) {
			message = "Es necesario llenar todos los campos";
		} else {
			Offer o = new Offer();
			o.setCode(factory.getOfferDAO().getLastOffer() != null ? factory.getOfferDAO().getLastOffer().getCode() + 1 : 1);
			o.setTitle(title);
			o.setDescription(descripcion);
			o.setLimitDate(fecha);
			o.setVacants(Integer.parseInt(vacantesString));
			int rs = DAOFactory.getDAOFactory(DAOFactory.MYSQL).getOfferDAO().register(o, languagesOfferList);
			if(rs <= 0) {
				message = "Hubo un error al registrar la oferta";
			} else {
				url = "index.jsp";
			} 
			
		}
		
		request.setAttribute("message", message);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	@SuppressWarnings("unchecked")
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = null;
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
		ArrayList<Language> languageList = factory.getLanguageDAO().list();
		ArrayList<Language> languagesOfferList = (ArrayList<Language>) request.getSession().getAttribute("languagesOfferList");
		
		String title = request.getParameter("inputTitle");
		String descripcion = request.getParameter("inputDescripcion");
		String vacantesString = request.getParameter("inputVacantes");
		String fecha = request.getParameter("inputFecha");
		
		String idString = request.getParameter("cboLanguage");
		
		if(idString.isEmpty()) {
			message = "Es necesario seleccionar un lenguaje";
		} else {
			int id = Integer.parseInt(idString);
			if(languagesOfferList == null) {
				languagesOfferList = new ArrayList<Language>();
			}
			if(languagesOfferList.size() == 7) {
				message = "Solo se pueden agregar 7 lenguajes como maximo";
			}
			else {
				boolean isNewLanguage = false;
				if(languagesOfferList.size() <= 0) {
					isNewLanguage = true;
				} else {
					for (Language lanOf : languagesOfferList) {
						if(lanOf.getCode() == id) {
							message = "El lenguaje ya ha sido agregado";
							break;
						} else {
							isNewLanguage = true;
							break;
						}
					}
				}
				if(isNewLanguage) {
					for (Language lan : languageList) {
						if(lan.getCode() == id) {
							languagesOfferList.add(lan);
						} 
					}
				}
				
			}
		}
		
		request.setAttribute("message", message);
		request.setAttribute("title", title);
		request.setAttribute("descripcion", descripcion);
		request.setAttribute("vacantes", vacantesString);
		request.setAttribute("fecha", fecha);
		request.getSession().setAttribute("languagesOfferList", languagesOfferList);
		request.getRequestDispatcher("publicar-ofertas.jsp").forward(request, response);
	}

}
 