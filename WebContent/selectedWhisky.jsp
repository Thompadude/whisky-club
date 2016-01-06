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
<%@ include file="/background.jsp"%>

<!-- Get selected whisky -->
<% Whisky chosenWhisky = (Whisky) session.getAttribute("chosenWhisky"); %>

<!-- Using a hidden input to get grade value. -->
<input type="hidden" id="grade" value="<%=chosenWhisky.getGrade()%>"></input>



<div class="content">

	<div class="row" id="selectedWhiskyMainRow">
<!-- LEFT WINDOW -->	
		<div class="col-lg-4 textAlignCenter">
			
			<!-- Go back to list.jsp. Left-arrow icon -->
			<div class="textAlignLeft">
				<a href="${pageContext.request.contextPath}/list.jsp">
				<img class="icon" src="http://www.entypo.com/images/arrow-bold-left.svg"></a>
			</div>
			
			<div>
				<!-- Get the whisky properties using Expression Language -->
				<h1 class="selectedWhiskyH1">${chosenWhisky.getName()}</h1>
				<p>${chosenWhisky.getRegion()}, ${chosenWhisky.getCountry()}</p>
				<p>${chosenWhisky.getType()}</p>
				<p>${chosenWhisky.getAlc()}%</p>
				<p>${chosenWhisky.getInfo()}</p>
			</div>
		</div>
		
<!-- END LEFT WINDOW -->

<!-- MIDDLE WINDOW -->
		<div class="col-lg-4" id="selectedWhiskyMiddleDiv">
				
				<!-- Show whisky picture -->
				<a href="images/${chosenWhisky.getImgUrl()}">
					<img class="img-responsive" id="picMiddle" src="images/${chosenWhisky.getImgUrl()}"></a>
		</div>
<!-- END MIDDLE WINDOW -->
	
<!-- RIGHT WINDOW -->		
		<div class="col-lg-4" id="selectedWhiskyRightDiv">
		
			<div class="row">
				
				<div class="col-lg-6">
					<h4>Rate this whisky</h4>
					<div>
						<!-- Show the grade stars -->
						<% for (int i = 1; i <= 5; i++) {%>
						<a href="FavoriteServlet?setWhiskyGrade=<%=i%>&chosenWhiskyId=${chosenWhisky.getId()}
								&setWhiskyFavorite=${chosenWhisky.isFavorite()}">
								<img class="icon" id="star<%=i%>" src="http://www.entypo.com/images/star-outlined.svg"></a>
						<%}%>&nbsp;&nbsp;(${chosenWhisky.getGrade()}/5)					
					</div>
				</div>
				<div class="col-lg-6 textAlignRight">
					<!-- Show the favorite button & text. Change icon/text whether it's a favorite or not. -->
					<%if(chosenWhisky.isFavorite()){%>
						<a href="FavoriteServlet?setWhiskyFavorite=false&chosenWhiskyId=${chosenWhisky.getId()}
								&setWhiskyGrade=${chosenWhisky.getGrade()}">
								Remove from favorites
								<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star.svg">
						</a>
					<%}else{%>
						<a href="FavoriteServlet?setWhiskyFavorite=true&chosenWhiskyId=${chosenWhisky.getId()}
								&setWhiskyGrade=${chosenWhisky.getGrade()}">
								Add to favorites
								<img class="icon" alt="Favorites" title="Favorites" src="http://www.entypo.com/images/star-outlined.svg">
						</a>
					<%}%>
				</div>
			</div>
			
			
			<br><br><br><br><br><br><br><br><br><br><br><br>
			
			
			<h4 class="textAlignCenter">Write a comment</h4>
			<!-- Comment form -->
			<form action="CommentServlet" method="post" name="validate">
				<label><input class="formfield" id="uName" type="text" name="userName" placeholder="Name"></label>
				<br>
				<label><textarea class="formfield" rows="10" cols="21" name="comment" placeholder="Comment"></textarea></label>
				<br>
				<input type="reset" class="formbutton" value="Clear">
				<input type="submit" class="formbutton" value="Submit">
				<!-- Using a hidden input to hide a value. -->
				<input type="hidden" name="whiskyId" value="${chosenWhisky.getId()}">
			</form>

		</div>
<!-- END RIGHT WINDOW -->

	</div>
	
	<div class="textAlignCenter">
	<table class="table table-hover" id="selectedWhiskyTable">
		<tr>
			<th>Date</th>
			<th>Comment</th>
			<th>Name</th>
			<th>Delete</th>
		</tr>
			<!-- Mixing java code with html to print whiskies comments. -->
			<%
			ArrayList<WhiskyComments> whiskyComments = (ArrayList<WhiskyComments>) session.getAttribute("commentObjects");
			for (int i = whiskyComments.size()-1; i >= 0; i--) {
			%>
	   	<tr>
			<td width="20%"><%=whiskyComments.get(i).getDate()%><span id="lineTable">&nbsp;&nbsp;&nbsp;&nbsp;-</span></td>
			<td width="60%"><%=whiskyComments.get(i).getComment()%></td>
			<td width="20%"><%=whiskyComments.get(i).getUserName()%></td>
			<td><a href="ListServlet?whisky=${chosenWhisky.getId()}&deleteWhiskyCommentItemNr=<%=(i)%>">
				<img class="icon" alt="Delete" src="http://www.entypo.com/images/circle-with-cross.svg"></a></td>
		</tr>
		<%}%>
	</table>
	</div>
		
</div>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="validateSelectedWhiskyForm.js"></script>
<script src="hoverstareffect.js"></script>

</body>
</html>