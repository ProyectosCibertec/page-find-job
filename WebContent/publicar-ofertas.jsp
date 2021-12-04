<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAOFactory"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page import="model.User"%>
<%@page import="model.Language"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>

<%
DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
ArrayList<Language> languageList = factory.getLanguageDAO().list();

pageContext.setAttribute("languageList", languageList);
%>

<f:if test="${u == null}">
	<f:redirect url="/sign-in.jsp" />
</f:if>
<f:if test="${u.isEmpresa == 0}">
	<f:redirect url="/index.jsp" />
</f:if>

<t:layout titlePage="Publicar oferta" css="profile.css"
	cssExternal="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<jsp:body>
		<div class="container">
		  <main class="d-flex flex-column align-items-center mb-5">
		  	<h1 class="h3 mb-3 text-center">Encuentra al developer ideal para tu empresa</h1>
		    <div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<form action="offerServlet" method="POST">
							  <div class="form-group mt-2">
   								 <label for="inputTitle" class="mb-2">Título / Puesto</label>
    							 <input type="text" class="form-control" name="inputTitle"
										placeholder="" max="50" value="${title}">
  							  </div>
  							  <div class="form-group mt-2">
   								 <label for="inputDescripcion" class="mb-2">Descripción</label>
    							 <textarea class="form-control" name="inputDescripcion"
										placeholder="" rows="12" maxlength="2500">${descripcion}</textarea>
  							  </div>
  							  <div class="row mt-2">
  							     <div class="form-group col-md-6">
   									 <label for="inputVacantes" class="mb-2">Nro de vacantes</label>
    								 <input type="number" class="form-control"
											name="inputVacantes" placeholder="" value="${vacantes}">
  							  	 </div>
  							  	 <div class="form-group col-md-6">
   									 <label for="inputFecha" class="mb-2">Fecha limite</label>
    								 <input type="date" class="form-control" name="inputFecha"
											placeholder="" value="${fecha}">
  							  	 </div>
  							  </div>
  							   <div class="row mt-2 mb-4">
  							  		<div class="form-group col-md-8">
   								 		<label for="cboLanguage" class="mb-2">Lenguajes requeridos</label>
    									 <select class="form-control" name="cboLanguage">
    							  			 <option value="">Seleccione</option>
    							 			 <f:forEach items="${languageList}" var="l">
    							 		   		<option value="${l.code}">${l.name}</option>
    							 		     </f:forEach>
    							 		</select>
  							  		</div>
  							  		<button name="button" value="add"
										style="border-radius: 50%; width: 40px; height: 40px; align-self: flex-end"
										class="btn btn-primary" type="submit">
										<i class="fa fa-plus"></i>
									</button>
  							  		 <f:if test="${ languagesOfferList != null}">
							 			<button name="button" value="remove"
											class="btn btn-link col-md-2 text-danger" type="submit"
											style="align-self: flex-end">Limpiar lenguajes</button>
							 		</f:if>
  							  </div>
  							  <div class="col-8 mx-auto mb-4">
  							  	<f:forEach var="l" items="${languagesOfferList}">
									<c:tag language="${l.name}" />
							 	</f:forEach>
							  </div>
		      				  <button name="button" value="register"
									class="w-22 btn btn-md btn-primary" type="submit">Registrar</button>
		    			</form>
					</div>
				</div>
		    </div>
		  </main>
		</div>
		<f:if test="${message != null}">
			<div id="modal-message"></div>
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
				      document.getElementById('modal-message').innerHTML ='<f:remove var="message" scope="session" /> ';
				    })
				  })
	        </script>
		  </f:if>
    </jsp:body>
</t:layout>