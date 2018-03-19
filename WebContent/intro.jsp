<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="static com.arjvik.acccsurvey.Resources.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ACCC Survey</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>Hi! This is the ACCC Survey!</h1>
<% if(com.arjvik.acccsurvey.Resources.DEBUG) { %>
	<%= DEBUG_TEXT %>
<% } %>

<%
	for(String p : INTRO_PARAMS)
		session.setAttribute(p,request.getParameter(p));
	
	session.setAttribute("pageNumber", 0);
	
	int r = TREATMENTS.length;
	int c = AREAS.length;
%>
<form action="main.jsp" method="<%= POST %>">
	<table>
		<tr>
			<th class="noborder"></th>
			<% for(int i = 0; i < c; i++) { %>
				<th><%= AREAS_PRETTY[i] %></th>
			<% } %>
		</tr>
		<% for(int i = 0; i < r; i++) { %>
			<tr>
				<td><%= TREATMENTS_PRETTY[i] %></td>
				<% for(int j = 0; j < c; j++) { %>
					<td><input type="checkbox" name="<%= TREATMENTS[i] + "_" + AREAS[j] %>"></td>
				<% } %>
			</tr>
		<% } %>
	</table>
	<input type="submit" value="Next">
</form>
</body>
</html>