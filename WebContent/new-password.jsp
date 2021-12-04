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
		    
		    <f:if test="${isPasswordChanged == null}">
			    <form action="userServlet" method="POST" id="form">
			      <h1 class="h3 mb-3 fw-normal">Cambiar contraseña</h1>
			
			      <div class="form-floating">
			        <input type="email" class="form-control regex"
								id="inputEmail" name="inputEmail" placeholder="name@example.com">
			        <label for="inputEmail">Correo electrónico</label>
			      </div>
			      
			      <div class="form-floating">
			        <input type="password" class="form-control required"
								id="inputPassword" name="inputPassword" placeholder="Password">
			        <label for="inputPassword">Nueva contraseña</label>
			      </div>
			      
			      <div class="form-floating">
			        <input type="password" class="form-control required"
								id="inputRetryPassword" name="inputRetryPassword"
								placeholder="Password">
			        <label for="inputRetryPassword">Repetir contraseña</label>
			      </div>
			
			
			      <button class="w-100 btn btn-lg btn-primary  mt-4"
							type="submit">Cambiar</button>
			    </form> 
		    </f:if>
		    <f:if test="${isPasswordChanged != null}">
		   		<div id="modal-message"></div>
		    	<h3 class="h3 mb-3 fw-normal text-center">Actualización de contraseña realizada</h3>
		    	<button class="btn btn-primary" id="back">Llévame al login</button>
			  <script>
				document.addEventListener('DOMContentLoaded', () => {		            
				  const btn = document.querySelector('#back')
				  
				  btn.addEventListener('click', e => {
				    document.getElementById('modal-message').innerHTML ='<f:remove var="isPasswordChanged" scope="session" /> ';
				    window.location.href = "sign-in.jsp"
				  })     
				})
	        </script>
		    </f:if>
		   
		  </main>
		</div>
		
		<f:if test="${ok != null}">
				<div id="modal-message"></div>
				<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				  <div id="liveToast"
					class="toast bg-${ok == 1? 'success' : 'danger' } ${ok != null ? 'show' : 'hide' }"
					role="alert" aria-live="assertive" aria-atomic="true">
				    <div class="toast-body d-flex justify-content-between">
						<span style="color: white;"> 
							${ ok == 0 ? 'No existe el email en nuestro sistema.' :  ok == 1 ? 'Se cambió la contraseña con exito' : 'Las contraseñas no coinciden.'}
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
				    document.getElementById('modal-message').innerHTML ='<f:remove var="ok" scope="session" /> <f:remove var="isPasswordChanged" scope="session" /> ';
				  })     
				})
	        </script>
		  </f:if>
		<script type="text/javascript" src="assets/js/validation.js"></script>
		  <script>
			  document.addEventListener('DOMContentLoaded', () => {
			    const form = document.querySelector('#form')
	            const inputs = form.getElementsByTagName('input')
	            
	            let inputList = []
	            
			    Array.from(inputs).forEach(e => inputList.push(e.id))
	            
				formValidation('form', inputList, (isValid, params) => {
				  if (isValid) {
				    window.location.href ="userServlet?button=restore&" + $.param(params);
				  }
				
				});	            
	          })
        </script>
    </jsp:body>
</t:layout>