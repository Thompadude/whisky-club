<!-- List all whiskies. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Whiskey in the Jar</title>
</head>
<body>
	<span id="top"></span>
	<%@ include file="menu/menu.jsp"%>
	<%@ include file="background.jsp"%>
	<div class="content">
		<a href="#top" id="backToTheTop"><span
			class="glyphicon glyphicon-triangle-top"></span></a>
		<ul class="nav nav-tabs">
			<li><a href="#abc">ABC</a></li>
			<li><a href="#def">DEF</a></li>
			<li><a href="#ghi">GHI</a></li>
			<li><a href="#jkl">JKL</a></li>
			<li><a href="#mno">MNO</a></li>
			<li><a href="#pqrs">PQRS</a></li>
			<li><a href="#tuvw">TUVW</a></li>
			<li><a href="#xyz">XYZ<span>&#35;</span></a></li>
		</ul>
		<h3 id="abc">ABC</h3>
		<ul class="listPictures">
			<li>
				<!-- Check if whisky aberlour exist in ListServlet --> <a
				href="ListServlet?whisky=aberlour"> <img class="img-responsive"
					src="${pageContext.request.contextPath}/images/aberlour.jpg"
					alt="Aberlour">
			</a>
				<p>Aberlour 10 year</p>
			</li>
		</ul>
		<div class="clear"></div>
		<h3 id="def">DEF</h3>
		<ul class="listPictures">
			<li><a href="ListServlet?whisky=dalwhinnie"> <img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/dalwhinnie.jpg"
					alt="Dalwhinnie">
			</a>
				<p>Dalwhinnie 15 year</p></li>
		</ul>
		<div class="clear"></div>
		<h3 id="ghi">GHI</h3>
		<ul class="listPictures">
			<li><a href="ListServlet?whisky=glennfiddich"> <img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/glennfiddich.jpg"
					alt="Glennfiddich">
			</a>
				<p>Glennfiddich 14 year</p></li>
		</ul>
		<div class="clear"></div>
		<h3 id="jkl">JKL</h3>
		<ul class="listPictures">
			<li><a href="ListServlet?whisky=laphroaig"> <img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/laphroaigquartercask.jpg"
					alt="Talisker">
			</a>
				<p>Laphroaig</p></li>
		</ul>
		<div class="clear"></div>
		<h3 id="mno">MNO</h3>
		<ul class="listPictures">
			<li><a href="ListServlet?whisky=oban"> <img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/oban.jpg" alt="Oban">
			</a>
				<p>Oban 14 year</p></li>
		</ul>
		<div class="clear"></div>
		<h3 id="pqrs">PQRS</h3>
		<ul class="listPictures">
			<li><a href=""> <img class="img-responsive"
					src="${pageContext.request.contextPath}/images/imageComingSoon.jpg"
					alt="Coming Soon"></a>
				<p>Coming Soon</p></li>
		</ul>
		<div class="clear"></div>
		<h3 id="tuvw">TUVW</h3>
		<ul class="listPictures">
			<li>
				<!-- TODO add comment what this do --> <a
				href="ListServlet?whisky=talisker"> <img class="img-responsive"
					src="${pageContext.request.contextPath}/images/talisker.jpg"
					alt="Talisker">
			</a>
				<p>Talisker</p>
			</li>
		</ul>
		<div class="clear"></div>
		<h3 id="xyz">
			XYZ<span>&#35;</span>
		</h3>
		<ul class="listPictures">
			<li><a href=""> <img class="img-responsive"
					src="${pageContext.request.contextPath}/images/imageComingSoon.jpg"
					alt="Coming Soon"></a>
				<p>Coming Soon</p></li>
		</ul>
		<div class="clear"></div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="smoothPage.js"></script>
</html>