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
	int pageNumber = (int)session.getAttribute("pageNumber");
	String nextPage = pageNumber!=(2*AREAS.length)-1 ? "main.jsp" : "final.jsp";
	if(pageNumber == 0) {
		for(String p : TREATMENT_AREA_PARAMS)
			session.setAttribute(p,request.getParameter(p)!=null ? true : false);
	} else {
		int oldPageNumber = pageNumber - 1;
		for(String t : TREATMENTS){
			String s = t+"_"+AREAS[oldPageNumber/2];
			if((boolean)session.getAttribute(s)==(oldPageNumber%2==0)){
				s += "_ANSWER";
				session.setAttribute(s,request.getParameter(s));
			}
		}
	}
%>
<form action="<%= nextPage %>" method="<%= POST %>">
	<table>
		<tr>
			<th class="noborder"></th>
			<th><%= (pageNumber%2==0?AREAS_POS:AREAS_NEG)[pageNumber/2] %></th>
		</tr>
		<% for(int i = 0; i < TREATMENTS.length; i++) { %>
			<% if(((boolean)session.getAttribute(TREATMENTS[i]+"_"+AREAS[pageNumber/2]))==(pageNumber%2==0)) { %>
				<tr>
					<td><%= TREATMENTS_PRETTY[i] %></td>
					<td><input type="text" name="<%= TREATMENTS[i]+"_"+AREAS[pageNumber/2]+"_ANSWER" %>"></td>
				</tr>
			<% } %>
		<% } %>
	</table>
	<input type="submit" value="Next">
</form>
</body>
</html>
<% session.setAttribute("pageNumber", (int)session.getAttribute("pageNumber")+1); %>