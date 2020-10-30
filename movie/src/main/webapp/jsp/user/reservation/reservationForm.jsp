<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>

<style>
	.container{
		display:flex;
		width:800px;
		margin: 0 auto;
		margin-top: 60px;
	}
	.movie-item{
		border: 1px solid black;
		height:400px;
		width:300px;
	}
	.date-item{
		border: 1px solid black;
		height:400px;
		width:300px;
	}
	.time-item{
		border: 1px solid black;
		height:400px;
		width:300px;
	}
	
	</style>
</head>
<body>
	<div class="container">
		<div class="movie">
			<div class="movie-title">영화</div>
			<div class="movie-item">영화리스트
				<ul>
					<c:forEach var="movie" items="${movies }">
						<li>${movie.mvTitle }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="date">
			<div class="date-title">날짜</div>
			<div class="date-item">날짜 리스트</div>
			
		</div>
		<div class="time">
			<div class="time-title">시간</div>
			<div class="time-item">시간 리스트</div>
			
		</div>
	</div>
</body>
</html>