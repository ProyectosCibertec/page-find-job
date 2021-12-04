
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page import="model.User"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="f"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>


<f:if test="${u == null}">
	<f:redirect url="/sign-in.jsp" />
</f:if>

<t:layout titlePage="Mis Propuestas" css="postulacion.css"
	cssExternal="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
	<jsp:body>
		<div class="container">
			<h2 class="title">Mis Propuestas</h2>
			
				<div class="container px-4 postulacion">
				
					<f:forEach var="f" items="1,2,3,4">
					
					  <div class="row postulacion-item">
					    <div class=" postulacion-item__left"
							data-targeturl="linkItem-${f}">
					    	<div class="postulacion-item_left-text">
						    	<div class="postulacion-item__title">Practicante Front End</div>
						    	<div>Empresa</div>
						    	<div>
						    		<span>Lima</span>
						    		<span>10/12/1999</span>
						    	</div>
					    	</div>
					    </div>
					    <div class="postulacion-item__right demo${f}">
					    	<i data-targeturl="linkTash-${f}"
								class="far fa-trash-alt postulacion-item__right-icon"></i>
					    </div>
					  </div>
					</f:forEach>
					
				</div>
	    </div>
	    <script>
			document.addEventListener('DOMContentLoaded', () => {
			   const pi = document.querySelectorAll('.postulacion-item__left')
			   const tash = document.querySelectorAll('.postulacion-item__right-icon')
			   
			   const actionLink = (element, option) => {
			     element.addEventListener('click', function(){
				      url = option + this.dataset.targeturl
	 			     console.log(url)
				  })
			   }
			   pi.forEach( el => {
			     actionLink(el, 'get/')
			   })
			   tash.forEach(el => {
			     actionLink(el, 'tash/')
			   })
			})	    	
	    </script>
    </jsp:body>
</t:layout>




