
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

<link rel="stylesheet" href="./assets/css/profile.css">

<t:layout titlePage="Profile">
	<jsp:body>
<div class="container">
    <div class="main-body">
       
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div
									class="d-flex flex-column align-items-center text-center">
                    <img
										src="https://bootdey.com/img/Content/avatar/avatar7.png"
										alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <h4>${u.name} ${u.lastName}</h4>
                      <p class="text-secondary mb-1">Full Stack Developer</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <ul class="list-group list-group-flush">
                
                <f:forEach var="f" items="[1,2,3,4,5]">
	                <li
										class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
	                    <h6 class="mb-0">
						<img alt="facebook" src="./assets/images/icons/logos/website.svg">Website</h6>
	                    <span class="text-secondary">https://bootdey.com</span>
	                </li>
                </f:forEach>
                </ul>
              </div>
            </div>
            <div class="col-md-8">
           <f:choose>
           		<f:when test="${!isEdit}">
            		<c:form-user-noedit />
           		</f:when>
           		<f:otherwise>
           			<c:form-user-edit />
           		</f:otherwise>
           </f:choose>

					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<h5 class="d-flex align-items-center mb-3">Project Status</h5>
									<p>Web Design</p>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-primary" role="progressbar"
												style="width: 10%" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
									</div>
									<p>Website Markup</p>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-danger" role="progressbar"
												style="width: 72%" aria-valuenow="72" aria-valuemin="0"
												aria-valuemax="100"></div>
									</div>
									<p>One Page</p>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-success" role="progressbar"
												style="width: 89%" aria-valuenow="89" aria-valuemin="0"
												aria-valuemax="100"></div>
									</div>
									<p>Mobile Template</p>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-warning" role="progressbar"
												style="width: 55%" aria-valuenow="55" aria-valuemin="0"
												aria-valuemax="100"></div>
									</div>
									<p>Backend API</p>
									<div class="progress" style="height: 5px">
										<div class="progress-bar bg-info" role="progressbar"
												style="width: 66%" aria-valuenow="66" aria-valuemin="0"
												aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>



            </div>
          </div>

        </div>
    </div>
    </jsp:body>
</t:layout>



