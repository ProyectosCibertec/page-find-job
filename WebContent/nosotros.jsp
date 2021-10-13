<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%
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
        <p>Nosotros:</p>
        <h1>${limit}</h1>
        
        <f:forEach var="a" items="${demo}">
         	${a}<br>
        </f:forEach>
	</div>
    </jsp:body>
</t:layout>