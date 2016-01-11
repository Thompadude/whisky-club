<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Add New Whisky</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<div class="content">
	<div class="container-fluid">
		<form class="form-horizontal" role="form" method="POST">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Name: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name" placeholder="Enter whisky name">
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="region">Region: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="region" placeholder="Enter region of origin">
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="country">Country: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="country" placeholder="Enter country of origin">
				</div>
			</div>			
			<div class="form-group">
			<label class="control-label col-sm-2">Type: </label>
				<div class="radio col-sm-10">
					<label><input type="radio" name="type" id="singlemalt" value="Single Malt">Single Malt</label>
					<label><input type="radio" name="type" id="blended" value="Blended">Blended</label>
				</div>
			</div>			
			<div class="form-group">
			<label class="control-label col-sm-2" for="info">Information: </label>
				<div class="col-sm-10">
					<textarea rows="5" class="form-control" id="info" placeholder="Enter info"></textarea>
				</div>
			</div>			
			<div class="form-group">
			<label class="control-label col-sm-2" for="imgurl">URL to image: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="imgurl" value="http://www.">
				</div>
			</div>			
			<div class="form-group">
			<label class="control-label col-sm-2" for="alc">Alcohol Volume: </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="alc" placeholder="Enter alcoholic volume in numbers without % (i.e. 45.5)">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<button type="reset" class="btn btn-default">Reset</button>
					<button type="submit" class="btn btn-default">Submit</button>
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