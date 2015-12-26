<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../stylesheet.css">
<title>Laphroaig Quarter Cask</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<%@ include file="/background.jsp"%>

	<% LaphroaigQuarterCask quarterCask = new LaphroaigQuarterCask(); %>

	<div class="container aboutwhiskyconent">
		<div class="row">
			<div class="col-lg-2">
				<a href="<%= quarterCask.getImgUrl() %>">
				<img class="img-thumbnail" src="<%= quarterCask.getImgUrl() %>" alt="Laphroaig Quarter Cask" width="200px">
				</a>
			</div>
			<div class="col-lg-8">
				<p><%= quarterCask.getInfo() %></p>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>

	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../menu.js"></script>
</body>
</html>