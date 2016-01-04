<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Menu</title>
</head>
<body>
	<div id="menu">
		<div id="iconCloseMenu">
			<img class="icon" src="http://www.entypo.com/images/cross.svg" alt="cross">
		</div>
			<div class="btn-group-vertical menubtn">
				<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-default menubtn">Home</a>
				<a href="${pageContext.request.contextPath}/list.jsp" class="btn btn-default menubtn">Whiskies</a>
				<a href="${pageContext.request.contextPath}/guestbook/guestbookform.jsp" class="btn btn-default menubtn">Guestbook</a>
				<a href="${pageContext.request.contextPath}/about.jsp" class="btn btn-default menubtn">About</a>
				<a href="${pageContext.request.contextPath}/login.html" class="btn btn-default menubtn">Log out</a>
			</div>
	</div>
	<div id="iconOpenMenu">
		<img class="icon" src="http://www.entypo.com/images/menu.svg" alt="menu" style="background-color: black">
	</div>
	<div class="overlay"></div>
</body>
</html>