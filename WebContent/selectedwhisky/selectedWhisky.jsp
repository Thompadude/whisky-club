<!-- Handles presentation of selected whisky. -->
<%@page import="javax.websocket.MessageHandler.Whole"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="database.*"%>
<%
Whisky chosenWhisky = (Whisky) session.getAttribute("chosenWhisky");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title><%=chosenWhisky.getName()%></title>
</head>
<body>
<%@ include file="../menu/menu.jsp"%>
<%@ include file="../menu/topmenu.jsp"%>
<!-- Get selected whisky -->
<!-- Using a hidden input to get grade value. -->
<input type="hidden" id="grade" value="<%=chosenWhisky.getGrade()%>"></input>
<div class="content container-fluid">
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
				<a href="../FavoriteServlet?setWhiskyGrade=<%=i%>&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyFavorite=${chosenWhisky.isFavorite()}">
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
				<a href="../FavoriteServlet?setWhiskyFavorite=false&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyGrade=${chosenWhisky.getGrade()}">
				<img class="icon" alt="Favorites" title="Favorites"
					src="http://www.entypo.com/images/heart.svg"
					onmouseover="src='http://www.entypo.com/images/heart-outlined.svg'"
					onmouseout="src='http://www.entypo.com/images/heart.svg'">
					Remove favorite
				</a>
			</h3>
			<%}else{%>
			<br><br>
			<h3>
				<a href="../FavoriteServlet?setWhiskyFavorite=true&chosenWhiskyId=${chosenWhisky.getId()}&setWhiskyGrade=${chosenWhisky.getGrade()}">
				<img class="icon" alt="Favorites" title="Favorites"
					src="http://www.entypo.com/images/heart-outlined.svg"
					onmouseover="src='http://www.entypo.com/images/heart.svg'"
					onmouseout="src='http://www.entypo.com/images/heart-outlined.svg'">
					Add favorite
				</a>
				</h3>
			<%}%>
		</div>
		<div class="col-lg-4"></div>
	</div>			
	<div class="row">
		<div class="col-lg-12">
		<!-- Comment form -->
			<form method="post">
				<h4 id="formHeadline">Write a comment</h4>
				<label>
					<input class="formfield" type="text" name="name" placeholder="Name" id="formName">
				</label>
				<br>
				<label>
					<textarea class="formfield" rows="10" cols="21" name="comment" placeholder="Comment" id="formComment"></textarea>
				</label>
				<br>
				<input type="reset" class="formbutton" value="Clear">
				<button type="button" class="formbutton" id="submit">Submit</button>
				<span id="result"></span>
			</form>
		</div>
	</div>
		<div class="commentfield" id="commentDiv">
			<% for (int i = chosenWhisky.getComments().size()-1; i>= 0; i--) {%>
			<div class="row" id="fade<%=i%>">
				<div class="col-lg-11">
					<p>
						<%=chosenWhisky.getComments().get(i).getUserName()%>
						<br>
						<%=chosenWhisky.getComments().get(i).getDate()%>
					</p>
					<h4>
						<%=chosenWhisky.getComments().get(i).getComment()%>					
					</h4>
				</div>
				<div class="col-lg-1">
					<a class="deleteComment" id="<%=i%>" href="">
      				<img class="icon" alt="Delete entry"
       				src="http://www.entypo.com/images/circle-with-cross.svg"
        			onmouseover="src='http://www.entypo.com/images/circle-with-minus.svg'"
        			onmouseout="src='http://www.entypo.com/images/circle-with-cross.svg'">
       				</a>
				</div>
			</div>
			<% } %>
			<!-- Used in jQuery to keep count of number of comments. -->
			<input type=hidden id="commentsize" value="<%=chosenWhisky.getComments().size()%>"></input>
		</div>
</div>
</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/menu/menu.js"></script>
<script src="${pageContext.request.contextPath}/selectedwhisky/hoverstareffect.js"></script>
<script src="${pageContext.request.contextPath}/selectedwhisky/whiskycomment.js"></script>
</html>