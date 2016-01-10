<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="management.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Whisky Settings</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<div class="content container-fluid">
	<h1>Whisky Settings</h1>
	<h3><a href="WhiskyManageServlet?reset=reset">
			Click here to clear all whiskies (erase all savings and add the hardcoded again).</a>
	</h3>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
</body>
</html>