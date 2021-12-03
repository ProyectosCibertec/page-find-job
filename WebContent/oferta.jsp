<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAOFactory"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page import="model.User"%>
<%@page import="model.Offer"%>
<%@page import="model.OfferLanguage"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>

<%
User uo = (User) request.getSession().getAttribute("u");

if (null == uo) {
	response.sendRedirect("http://localhost:8081/page-find-job/sign-in.jsp");
	return;
}

Offer o = (Offer)request.getAttribute("offer");

DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
ArrayList<OfferLanguage> offerLanguageList = factory.getOfferLanguageDAO().listByOffer(String.valueOf(o.getCode()));

request.setAttribute("offerLanguageList", offerLanguageList);

%>

<link rel="stylesheet" href="./assets/css/profile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<t:layout titlePage="Oferta">
	<jsp:body>
		<div class="container">
		  <main class="d-flex flex-column align-items-center mb-5">
		    <div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h1 class="h3 mb-4 text-center">${offer.title}</h1>
						<div class="d-flex flex-column">
							<div class="d-flex flex-row justify-content-around mb-2">
										<div>
											<img
											src="assets/images/icons/edifice.png"
											alt="" width="100" height="100">
											<div class="d-flex flex-column justify-content-end mt-2">
												<p>Fecha de expiracion: ${offer.limitDate}</p>
												<p>Vacantes: ${offer.vacants}</p>
											</div> 
										</div>
										<div class="d-flex flex-column justify-content-center">
											<p class="font-weight-bold">Requisitos</p>
											<div class="d-flex flex-row flex-wrap" style="max-width: 280px">
												<f:forEach var="l" items="${offerLanguageList}">
													<c:tag language="${l.languageName}" />
							 					</f:forEach>
											</div>
										</div>
							</div>
							<div class="col px-5">
								<h4>Descripcion</h4>
								<p class="">${offer.description}</p>
							</div>
							<form method="POST" action="offerUserServlet" class="text-center">
								<input type="text" name="inputOfferId" value="${offer.code}" hidden="true">
								<button type="submit" class="btn btn-warning" name="button" value="applyOffer">Aplicar</button>
							</form>
						</div>
					</div>
				</div>
		    </div>
		  </main>
		</div>
		<f:if test="${message != null}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			  <div id="liveToast"
					class="toast bg-danger ${message != null ? 'show' : 'hide' }"
					role="alert" aria-live="assertive" aria-atomic="true">
			    <div class="toast-body d-flex justify-content-between">
					<span style="color: white;"> 
						${message}
					</span>
				    <div>
						<button type="button" class="btn-close" data-bs-dismiss="toast"
								aria-label="Close"></button>
				    </div>
			    </div>
			  </div>
			</div>
		  </f:if>
    </jsp:body>
</t:layout>