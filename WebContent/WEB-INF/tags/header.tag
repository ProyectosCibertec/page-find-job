<%@ tag description="header" pageEncoding="UTF-8"%>
<%-- <%@attribute name="isLogin" required="false"%> --%>
<%@attribute name="user" required="false"%>

<%
Boolean isLogin = (user != null && user != "") ? true : false;
%>

<div class="container sticky-top mb-4">
	<header class="p-3 bg-dark text-white border-radius-bottom-125">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
				<a href="index.jsp"
					class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
					<img class="img-home" src="assets/images/practicas-pre.png" />
				</a>

				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li><a href="index.jsp" class="nav-link px-2 text-secondary">Inicio</a></li>
					<li><a href="#" class="nav-link px-2 text-white">Publicar
							ofertas</a></li>
					<li><a href="nosotros.jsp" class="nav-link px-2 text-white">Nosotros</a></li>
				</ul>

				<%if (isLogin != true) {%>

				<div class="col-md-3 text-end">
					<a href="sign-in.jsp" class="btn btn-outline-light me-2">Login</a>
					<a href="#" class="btn btn-warning">Sign-up</a>
				</div>
				<%} else {%>
				<div class="dropdown text-end">
					<a href="#"
						class="d-block link-light text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="32"
						height="32" class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">${user}</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">Signs out</a></li>
					</ul>
				</div>
				<%}%>

			</div>
		</div>
	</header>
</div>