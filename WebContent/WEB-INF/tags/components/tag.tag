<%@ tag description="tag" pageEncoding="UTF-8"%>
<%@attribute name="language" required="true"%>

<%
String color;
switch (language.toUpperCase()) {
case "JAVA":
case "RUBY":
	color = "danger";
	break;
case "JAVASCRIPT":
	color = "warning";
	break;
case "GO":
	color = "secondary";
	break;
default:
	color = "primary";
}
%>

<span class="btn btn-outline-<%=color%> btn-sm mt-1" style="cursor: default;">${language.toUpperCase()}</span>
