<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">

<title>Top menu</title>
</head>
<body>
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
        			<a href="${pageContext.request.contextPath}/whiskylists/list.jsp">
					<img class="icon" alt="Whiskies" title="Whiskies"
						src="http://www.entypo.com/images/document.svg"
						onmouseover="src='http://www.entypo.com/images/documents.svg'"
						onmouseout="src='http://www.entypo.com/images/document.svg'">
					</a>
        		</li>
        		
        		<li>
					<a href="${pageContext.request.contextPath}/whiskylists/favorites.jsp">
					<img class="icon" alt="Favorites" title="Favorites" 
						src="http://www.entypo.com/images/heart-outlined.svg"
						onmouseover="src='http://www.entypo.com/images/heart.svg'"
						onmouseout="src='http://www.entypo.com/images/heart-outlined.svg'">
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/guestbook/guestbook.jsp">
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
</div>
</body>
</html>