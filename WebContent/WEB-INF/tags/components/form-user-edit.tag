<%@tag import="model.User"%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="card">
	<div id="modal-message"></div>
	<form class="card-body" action="userServlet" method="POST">
		<input type="hidden" name="inputCode" value="${u.code}">
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Nombre</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" name="inputName"
					value="${u.name}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Apellidos</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" name="inputLastName"
					value="${u.lastName}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Email</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="email" class="form-control" disabled value="${u.email}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Teléfono</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" name="inputPhone"
					value="${u.phone}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Fecha de nacimiento</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="date" class="form-control" name="inputBirthDate"
					value="${u.birthDate}">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-3">
				<h6 class="mb-0">Dirección</h6>
			</div>
			<div class="col-sm-9 text-secondary">
				<input type="text" class="form-control" name="inputAddress"
					value="${u.address}">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-9 text-secondary">
				<input type="submit" name="button" value="update"
					class="btn btn-primary px-4" value="Guardar Cambios"> <input
					type="button" id="btnCancelEdit" class="btn btn-danger px-4"
					value="Cancelar">
			</div>
		</div>
	</form>
</div>
<script>
	const edit = document.querySelector('#btnCancelEdit')
		edit.addEventListener('click', e => {
	    <%request.getSession().removeAttribute("isEdit");%>
	    window.location.reload()
		})
</script>
