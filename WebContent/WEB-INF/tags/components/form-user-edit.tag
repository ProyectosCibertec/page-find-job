<%@tag import="model.User"%>
<%@ tag language="java" pageEncoding="UTF-8"%>


<%
User user = (User) request.getSession().getAttribute("u");
%>

<div class="card">
	<form class="card-body">
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Nombre</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" value="${u.name}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Apellidos</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" value="${u.lastName}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Email</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="email" class="form-control" value="${u.email}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Teléfono</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" value="${u.phone}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Fecha de nacimiento</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="date" class="form-control" value="${u.birthDate}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Dirección</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" value="${u.address}">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-9 text-secondary">
				<input type="button" class="btn btn-primary px-4"
					value="Save Changes">
			</div>
		</div>
	</form>
</div>