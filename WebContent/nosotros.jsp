<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%
String member[] = { "Villagaray Gormas, Dennis Alberto", "Torres Gutierrez, Fernando", "Soto Hidalgo, Carlo Adrian" };
String members[][] = { { "Villagaray Gormas, Dennis Alberto", "tom" }, { "Torres Gutierrez, Fernando", "tobey" },
		{ "Soto Hidalgo, Carlo Adrian", "andrew" } };
pageContext.setAttribute("members", members);
%>
<t:layout titlePage="Nosotros">


	<jsp:body>
	<div class="container">
        <div class="container">
			<div class="banner">
				<img class="d-block w-100 border-radius-125"
						src="assets/images/banners/nosotros.png" alt="Banner Nosotros">
			</div>
			<div class="container mt-4 mb-4 text-center" style="width: 80%;">
				<h3>Acerca de Traineasy</h3>
				<p class="px-5" style="width: 80%; margin: auto;">Somos una empresa que busca ayudar a que los estudiantes de tecnología en sus últimos años
			   			de estudio desarrollen sus conocimientos adquiridos en situaciones de trabajos reales.</p>
			</div>
			  <div class="container" style="margin-bottom: 50px">
					
				<div class="row">
					<f:forEach var="m" items="${members}">

				      <div class="text-center col-lg-4">
				        <img class="rounded-circle"
									src="assets/images/profile/${m[1]}.png"
									alt="Generic placeholder image" width="140" height="140">
				        <p style="margin-top: 20px">${m[0]}</p>
				      </div>

					</f:forEach> 
			    </div>
			</div>


		</div>
	</div>
    </jsp:body>
</t:layout>