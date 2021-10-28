<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page import="model.User"%>
<%--
User uo = (User) request.getSession().getAttribute("u");
if(null == uo) {
	response.sendRedirect("http://localhost:8081/page-find-job/sign-in.jsp");
	return;
}
--%>

<t:layout titlePage="Profile">
	<jsp:body>
		<div class="container"> 
			<h1>Profile</h1>		
		</div>
    </jsp:body>
</t:layout>