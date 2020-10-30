<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link href="css/style.css" rel="stylesheet">
<link href="css/movie.css" rel="stylesheet">
</head>
<body>
	<header>
		header
		<jsp:include page="/header.jsp" />
	</header>
	<hr>
	<div class="content">
		<decorator:body />
	</div><hr>
	<footer>footer</footer>
</body>
</html>