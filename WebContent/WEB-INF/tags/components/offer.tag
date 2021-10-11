<%@tag import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ tag description="offer" pageEncoding="UTF-8"%>
<%@taglib prefix="c" tagdir="/WEB-INF/tags/components"%>

<%@attribute name="title" required="true"%>
<%@attribute name="description" required="true"%>
<%@attribute name="expires" required="true"%>
<%@attribute name="vacant" required="true"%>



<div class="offer row mt-4 mb-4">
	<div class="col-6">
		<div class="row justify-content-between">
			<div class="col-2 d-flex align-items-center">
				<img alt="" src="assets/images/icons/edifice.png">
			</div>
			<div class="col-9">
				<h5 class="title">${title}</h5>
				<p class="text-break">${description}</p>
				<div class="row">
					<p class="col-auto">
						<span class="fw-bold">Vence:</span> ${expires}
					</p>
					<p class="col-auto offset-md-2">
						<span class="fw-bold">Vacantes:</span> ${vacant}
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-4 m-auto">
		<%
		String language[] = { "HTML", "JAVA", "JAVASCRIPT", "CSS3", "RUBY", "GO", "MONGODB" };

		for (String e : language) {
		%>
		<c:tag language="<%=e%>" />
		<%}%>
	</div>
	<div class="col-2" style="text-align: right; margin: auto;">
		<input type="button" class="btn btn-warning" value="APLICAR">
	</div>
</div>