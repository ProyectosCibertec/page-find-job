<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%
String members[] = { "Dennis Alberto Villagaray Gormas", "Fernando Torres Gutierrez", "Carlo Adrian Soto Hidalgo" };
pageContext.setAttribute("members", members);

int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
pageContext.setAttribute("demo", numbers);

Integer limit = (Integer) session.getAttribute("limit");
limit = request.getParameter("bandera") == null ? null : limit;

if (limit == null) {
	limit = 2;
}
%>
<t:layout titlePage="Nosotros">


	<jsp:body>
	<div class="container">
<%--         <p>Nosotros:</p>
        <h1>${limit}</h1>
        
        <f:forEach var="a" items="${demo}">
         	${a}<br>
        </f:forEach> --%>
        <div class="container">
			<div class="banner">
				<img class="d-block w-100 border-radius-125"
						src="assets/images/banners/nosotros.png" alt="Banner Nosotros">
			</div>
			<div class="container mt-4">
			<h3>Acerca de Traineasy</h3>
			<p class="px-5">Somos una empresa que busca ayudar a que los estudiantes de tecnología en sus últimos años
			   de estudio desarrollen sus conocimientos adquiridos en situaciones de trabajos reales.</p>
			</div>
			<div class="container mt-4">
			<h3>Grupo conformado por:</h3>
       			 <f:forEach var="m" items="${members}">
         			<li class="mx-4">${m}</li>
						<br>
      			 </f:forEach> 
			</div>
		</div>
	</div>
    </jsp:body>
</t:layout>