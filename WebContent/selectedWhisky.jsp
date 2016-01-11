<!-- Handles presentation of selected whisky. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="menu/menu.js"></script>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<!-- Get selected whisky -->
<% Whisky chosenWhisky = (Whisky) session.getAttribute("chosenWhisky"); %>
<!-- Using a hidden input to get grade value. -->
<input type="hidden" id="grade" value="<%=chosenWhisky.getGrade()%>"></input>
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
	<div class="row">
		<div class="col-lg-4" id="selectedWhiskyPictureDiv">		
				<!-- Show whisky picture -->
				<img class="img-responsive" id="picMiddle" src="${chosenWhisky.getImgUrl()}">
		</div>
		<div class="col-lg-4">
			<div id="jumbotron">
				<!-- Get the whisky properties using Expression Language -->
				<h1 class="page-header">${chosenWhisky.getName()}</h1>
				<p>${chosenWhisky.getRegion()}, ${chosenWhisky.getCountry()}</p>
				<p>${chosenWhisky.getType()}</p>
				<p>${chosenWhisky.getAlc()}%</p>
				<p>${chosenWhisky.getInfo()}</p>
				<h1>Rating</h1>
				<!-- Show the grade stars -->
				<% for (int i = 1; i <= 5; i++) {%>
				<a href="FavoriteServlet?setWhiskyGrade=<%=i%>&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyFavorite=${chosenWhisky.isFavorite()}">
				<img class="icon" id="star<%=i%>" src="http://www.entypo.com/images/star-outlined.svg">
				</a>
				<%}%>
				&nbsp;&nbsp;(${chosenWhisky.getGrade()}/5)					
			</div>			
			<!-- Show the favorite button & text. Change icon/text whether it's a favorite or not. -->
			<%
			if(chosenWhisky.isFavorite()){
			%>
			<br><br>
			<h3>
				<a href="FavoriteServlet?setWhiskyFavorite=false&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyGrade=${chosenWhisky.getGrade()}">
				<img class="icon" alt="Favorites" title="Favorites"
					src="http://www.entypo.com/images/heart.svg"
					onmouseover="src='http://www.entypo.com/images/heart-outlined.svg'"
					onmouseout="src='http://www.entypo.com/images/heart.svg'">
					Remove from favorites
				</a>
			</h3>
			<%}else{%>
			<br><br>
			<h3>
				<a href="FavoriteServlet?setWhiskyFavorite=true&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyGrade=${chosenWhisky.getGrade()}">
				<img class="icon" alt="Favorites" title="Favorites"
					src="http://www.entypo.com/images/heart-outlined.svg"
					onmouseover="src='http://www.entypo.com/images/heart.svg'"
					onmouseout="src='http://www.entypo.com/images/heart-outlined.svg'">
					Add to favorites
				</a>
				</h3>
			<%}%>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<div class="row">
		<div class="col-lg-12">
		<!-- Comment form -->
			<form action="CommentServlet" method="post" name="validate">
				<h4>Write a comment</h4>
				<label>
					<input class="formfield" id="uName" type="text" name="userName" placeholder="Name">
				</label>
				<br>
				<label>
					<textarea class="formfield" rows="10" cols="21" name="comment" placeholder="Comment"></textarea>
				</label>
				<br>
				<input type="reset" class="formbutton" value="Clear">
				<input type="submit" class="formbutton" value="Submit">
				<!-- Using a hidden input to hide a value. -->
				<input type="hidden" name="whiskyId" value="${chosenWhisky.getId()}">
			</form>
		</div>
	</div>
	<div class="container-fluid commentfield">
		<%
		ArrayList<WhiskyComments> comments = (ArrayList<WhiskyComments>) session.getAttribute("commentObjects");
		for (int i = comments.size()-1; i >= 0; i--){
		%>
		<div class="row">
			<div class="col-lg-11">
				<p><%=comments.get(i).getUserName()%>
				<br>
				<%=comments.get(i).getDate()%></p>
				<h4><%=comments.get(i).getComment()%></h4>
			</div>
			<div class="col-lg-1">
				<a href="ListServlet?whisky=${chosenWhisky.getId()}&deleteWhiskyCommentItemNr=<%=(i)%>">
					<img class="icon" alt="Delete" src="http://www.entypo.com/images/circle-with-cross.svg">
				</a>
			</div>
		</div>		
		<%
		}
		%>
	</div>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="validateSelectedWhiskyForm.js"></script>
<script src="hoverstareffect.js"></script>
</body>
</html>