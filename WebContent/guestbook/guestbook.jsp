<%@page import="database.Data"%>
<%@page import="management.GuestbookEntries"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheetList.css">
<title>Guestbook</title>
</head>
<%@ include file="../menu/menu.jsp"%>
<%@ include file="../menu/topmenu.jsp"%>
<body>
<div class="content container-fluid" >
	<h1><img class="icon" src="http://www.entypo.com/images/open-book.svg">&nbsp;&nbsp;Guestbook</h1>
	<div class="row">
		<div class="col-lg-12">
		<!-- Comment form -->
			<form method="post">
				<label>
					<input class="formfield" type="text" name="guestbookName" placeholder="Name" id="guestbookName">
				</label>
				<br>
				<label>
					<textarea class="formfield" rows="10" cols="21" name="guestbookEntry" placeholder="Entry" id="guestbookEntry"></textarea>
				</label>
				<br>
				<input type="reset" class="formbutton" value="Clear">
				<button type="button" class="formbutton" id="submit">Submit</button>
			</form>
		</div>
	</div>
	<div id="reload">
		<% 
			String filePath = getServletContext().getRealPath("/guestbookData.dat");
			ArrayList<GuestbookEntries> entries = Data.getGuestbookDatabase().loadGuestbookEntries(filePath);
		%>
		<div class="container-fluid commentfield">
			<div>
				<%for (int i=entries.size()-1; i >= 0 ; i--) {%>
					<div class="row">
						<div class="col-lg-11">
							<p><%=entries.get(i).getName()%>
							<br>
							<%=entries.get(i).getDate()%></p>
							<h4><%=entries.get(i).getEntry()%></h4>
						</div>
						<div class="col-lg-1">
							<a href="#saknarlänkhäränsålänge">
							<img class="icon" alt="Delete entry"
								src="http://www.entypo.com/images/circle-with-cross.svg"
							 	onmouseover="src='http://www.entypo.com/images/circle-with-minus.svg'"
						 		onmouseout="src='http://www.entypo.com/images/circle-with-cross.svg'">
						 	</a>
						</div>
					</div>
				<% }%>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/menu/menu.js"></script>
<script src="${pageContext.request.contextPath}/guestbook/guestbook.js"></script>
</body>
</html>