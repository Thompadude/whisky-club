<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="main.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="menu.js"></script>
<title>Whiskey in the Jar</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<%@ include file="background.jsp"%>
	<div class="content">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#all">ALL</a></li>
		  <li><a href="#abc">ABC</a></li>
		  <li><a href="#def">DEF</a></li>
		  <li><a href="#ghi">GHI</a></li>
		  <li><a href="#jkl">JKL</a></li>
		  <li><a href="#mno">MNO</a></li>
		  <li><a href="#pqrs">PQRS</a></li>
		  <li><a href="#tuvw">TUVW</a></li>
		  <li><a href="#xyz">XYZ#</a></li>
		</ul>
		<h2 id="all">Whisky</h2>
		<h3 id="abc">ABC</h3>
		<p>En massa test text</p>
		<h3 id="def">DEF</h3>
		<p>En massa test text</p>
		<h3 id="ghi">GHI</h3>
		<p>En massa test text</p>
		<h3 id="jkl">JKL</h3>
		<p>En massa test text</p>
		<h3 id="mno">MNO</h3>
		<p>En massa test text</p>
		<h3 id="pqrs">PQRS</h3>
		<p>En massa test text</p>
		<h3 id="tuvw">TUVW</h3>
		<p>En massa test text</p>
		<h3 id="xyz">XYZ</h3>
		<p>En massa test text</p>
	</div>
</body>
</html>