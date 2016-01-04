<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<%@ page import="management.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Guest Book</title>
</head>
<body>
	<table class="table table-hover">
		<tr>
			<th>Entry</th>
			<th>Date</th>
			<th>Name</th>
		</tr>
	          <%
	          ArrayList<GuestbookEntries> entries = (ArrayList<GuestbookEntries>) session.getAttribute("guestbook");
	          	for (int i = entries.size()-1; i >= 0; i--) {
	          %>
	   		<tr>
	            <td><%=entries.get(i).getEntry()%></td>
	            <td><%=entries.get(i).getDate()%></td>
	            <td><%=entries.get(i).getName()%></td>
			<tr>
	        </tr>
	          <%}%>
	    </table>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>