<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Whiskey in the Jar</title>
</head>
<body>
<%@ include file="menu/menu.jsp" %>
	<div class="content container-fluid">
		<div class="row">
		<div class="col-lg-2">
			<!-- Added to simulate white space. -->
			<button class="hiddenbutton"></button>
		</div>
			<div class="col-lg-4 indexdiv">
				<a href="${pageContext.request.contextPath}/list.jsp">
					<img class="img-responsive" src="${pageContext.request.contextPath}/images/indeximg-a.jpg">
					<p>List All Whiskies</p>
				</a>
			</div>
			<div class="col-lg-4 indexdiv">
				<a href="${pageContext.request.contextPath}/favorites.jsp">
					<img class="img-responsive" src="${pageContext.request.contextPath}/images/indeximg-b.jpg">
					<p>Favorite Whiskies</p>
				</a>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-2">
				<button class="hiddenbutton indeximg"></button>
			</div>
			<div class="col-lg-8 indexdiv">
				<a href="${pageContext.request.contextPath}/guestbookform.jsp">
					<img class="img-responsive indeximg" src="${pageContext.request.contextPath}/images/indeximg-c.jpg">
					<p>Guestbook</p>
				</a>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/menu/menu.js"></script>
<script src="${pageContext.request.contextPath}/index.js"></script>
</body>
</html>