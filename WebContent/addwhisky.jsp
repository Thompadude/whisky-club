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
<%@ include file="topmenu.jsp"%>
<div class="content container-fluid">
	<h1><img class="icon" src="http://www.entypo.com/images/circle-with-plus.svg">&nbsp;&nbsp;Add Whisky</h1>
		<form class="form-horizontal" role="form" method="POST">
		<div class="row">
			<div class="col-md-5">
				<label class="control-label" for="name">Name:</label>
				<input type="text" class="form-control" id="name" placeholder="i.e Laphroaig 10 year">
				<label class="control-label" for="region">Region:</label>
				<input type="text" class="form-control" id="region" placeholder="i.e Islay">
				<label class="control-label" for="country">Country:</label>
				<input type="text" class="form-control" id="country" placeholder="i.e Scotland">
				<label class="control-label">Type: </label>
				<div class="radio">
				<label><input type="radio" name="type" id="singlemalt" value="Single Malt">&nbsp;Single Malt</label>
				</div>
				<div class="radio">
				<label><input type="radio" name="type" id="blended" value="Blended">&nbsp;Blended</label>
				</div>
				<label class="control-label" for="alc">Alcohol Volume:</label>
				<input type="text" class="form-control" id="alc" placeholder=" Without % (i.e 45.5)">
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
		<h2 id="result"></h2>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="addwhisky.js"></script>
</body>
</html>