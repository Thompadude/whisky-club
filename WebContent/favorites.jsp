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
<%@ include file="topmenu.jsp"%>
<div class="content container-fluid">
		<h1><img class="icon" src="http://www.entypo.com/images/heart.svg">&nbsp;&nbsp;Favorites</h1>
		<%
		String filePath = getServletContext().getRealPath("/whiskyData.dat");
		ArrayList<Whisky> allWhiskies = Data.getWhiskyHandler().loadWhiskies(filePath);
		%>
	<ul class="listPictures">
		<%
		boolean favIsEmpty = true;
		for(int i = 0; i < allWhiskies.size(); i++) {
			if(allWhiskies.get(i).isFavorite()) {
				favIsEmpty = false;
		%>
		<li>
			<div class="whiskywrapper">
				<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
					<img class="img-responsive"
					src="<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>">
				</a>
				<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
			</div>
		</li>				
		<%}
		}
		if(favIsEmpty) {%>
			<div class="listheader">
				<h2>You don't have any favorites yet.
				<p>Go to all whiskies <a href="${pageContext.request.contextPath}/list.jsp">here</a></p></h2>
	</div>
		<%}%>
	</ul>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="smoothPage.js"></script>
</html>