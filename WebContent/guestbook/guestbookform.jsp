<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Guest Book</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/Guestbook" method="get" name="validate">
	<input class="formfield" id="uName" type="text" name="Name" placeholder="Name">
	<input class="formfield" id="cmnt" type="text" name="cmnt" placeholder="Entry">
	<input type="reset" class="formbutton">
	<input type="submit" class="formbutton" value="Submit">
</form>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/validateSelectedWhiskyForm.js"></script>
</body>
</html>