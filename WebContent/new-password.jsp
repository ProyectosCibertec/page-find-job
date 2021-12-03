<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>



<t:layout titlePage="Password restore" css="login.css">
	<jsp:body>
		<div class="container">
		  <main class="form-signin flex-column">
		    <div
					class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-center mb-4">
		      <img
						src="https://getbootstrap.com//docs/5.1/assets/brand/bootstrap-logo.svg"
						alt="" width="72" height="57">
		    </div>
		    <form action="userServlet" method="POST">
		      <h1 class="h3 mb-3 fw-normal">Cambiar contraseña</h1>
		
		      <div class="form-floating">
		        <input type="email" class="form-control" id="inputEmail"
							name="inputEmail" placeholder="name@example.com">
		        <label for="inputEmail">Correo electrónico</label>
		      </div>
		      
		      <div class="form-floating">
		        <input type="password" class="form-control" id="inputPassword"
							name="inputPassword" placeholder="Password">
		        <label for="inputPassword">Nueva contraseña</label>
		      </div>
		      
		      <div class="form-floating">
		        <input type="password" class="form-control"
							id="inputRetryPassword" name="inputRetryPassword"
							placeholder="Password">
		        <label for="inputRetryPassword">Repetir contraseña</label>
		      </div>
		
		
		      <button name="button" value="restore"
						class="w-100 btn btn-lg btn-primary  mt-4" type="submit">Cambiar</button>
		    </form>
		  </main>
		</div>
		<f:if test="${message != null}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			  <div id="liveToast"
					class="toast bg-danger ${message != null ? 'show' : 'hide' }"
					role="alert" aria-live="assertive" aria-atomic="true">
			    <div class="toast-body d-flex justify-content-between">
					<span style="color: white;"> 
						${message}
					</span>
				    <div>
						<button type="button" class="btn-close" data-bs-dismiss="toast"
								aria-label="Close"></button>
				    </div>
			    </div>
			  </div>
			</div>
		  <script>
		  document.addEventListener('DOMContentLoaded', () => {
            const btn = document.querySelector('.btn-close')
            const toast = document.querySelector('.toast')
             btn.addEventListener('click', e => {
              toast.classList.remove("show")
              toast.classList.add("hide")
            })
          })
        </script>
		  </f:if>
    </jsp:body>
</t:layout>