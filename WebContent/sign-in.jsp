<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titlePage="Login" css="login.css">
	<jsp:body>
		<div class="container">
		  <main class="form-signin flex-column">
		    <div
					class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-center mb-4">
		      <img
						src="https://getbootstrap.com//docs/5.1/assets/brand/bootstrap-logo.svg"
						alt="" width="72" height="57">
		    </div>
			<div class='switch'>
			  <input type='checkbox' checked>
			</div>
		    <form>
		      <h1 class="h3 mb-3 fw-normal">Iniciar sessión</h1>
		
		      <div class="form-floating">
		        <input type="email" class="form-control" id="inputEmail"
							placeholder="name@example.com">
		        <label for="inputEmail">Correo electrónico</label>
		      </div>
		      <div class="form-floating">
		        <input type="password" class="form-control" id="inputPassword"
							placeholder="Password">
		        <label for="inputPassword">Contraseña</label>
		      </div>
		
		      <div class="checkbox mb-3">
		        <label>
		          <input type="checkbox" value="remember-me"> Recuérdame
		        </label>
		      </div>
		      <button class="w-100 btn btn-lg btn-primary" type="submit">Ingresar</button>
		    </form>
		  </main>
		    <p class="small text-center text-gray-soft">¿Aún no tienes cuenta? <a
					href="#">Sign up</a>
				</p>
		</div>
    </jsp:body>
</t:layout>