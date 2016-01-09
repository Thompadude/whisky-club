<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="stylesheets/stylesheet.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="login.js"></script>
</head>
<body>
<div id="loginwrapper">
	<div class="jumbotron" id="loginjumobtron">
		<form action="LoginServlet" method="post">
			<p><label class="loginfield"><input type="text" name="usrName" placeholder="User Name" value="boss"></label></p>
			<p><label class="loginfield"><input type="password" name="password" placeholder="Password" value="boss"></label></p>
			<p>
				<input class="formbutton" type="reset">
				<input class="formbutton" id="loginsubmitbutton" type="submit" value="Submit">
				<%boolean loginCheck = (Boolean) session.getAttribute("isSuccessfulLogin");%>
				<input type="hidden" id="validate" value="<%=loginCheck%>">
		</form>
	</div>
	<h2 id="loginwelcomemsg"></h2>
</div>
</body>
</html>