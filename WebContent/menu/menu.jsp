<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Menu</title>
</head>
<body>
	<div id="menu">
		<div id="iconCloseMenu">
			<img class="icon" src="http://www.entypo.com/images/cross.svg" alt="cross">
		</div>
			<div class="btn-group-vertical menubtn">
				<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-default menubtn menulink">
					 <img class="menuSmallIcon" src="http://www.entypo.com/images/home.svg">&nbsp;&nbsp;Home
				</a>
				<a href="${pageContext.request.contextPath}/list.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/list.svg">&nbsp;&nbsp;Whiskies</a>
				<a href="${pageContext.request.contextPath}/favorites.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/heart.svg">&nbsp;&nbsp;Favorites</a>
				<a href="${pageContext.request.contextPath}/guestbookform.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/open-book.svg">&nbsp;&nbsp;Guestbook</a>
				<a href="${pageContext.request.contextPath}/whiskymanager.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/cog.svg">&nbsp;&nbsp;Settings</a>
				<a href="${pageContext.request.contextPath}/about.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/info-with-circle.svg">&nbsp;&nbsp;About</a>
				<a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-default menubtn menulink">
					<img class="menuSmallIcon" src="http://www.entypo.com/images/log-out.svg">&nbsp;&nbsp;Log out</a>
			</div>
	</div>
	<div id="iconOpenMenu">
		<img class="icon" src="http://www.entypo.com/images/menu.svg" alt="menu" style="background-color: black">
	</div>
	<div class="overlay"></div>
</body>
</html>