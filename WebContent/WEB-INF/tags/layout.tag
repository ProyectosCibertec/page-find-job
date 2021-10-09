<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="titlePage" required="false"%>
<%@attribute name="css" required="false"%>
<%@attribute name="header" required="false"%>

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

<link rel="stylesheet" href="assets/sass_compiled/app.css">
<link rel="stylesheet" href="assets/sass_compiled/${css}">
</head>
<body>
	<%if (header == null) {%>
		<%@include file="../includes/header.jsp"%>
	<%}%>

	<%-- Body --%>
	<jsp:doBody />
	<%-- End-Body --%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>