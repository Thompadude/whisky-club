<!-- List all whiskies. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<%@ page import="java.util.ArrayList"%>
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
			<li><a href="${pageContext.request.contextPath}/favorites.jsp"><img
					class="icon" alt="Favorites" title="Favorites"
					src="http://www.entypo.com/images/star-outlined.svg"></a></li>
			<li><a href="#abc">ABC</a></li>
			<li><a href="#def">DEF</a></li>
			<li><a href="#ghi">GHI</a></li>
			<li><a href="#jkl">JKL</a></li>
			<li><a href="#mno">MNO</a></li>
			<li><a href="#pqrs">PQRS</a></li>
			<li><a href="#tuvw">TUVW</a></li>
			<li><a href="#xyz">XYZ</a></li>
		</ul>
		<h3 id="abc">ABC</h3>
		<ul class="listPictures">
			<%
				ArrayList<Whisky> allWhiskies = (ArrayList<Whisky>) session.getAttribute("allWhiskies");
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'a') && (firstLetterInName <= 'c')) {
			%>
			<li>
			<div class="whiskywrapper">
			<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<h2 class="whiskytitle"><%=allWhiskies.get(i).getName()%></h2>
				</div>
				</li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="def">DEF</h3>
		<ul class="listPictures">
			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'd') && (firstLetterInName <= 'f')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="ghi">GHI</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'g') && (firstLetterInName <= 'i')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="jkl">JKL</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'j') && (firstLetterInName <= 'l')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="mno">MNO</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'm') && (firstLetterInName <= 'o')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="pqrs">PQRS</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'p') && (firstLetterInName <= 's')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="tuvw">TUVW</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 't') && (firstLetterInName <= 'w')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
		<div class="clear"></div>
		<h3 id="def">XYZ</h3>
		<ul class="listPictures">

			<%
				for (int i = 0; i < allWhiskies.size(); i++) {
					char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
					if ((firstLetterInName >= 'x') && (firstLetterInName <= 'z')) {
			%>
			<li><a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>"><img
					class="img-responsive"
					src="${pageContext.request.contextPath}/images/<%=allWhiskies.get(i).getImgUrl()%>"
					alt="<%=allWhiskies.get(i).getName()%>"> </a>
				<p><%=allWhiskies.get(i).getName()%></p></li>
			<%
				}
				}
			%>
		</ul>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="smoothPage.js"></script>
</html>