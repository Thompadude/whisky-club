<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Whisky Settings</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<div class="content container-fluid">
	<nav class="navbar navbar-inverse specialnav">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span>Navigation</span>
      			</button>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
	        		<li>
	        			<a href="${pageContext.request.contextPath}/index.jsp">
					 	<img class="icon" alt="Home" title="Home" src="http://www.entypo.com/images/home.svg"
					 	onmouseover="src='http://www.entypo.com/images/arrow-with-circle-up.svg'"
					 	onmouseout="src='http://www.entypo.com/images/home.svg'"></a>
	        		</li>
	        		
	        		<li>
	        			<a href="${pageContext.request.contextPath}/list.jsp">
						<img class="icon" alt="Whiskies" title="Whiskies"
							src="http://www.entypo.com/images/document.svg"
							onmouseover="src='http://www.entypo.com/images/documents.svg'"
							onmouseout="src='http://www.entypo.com/images/document.svg'">
						</a>
	        		</li>
	        		
	        		
	        		<li>
						<a href="${pageContext.request.contextPath}/favorites.jsp">
						<img class="icon" alt="Favorites" title="Favorites" 
							src="http://www.entypo.com/images/heart-outlined.svg"
							onmouseover="src='http://www.entypo.com/images/heart.svg'"
							onmouseout="src='http://www.entypo.com/images/heart-outlined.svg'">
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/guestbookform.jsp">
						<img class="icon" alt="Guestbook" title="Guestbook"
							src="http://www.entypo.com/images/book.svg"
							onmouseover="src='http://www.entypo.com/images/open-book.svg'"
							onmouseout="src='http://www.entypo.com/images/book.svg'">
						</a>
					</li>
      			</ul>
    		</div>
  		</div>
	</nav>
	<h1>Whisky Settings</h1>
	<br>
	<h3><a href="SettingsServlet?resetWhiskies=reset&resetGuestbook=noThanks">
			Click here to reset all whiskies (erase all savings and add the hardcoded again).</a>
	</h3>
	<br>
	<h3><a href="SettingsServlet?resetGuestbook=reset&resetWhiskies=noThanks">
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