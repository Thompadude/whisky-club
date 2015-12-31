<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link rel="stylesheet" type="text/css" href="stylesheetList.css">
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="menu.js"></script>
</head>
<body>
<%@ include file="/menu.jsp"%>
<%@ include file="/background.jsp"%>
<div class="content">
	<div class="row aboutwhiskycontent">
		<div class="col-lg-1">
			<a href="images/${chosenWhisky.getImgUrl()}">
			<img class="img-thumbnail" src="images/${chosenWhisky.getImgUrl()}" width="100" height="100">
			</a>
		</div>
	<div class="col-lg-8">
		<p>${chosenWhisky.getInfo()}</p>
	</div>
	<div class="col-lg-3">
	</div>
	</div>
		<div class="row aboutwhiskycontent">
			<div class="col-lg-4">
				<p>Region: ${chosenWhisky.getRegion()}</p>
				<p>Country: ${chosenWhisky.getCountry()}</p>
				<p>Type: ${chosenWhisky.getType()}</p>
				<p>Alcohol: ${chosenWhisky.getAlc()}</p>
				<p>Grade: ${chosenWhisky.getGrade()}</p>
			</div>
			<div class="log-lg-8">
			</div>
		</div>
	<div class="row aboutwhiskycontent">
		<div class="col-lg-12">
			<%@include file="../comments.jsp" %>
		</div>
	</div>		
</div>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../menu.js"></script>
</body>
</html>