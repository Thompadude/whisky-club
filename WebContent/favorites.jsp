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
<div class="content">
	<nav class="navbar navbar-inverse navbar-fixed-top">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span>Navigation</span>
      			</button>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
	        		<li>
			<a href="${pageContext.request.contextPath}/favorites.jsp">
				<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/heart.svg">
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/list.jsp">
				<img class="icon" alt="Back" title="Back" src="http://www.entypo.com/images/arrow-bold-left.svg">
			</a>
		</li>
      			</ul>
    		</div>
  		</div>
	</nav>
		<%
		ArrayList<Whisky> allWhiskies = Data.getWhiskyHandler().getWhiskies();
		%>
	<ul class="listPictures">
		<h1 class="listheader">Favorites</h1>
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
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
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