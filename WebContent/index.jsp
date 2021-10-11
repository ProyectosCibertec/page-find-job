<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>


<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>
<%
int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
String language[] = { "HTML", "JAVA", "JAVASCRIPT", "CSS3", "RUBY", "GO", "MONGODB" };

pageContext.setAttribute("demo", numbers);
pageContext.setAttribute("languages", language);
%>
<t:layout>

	<jsp:body>
		<div class="container">
			<div class="banner">
				<img class="d-block w-100 border-radius-125"
					src="assets/images/banners/banner.jpg" alt="First slide">
				<div class="banner-content">
					<h1>Consigue tus primeras prácticas</h1>
				</div>
			</div>
		</div>
		
		<div class="container mt-4">
			<div class="row align-items-start w80">
				<div class="relative col-sm-5 col-md-6" style="position: relative;"> <input
						class="form-control" type="search" placeholder="Buscar"
						aria-label="default input example" style="padding-left: 40px">
					 <div class="absolute top-4 right-3"
						style="position: absolute; top: 50%; transform: translateY(-50%); left: 30px;">
					 	<i class="fa fa-search text-gray-400 z-20 hover:text-gray-500"></i>
					 </div>
				</div>
				<select class="form-select p-0 col selectpicker" multiple
					data-live-search="true" aria-label="Seleccionar">

					<f:forEach var="language" varStatus="status" items="${languages}">
						<option value="${language.toLowerCase()}">${language}</option>
					</f:forEach>

				</select>
				<div class="col-auto">
					<input type="button" class="btn btn-primary" value="BUSCAR">
				</div>
			</div>
		</div>
		
		<div class="container mt-4">
			<div class="content w80" style="padding: 0 12px">
				<f:forEach var="a" items="${demo}">
					<c:offer title="Practicante Front End"
						description="Se busca un practicante de desvarrollo
							Front-End Se busca un practicante de desa..."
						expires="23/10/2021" vacant="${a}" />
				</f:forEach>
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

		
    </jsp:body>

</t:layout>