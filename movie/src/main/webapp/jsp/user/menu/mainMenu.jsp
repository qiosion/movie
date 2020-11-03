<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/movie/css/mainMenu.css">
</head>
<body>
	<div align="center">
		<div>
			<nav id="topMenu">
				<ul>

					<li><a class="menuLink" href="${pageContext.request.contextPath}/movieList.do">영화</a></li>
					<li>|</li>

					<li><a class="menuLink" href="#">test</a></li>
					<li>|</li>
					<li><a class="menuLink" href="${pageContext.request.contextPath}/reservation/reservationForm.do ">예매하기</a></li>

					<li>|</li>
					<li><a class="menuLink" href="${pageContext.request.contextPath}/infoList.do">공지사항</a></li>


				</ul>
			</nav>
		</div>
	</div>
</body>
</html>