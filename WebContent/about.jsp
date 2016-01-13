<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="management.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/stylesheet.css">
<title>Whiskey in the Jar</title>
</head>
<body>
<%@ include file="menu/menu.jsp"%>
<%@ include file="menu/topmenu.jsp"%>
<div class="content">
	<br>
	<h2>
	This web page is part of a school project.<br>
	Made by <a href="mailto:patrik_andersson1985@hotmail.com">Patrik Andersson</a>
	and <a href="mailto:thompa.lansing@gmail.com">Thomas Lansing</a>.
	</h2>
	<h3>Hemsidans syfte</h3>
	<p>
		Syftet med sidan är att ha ett "hem" för sina egna whiskies där man kan spara betyg, favoriter och noteringar.
		Vi har jobbat utefter att det är en admin som loggar in på sidan, men grundtanken är att sidan ska vara
		ett forum för en grupp whiskyälskande personer - en form av community.
	</p>
	<h3>Funktioner</h3>
	<p>
		Hemsidan har en gästbok där man kan skriva ett inlägg. (Som admin kan man även radera inlägg.)<br>
		Det finns en lista över samtliga inlagda whiskies. Man kan klicka sig vidare in på en whisky och
		där kommentera den, sätta betyg samt lägga till den som favorit
		(man kommer senare åt dem på en separat favoritlista). Man kan självklart läsa på lite om whiskyn,
		till exempel vart den kommer ifrån eller hur stark den är.<br>
		Som admin kan man lägga till nya whiskies via ett forumlär och man har även möjlighet
		att återställa whiskies (så bara de hårdkodade finns kvar) samt radera alla gästboksinlägg.
		
	</p>
	<h3>Arbetsmetoder</h3>
	<p>
		Innan vi började arbetet med vårt projekt skrev vi ned vad vi skulle diskutera och ta beslut om,
		vilka funktioner som absolut skulle finnas med och vilka som var lite mindre viktiga. Vi satte
		upp mål och delmål. Större delen av tiden har vi parkodat med även kodat indivuellt vid vissa tillfällen.<br>		
		Under projektets gång har vi börjat med vissa metoder och senare använt oss av andra, vilket
		resulterade i att vi har löst samma problem på olika sätt. Vi har inte vara konsekventa men anser
		att det har varit OK då vi har lärt oss mycket av det.<br>
		Förutom de tekniker vi lärt oss på lektionerna har vi undersökt vissa själva. Ett exemepl är AJAX
		som uppdaterar delar av en sida utan att uppdatera hela sidan vilket var snyggt när man
		till exempel skriver ett gästboksinlägg.<br>
		Vi har valt att spara data i en fil som gör att man får känslan av att alla ändringar som görs
		sparas på en server.<br>
		Som loggbok har vi använt <a href="http://www.toggl.com" target="_blank">Toggl</a>.
		För versionhantering har vi använt git och laddat upp vårt projekt till
		<a href="http://www.gitlab.com" target="_blank">GitLab</a>.<br>
		Som slutsats är vi mycket nöjda med resultatet och hur vi satt mål, och nått dem i tid.
	</p>
	<h3>Vad vi tar med oss</h3>
	<p>
		I framtiden kommer AJAX vara central i webprojekt. Vi var både imponerade över hur det
		fungerar och hur det uppdaterar sidor dynamiskt.<br>
		Vi har fått fördjupad förståelse i hur kommunikationen mellan en klient och en servlet fungerar
		och hur man skickar information	där i mellan.
	</p>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="menu/menu.js"></script>
</body>
</html>