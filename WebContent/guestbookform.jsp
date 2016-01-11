<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Guest Book</title>
</head>
<body>
<%@ include file="../menu/menu.jsp"%>
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
      			</ul>
    		</div>
  		</div>
	</nav>
	<h1>Guestbook</h1>
	<div class="row">
		<div class="col-lg-12">
		<!-- Comment form -->
			<form method="post">
				<label>
					<input class="formfield" type="text" name="name" placeholder="Name" id="formName">
				</label>
				<br>
				<label>
					<textarea class="formfield" rows="10" cols="21" name="entry" placeholder="Entry" id="formEntry"></textarea>
				</label>
				<br>
				<input type="reset" class="formbutton" value="Clear">
				<button type="button" class="formbutton" id="submit">Submit</button>
			</form>
		</div>
	</div>
		
	<div class="container-fluid commentfield" id="guestbookContainer">
		<div id="entryDiv">
			<!-- Here comes the guestbook entries -->
		</div>
	</div>	
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/menu/menu.js"></script>
<script src="${pageContext.request.contextPath}/guestbookscript.js"></script>
</body>
</html>