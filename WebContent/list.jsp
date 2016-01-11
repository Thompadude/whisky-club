<!-- List all whiskies. -->
<%@page import="database.Data"%>
<%@page import="database.WhiskyDatabase"%>
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
	<title>Whiskey in the Jar</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<%
	String filePath = getServletContext().getRealPath("/whiskyData.dat");
	ArrayList<Whisky> allWhiskies = Data.getWhiskyHandler().getWhiskies(filePath);
%>
<div class="content container-fluid">
	<nav class="navbar navbar-inverse navbar-fixed-top">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span>Navigation</span>
      			</button>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
	        		<li>
	        			<a href="${pageContext.request.contextPath}/favorites.jsp">
	        			<img class="icon" alt="Favorites" title="Favorites"
	        			src="http://www.entypo.com/images/heart-outlined.svg"
	        			onmouseover="this.src='http://www.entypo.com/images/heart.svg'"
	        			onmouseout="this.src='http://www.entypo.com/images/heart-outlined.svg'">
	        			</a>
	        		</li>
					<li><a href="#abc">ABC</a></li>
					<li><a href="#def">DEF</a></li>
					<li><a href="#ghi">GHI</a></li>
					<li><a href="#jkl">JKL</a></li>
					<li><a href="#mno">MNO</a></li>
					<li><a href="#pqrs">PQRS</a></li>
					<li><a href="#tuvw">TUVW</a></li>
					<li><a href="#xyz">XYZ</a></li> 
      			</ul>
    		</div>
  		</div>
	</nav>
	<div class="listheader" id="abc"></div>
	<br>
	<h3 class="listheader">ABC</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'a') && (firstLetterInName <= 'c')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="def"></div>
	<br>
	<h3 class="listheader">DEF</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'd') && (firstLetterInName <= 'f')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="ghi"></div>
	<br>
	<h3 class="listheader">GHI</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'g') && (firstLetterInName <= 'i')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="jkl"></div>
	<br>
	<h3 class="listheader">JKL</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'j') && (firstLetterInName <= 'l')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="mno"></div>
	<br>
	<h3 class="listheader">MNO</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'm') && (firstLetterInName <= 'o')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="pqrs"></div>
	<br>
	<h3 class="listheader">PQRS</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'p') && (firstLetterInName <= 's')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="tuvw"></div>
	<br>
	<h3 class="listheader">TUVW</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 't') && (firstLetterInName <= 'w')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
	<div class="clear"></div>
	<div id="xyz"></div>
	<br>
	<h3 class="listheader">XYZ</h3>
	<ul class="listPictures">
		<%
			for (int i = 0; i < allWhiskies.size(); i++) {
				char firstLetterInName = allWhiskies.get(i).getId().charAt(0);
				if ((firstLetterInName >= 'x') && (firstLetterInName <= 'z')) {
		%>
				<li>
					<div class="whiskywrapper">
						<a href="ListServlet?whisky=<%=allWhiskies.get(i).getId()%>">
						<img class="img-responsive"
						src="<%=allWhiskies.get(i).getImgUrl()%>"
						alt="<%=allWhiskies.get(i).getName()%>">
						<p class="whiskytitle"><%=allWhiskies.get(i).getName()%></p>
						</a>
					</div>
				</li>
		<%
			}
			}
		%>
	</ul>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
<script src="smoothPage.js"></script>
</html>