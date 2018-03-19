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
<% if(DEBUG) { %>
	<%= DEBUG_TEXT %>
<% } %>
<form action="intro.jsp" method="<%= POST %>">
	<% for(int i = 0; i < INTRO_PARAMS.length; i++) { %>
		<%= INTRO_PRETTY[i] %>: <input type="<%= INTRO_TYPE[i] %>" name="<%= INTRO_PARAMS[i] %>"><br>
	<% } %>
	<input type="submit" value="Next">
</form>
</body>
</html>