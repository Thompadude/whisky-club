<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Add New Whisky</title>
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
	
	<h1>Add Whisky</h1>
	
	<div id="addwhiskymargin">
		<form class="form-horizontal" role="form" method="POST">
		<div class="row">
			<div class="col-md-5">
				<label class="control-label" for="name">Name:</label>
				<input type="text" class="form-control" id="name" placeholder="Enter name">
				<label class="control-label" for="region">Region:</label>
				<input type="text" class="form-control" id="region" placeholder="Enter region">
				<label class="control-label" for="country">Country:</label>
				<input type="text" class="form-control" id="country" placeholder="Enter country">
				<label class="control-label">Type: </label>
				<div class="radio">
				<label><input type="radio" name="type" id="singlemalt" value="Single Malt">&nbsp;Single Malt</label>
				</div>
				<div class="radio">
				<label><input type="radio" name="type" id="blended" value="Blended">&nbsp;Blended</label>
				</div>
				<label class="control-label" for="alc">Alcohol Volume:</label>
				<input type="text" class="form-control" id="alc" placeholder="Enter a number whithout % (i.e 45.5)">
				<div id="result"></div>
				<br>
			</div>
			<div class="col-md-7">
						<label class="control-label" for="info">Info:</label>
						<textarea rows="10" class="form-control" id="info" placeholder="Enter info"></textarea>
						<br>
						<label class="control-label" id="imgurladdwhisky" for="imgurl">Image URL:</label>
						<input type="text" class="form-control" id="imgurl" value="http://www.">
			</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<input type="reset" class="formbutton" value="Clear">
					<button type="button" class="formbutton" id="submit">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="addwhisky.js"></script>
</body>
</html>