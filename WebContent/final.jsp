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
	int oldPageNumber = (int)session.getAttribute("pageNumber") - 1;
	for(String t : TREATMENTS){
		String s = t+"_"+AREAS[oldPageNumber/2];
		if((boolean)session.getAttribute(s)==(oldPageNumber%2==0)){
			s += "_ANSWER";
			session.setAttribute(s,request.getParameter(s));
		}
	}
%>
<form action="done.jsp" method="<%= POST %>">
	Comments: <textarea name="comments">Please tell us about how our survey was. How difficult was it to answer? Should there have been more answer choices? Anything else?</textarea>
	<input type="submit" value="Submit">
</form>
</body>
</html>