<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>



<t:layout titlePage="Register" css="register.css">
	<jsp:body>
	    <div class="container" id="registration-form">
	        <div class="image"></div>
	        <div class="frm">
	            <h1>Registrar</h1>
	            <form action="userServlet" method="POST" id="form">
					<div class="form-floating">
					   <input type="email" class="form-control regex" id="inputEmail"
							name="inputEmail" placeholder="name@example.com">
					   <label for="inputEmail">Correo electrónico</label>
					</div>
					
					<div class="form-floating">
					   <input type="text" class="form-control required" id="inputName"
							name="inputName" placeholder="name@example.com">
					   <label for="inputName">Nombres</label>
					</div>

					<div class="form-floating">
					   <input type="text" class="form-control required"
							id="inputLastName" name="inputLastName"
							placeholder="name@example.com">
					   <label for="inputLastName">Apellidos</label>
					</div>
					
					<div class="form-floating">
					   <input type="date" class="form-control required"
							id="inputBirthDate" name="inputBirthDate"
							placeholder="name@example.com">
					   <label for="inputBirthDate">Fecha de cumpleaños</label>
					</div>
					
					<div class="form-floating">
					   <input type="password" class="form-control required"
							id="inputPassword" name="inputPassword" placeholder="Password">
					   <label for="inputPassword">Contraseña</label>
					</div>
					
					<div class="form-floating">
					   <input type="password" class="form-control required"
							id="inputRetryPassword" name="inputRetryPassword"
							placeholder="Password">
					   <label for="inputRetryPassword">Repetir contraseña</label>
					</div>
					
					
					<div class="form-group d-flex" style="justify-content: center;">
					    <button name="button" value="register" type="submit"
							class="btn btn-primary btn-lg">Registrar</button>
					</div>
	            </form>
	        </div>
	    </div>
		<f:if test="${ok != null}">
			<div id="modal-message"></div>
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			  <div id="liveToast"
					class="toast bg-${ok == 1? 'success' : 'danger' } ${ok != null ? 'show' : 'hide' }"
					role="alert" aria-live="assertive" aria-atomic="true">
			    <div class="toast-body d-flex justify-content-between">
					<span style="color: white;"> 
						${ ok == 0 ? 'El email ya se encuentra registrado en nuestro sistema.' :  ok == 1 ? 'Se registró con exito' : 'Las contraseñas no coinciden.'}
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
		              document.getElementById('modal-message').innerHTML ='<f:remove var="ok" scope="session" /> ';
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
				    window.location.href ="userServlet?button=register&" + $.param(params);
				  }
				
				});	            
	          })
        </script>
    </jsp:body>
</t:layout>