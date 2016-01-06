<!-- Handles presentation of selected whisky. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="menu/menu.js"></script>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<%@ include file="/background.jsp"%>
<div class="content">
	<%
	Whisky chosenWhisky = (Whisky) session.getAttribute("chosenWhisky");
	if(chosenWhisky.isFavorite()){%>
	<a href="FavoriteServlet?setWhiskyFavorite=false&chosenWhiskyId=${chosenWhisky.getId()}">
		<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star.svg">
		Remove from favorites
	</a>
	<%}else{%>
	<a href="FavoriteServlet?setWhiskyFavorite=true&chosenWhiskyId=${chosenWhisky.getId()}">
		<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star-outlined.svg">
		Add to favorites
	</a>
	<%}%>
	<div class="row">
		<div class="col-lg-1">
			<a href="images/${chosenWhisky.getImgUrl()}">
			<img class="img-thumbnail" src="images/${chosenWhisky.getImgUrl()}" width="100" height="100">
			</a>
		</div>
	<div class="col-lg-8">
		<p>${chosenWhisky.getInfo()}</p>
	</div>
	<div class="col-lg-3"></div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<!-- Get the whisky properties using Expression Language -->
			<p>Region: ${chosenWhisky.getRegion()}</p>
			<p>Country: ${chosenWhisky.getCountry()}</p>
			<p>Type: ${chosenWhisky.getType()}</p>
			<p>Alcohol: ${chosenWhisky.getAlc()}</p>
			<p>Grade: ${chosenWhisky.getGrade()}</p>
		</div>
	<div class="log-lg-8"></div>
	</div>
	<form action="CommentServlet" method="post" name="validate">
		<label><input class="formfield" id="uName" type="text" name="userName" placeholder="Name"></label>
		<br>
		<label><textarea class="formfield" rows="3" cols="50" name="comment" placeholder="Comment"></textarea></label>
		<br>
		<input type="reset" class="formbutton">
		<input type="submit" class="formbutton" value="Submit">
		<!-- Using a hidden input to hide a value. -->
		<input type="hidden" name="whiskyId" value="${chosenWhisky.getId()}">
	</form>
	<table class="table table-hover" id="tableSelectedWhisky">
		<tr>
			<th>Date</th>
			<th>Comment</th>
			<th>User</th>
			<th>Delete</th>
		</tr>
		<!-- Mixing java code with html to print a whiskies comments. -->
			<%
			ArrayList<WhiskyComments> whiskyComments = (ArrayList<WhiskyComments>) session.getAttribute("commentObjects");
			for (int i = whiskyComments.size()-1; i >= 0; i--) {
			%>
	   	<tr>
			<td width="20%"><%=whiskyComments.get(i).getDate()%>&nbsp;&nbsp;&nbsp;&nbsp;-</td>
			<td width="60%"><%=whiskyComments.get(i).getComment()%></td>
			<td width="20%"><%=whiskyComments.get(i).getUserName()%></td>
			<td><a href="ListServlet?whisky=${chosenWhisky.getId()}&deleteWhiskyCommentItemNr=<%=(i)%>">
			<img class="icon" alt="Delete" src="http://www.entypo.com/images/circle-with-cross.svg"></a></td>
		<tr>
		</tr>
		<%}%>
	</table>
	<a href="${pageContext.request.contextPath}/list.jsp"><img class="icon" src="http://www.entypo.com/images/arrow-bold-left.svg"></a>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="validateSelectedWhiskyForm.js"></script>
</body>
</html>