<%@tag language="java" description="Overall Page template"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@attribute name="titlePage" required="false"%>
<%@attribute name="css" required="false"%>
<%@attribute name="cssExternal" required="false"%>
<%@attribute name="header" required="false"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prácticas Pre-profesionales <%
if (titlePage != null)
	out.println("|");
%> ${titlePage}
</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

<link rel="shortcut icon"
	href="<%=basePath%>assets/images/icons/favicon.svg" type="image/x-icon">

<link rel="stylesheet"
	href="<%=basePath%>assets/css/conf/inputs__format.css">
<%if (cssExternal != null) {%>
<link rel="stylesheet" href="${cssExternal}">
<%}%>

<link rel="stylesheet" href="<%=basePath%>assets/css/app.css">

<%if (css != null) {%>
<link rel="stylesheet" href="<%=basePath%>assets/css/${css}">
<%}%>


</head>
<body>
	<%if (header == null) {%>
	<t:header basePath="<%=basePath%>" />
	<%}%>

	<%-- Body --%>
	<jsp:doBody />
	<%-- End-Body --%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>


</body>
</html>