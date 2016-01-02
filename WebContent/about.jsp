<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="main.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href=href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Whiskey in the Jar</title>
</head>
<body>
	<%@ include file="menu/menu.jsp"%>
	<%@ include file="background.jsp"%>
	<div class="content">
		<div class="container">
			<div class="jumbotron">
				<% AboutText aboutText = new AboutText(); %>
				<h1><%= aboutText.getAboutHeadline() %></h1>
				<p><%= aboutText.getAboutText() %></p>
			</div>
		</div>
	</div>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="menu/menu.js"></script>
</body>
</html>