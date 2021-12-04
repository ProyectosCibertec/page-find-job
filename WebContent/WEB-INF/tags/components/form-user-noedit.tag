<%@tag import="model.User"%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>
<%
User user = (User) request.getSession().getAttribute("u");

%>

<div class="card mb-3">
	<div class="card-body">
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Nombres</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.name}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Apellidos</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.lastName}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Email</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.email}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Teléfono</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.phone}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Fecha de nacimiento</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.birthDate}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<h6 class="mb-0">Dirección</h6>
			</div>
			<div class="col-sm-9 text-secondary">${u.address}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-12">
				<a class="btn btn-info" id="btnEdit">Editar</a>
			</div>
		</div>
	</div>
</div>


<script>
	const edit = document.querySelector('#btnEdit')
		edit.addEventListener('click', e => {
	    <%request.getSession().setAttribute("isEdit", true);%>
	    console.log('creado')
	    window.location.reload()
		})
</script>











