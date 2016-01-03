<!-- TODO add comments about what this jsp do -->
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
			<p>Region: ${chosenWhisky.getRegion()}</p>
			<p>Country: ${chosenWhisky.getCountry()}</p>
			<p>Type: ${chosenWhisky.getType()}</p>
			<p>Alcohol: ${chosenWhisky.getAlc()}</p>
			<p>Grade: ${chosenWhisky.getGrade()}</p>
		</div>
	<div class="log-lg-8"></div>
	</div>
	<form action="CommentServlet" method="post">
		<label><input class="formfield" type="text" name="userName" placeholder="Name"></label>
		<label><input class="formfield" type="text" name="comment" placeholder="Comment"></label>
		<input type="reset" class="formbutton">
		<input type="submit" class="formbutton" value="Submit">
		<input type="hidden" name="whiskyId" value="${chosenWhisky.getId()}">
	</form>
		<table class="table table-hover">
		<tr>
			<th>Comment</th>
			<th>Date</th>
			<th>User</th>
		</tr>
	          <%
	            ArrayList<String> whiskyComments = (ArrayList<String>) session.getAttribute("commentsKey");
	          	for (int i = whiskyComments.size()-1; i >= 0; i--) {
	          %>
	   		<tr>
	            <td><%=whiskyComments.get(i)%></td>
	            <td>Date</td>
	            <td>User Name</td>
			<tr>
	        </tr>
	          <%}%>
	    </table>
	<a href="${pageContext.request.contextPath}/list.jsp"><img class="icon" src="http://www.entypo.com/images/arrow-bold-left.svg"></a>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>