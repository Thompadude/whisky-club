<%@page import="database.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="whiskies.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Favorites</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<%@ include file="background.jsp"%>
<div class="content">
	<ul class="nav nav-tabs">
		<li>
			<a href="${pageContext.request.contextPath}/favorites.jsp">
				<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star-outlined.svg">
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/list.jsp">
				<img class="icon" src="http://www.entypo.com/images/arrow-bold-left.svg">
			</a>
		</li>
	</ul>
		<%
		ArrayList<Whisky> allWhiskies = (ArrayList<Whisky>) session.getAttribute("allWhiskies");
		if(allWhiskies == null) {
			allWhiskies = new ArrayList<>();
			System.out.println("den var tom!!");
		}
		%>
	<ul class="listPictures">
		<%
		for(int i = 0; i < allWhiskies.size(); i++) {
			if(allWhiskies.get(i).isFavorite()) {	
		%>
		<li>
			<div class="whiskywrapper">
				<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
					<img class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>">
				</a>
				<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
			</div>
		</li>				
		<%}}%>
	</ul>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="smoothPage.js"></script>
</html>