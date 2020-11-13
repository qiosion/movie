<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBOX</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/movie.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/member.css"
	rel="stylesheet">

<script>
	$(function(){
		$(".Rerv").on("click",function(){
			var mbr_id = '${mbr_id}';
			if(mbr_id == ''){
				event.preventDefault(); // 이벤트기능 default시킴
				alert("로그인 후 사용 가능합니다.");
				
			}
			
		});
	});
		
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="/header.jsp" />
		<c:if test="${mbr_author eq 'user' || empty mbr_author}">
			<jsp:include page="/jsp/user/menu/mainMenu.jsp" />
		</c:if>
		<c:if test="${mbr_author eq 'admin'}">
			<jsp:include page="/jsp/admin/menu/mainMenu.jsp" />
		</c:if>
		<decorator:head />
	</div>
	<hr>
	<div class="container">
		<decorator:body />
	</div>
	<hr>
	<div class="footer"><jsp:include page="/footer.jsp" /></div>
</body>
</html>