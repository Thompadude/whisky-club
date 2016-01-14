<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<%@ include file="menu/topmenu.jsp"%>
<div class="content container-fluid">
	<h1><img class="icon" src="http://www.entypo.com/images/cog.svg">&nbsp;&nbsp;Settings</h1>
	<br>
	<h3><a href="SettingsServlet?resetWhiskies=reset">
			Click here to reset all whiskies (erase all savings and add the hardcoded again).</a>
	</h3>
	<br>
	<h3><a href="SettingsServlet?resetGuestbook=reset">
			Click here to clear the guestbook!</a>
	</h3>
	<br>
	<br>
	<%if (request.getAttribute("clearmessage") != null) { %>
	<div id="clearmessage"><%=request.getAttribute("clearmessage")%></div>
	<br>
	<div id="pathmessage"><%=request.getAttribute("pathmessage")%></div>
	<%}; %>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
</body>
</html>