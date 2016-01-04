<%@page import="java.util.ArrayList"%>
<%@page import="whiskies.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Favorites</title>
</head>
<body>
	<%@ include file="menu/menu.jsp"%>
	<%@ include file="background.jsp"%>
	<div class="content">
		<ul class="nav nav-tabs">
			<li><a href="${pageContext.request.contextPath}/favorites.jsp"><img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star-outlined.svg"></a></li>
			<li><a href="${pageContext.request.contextPath}/list.jsp"><img class="icon" src="http://www.entypo.com/images/arrow-bold-left.svg"></a></li>
		</ul>
		<%
			ArrayList<Whisky> favoriteWhiskies = new ArrayList<>();
		%>
		<a href="ListServlet?whisky=${chosenWhisky.getId()}"></a>
		Här är favorites
		
	</div>
</body>
</html>