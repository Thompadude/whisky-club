<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
</head>
<body>
<div id="loginwrapper">
	<div class="jumbotron">
		<form method="post">
			<div id="errormsg"></div>
			<p><label class="loginfield"><input type="text" id="usrName" placeholder="User Name" value="boss"></label></p>
			<p><label class="loginfield"><input type="password" id="password" placeholder="Password" value="boss"></label></p>
			<input class="formbutton" type="reset">
			<button type="button" class="formbutton" id="submit">Submit</button>
		</form>
	</div>
	<h2 id="loginwelcomemsg"></h2>
</div>
<h2 id="loginAuth"></h2>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/login/login.js"></script>
</html>