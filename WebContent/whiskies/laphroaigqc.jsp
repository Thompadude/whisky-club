<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="whiskies.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../stylesheet.css">
<title>Laphroaig Quarter Cask</title>
</head>
<body>
<%@ include file="/menu.jsp"%>
<%@ include file="/background.jsp"%>
<% LaphroaigQuarterCask quarterCask = new LaphroaigQuarterCask(); %>

<div class="row aboutwhiskycontent">
	<div class="col-lg-1">
		<a href="<%=quarterCask.getImgUrl()%>">
		<img class="img-thumbnail" src="<%=quarterCask.getImgUrl()%>" alt="Laphroaig Quarter Cask" width="100" height="100">
		</a>
	</div>
<div class="col-lg-8">
	<p><%=quarterCask.getInfo()%></p>
</div>
<div class="col-lg-3">
</div>
</div>
	<div class="row aboutwhiskycontent">
		<div class="col-lg-4">
			<p>Region: <%=quarterCask.getRegion()%></p>
			<p>Country: <%=quarterCask.getCountry() %></p>
			<p>Type: <%=quarterCask.getType()%></p>
			<p>Alcohol: <%=quarterCask.getAlc()%>%</p>
		</div>
		<div class="log-lg-8">
		</div>
	</div>
<div class="row aboutwhiskycontent">
	<div class="col-lg-12">
		<%@include file="../comments.jsp" %>
	</div>
</div>		
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../menu.js"></script>
</body>
</html>