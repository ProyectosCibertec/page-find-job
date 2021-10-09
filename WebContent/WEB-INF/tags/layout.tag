<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prácticas Pre-profesionales</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="assets/sass_compiled/app.css">
</head>
<body>

	<%@include file="../includes/header.jsp"%>

	<div id="body">
		<jsp:doBody />
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>