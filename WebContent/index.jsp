<%@page import="model.Language"%>
<%@page import="model.Offer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAOFactory"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>
<%

DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
ArrayList<Offer> offerList = factory.getOfferDAO().list();
ArrayList<Language> languageList = factory.getLanguageDAO().list();

pageContext.setAttribute("offerList", offerList);
pageContext.setAttribute("languageList", languageList);

%>
<t:layout>

	<jsp:body>
		<div class="container">
			<div class="banner">
				<img class="d-block w-100 border-radius-125"
					src="assets/images/banners/banner.jpg" alt="First slide">
				<div class="banner-content">
					<h1>Consigue tus primeras practicas</h1>
				</div>
			</div>
		</div>

		<form class="container mt-4" action="offerServlet" method="POST">
			<div class="row align-items-start w80">
				<div class="relative col-sm-5 col-md-6" style="position: relative;"> <input
						id="search" class="form-control" type="search" placeholder="Buscar"
						aria-label="default input example" style="padding-left: 40px" name="inputSearch">
					 <div class="absolute top-4 right-3"
						style="position: absolute; top: 50%; transform: translateY(-50%); left: 30px;">
					 	<i class="fa fa-search text-gray-400 z-20 hover:text-gray-500"></i>
					 </div>
				</div>
				<select class="form-select p-0 col selectpicker" multiple
					data-live-search="true" aria-label="Seleccionar">

					<f:forEach var="l" items="${languageList}">
						<option value="${l.code}">${l.name.toUpperCase()}</option>
					</f:forEach>

				</select>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary" name="button" value="buscar" >BUSCAR</button>
				</div>
			</div>
		</form>
		<div class="container mt-4">
			<div class="content w80" style="padding: 0 12px">	
				<f:if test="${newOfferList == null}">
					<f:forEach var="ol" items="${offerList}">
						<c:offer title="${ol.title}" description="${ol.description}"
						expires="${ol.limitDate}" vacant="${ol.vacants}"
						offerId="${ol.code}" />
					</f:forEach>
				</f:if>	
				<f:if test="${newOfferList != null}">
					<f:forEach var="ol" items="${newOfferList}">
						<c:offer title="${ol.title}" description="${ol.description}"
						expires="${ol.limitDate}" vacant="${ol.vacants}"
						offerId="${ol.code}" />
					</f:forEach>
				</f:if>
			</div>
		</div>
		
		<div class="container mt-4">
			<div class="content w80 d-flex" style="padding: 0 12px">
				<nav class="m-auto" aria-label="...">
				  <ul class="pagination">
				    <li class="page-item">
				      <span class="page-link">Previous</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">2</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
<%-- 		<script>
			const search = document.querySelector('#search');
			search.addEventListener('input', e  => {
				console.log(e.target.value)
				<%ArrayList<Offer> newOfferList = factory.getOfferDAO().listByTitle(e.target.value); %>
			})
        </script>  --%>
    </jsp:body>

</t:layout>








