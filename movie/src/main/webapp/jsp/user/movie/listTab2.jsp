<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cbox.movie.dao.MovieDAO"%>
<%@page import="com.cbox.movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="mv" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#topBtn {
	posotion: fixed;
	float: right;
	bottom: 50px;
	display: none;
	z-index: 999;
	height: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$("#topBtn").fadeIn();
			} else {
				$("#topBtn").fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
</head>
<body>
	<div class="movietop">
		<ul class="tabs">
			<li class="tab-link" data-tab="tab-1"><a href="movieList.do">전체
					영화</a></li>
			<li class="tab-link current" data-tab="tab-2"><a
				href="movieExpectList.do">상영 예정작</a></li>
			<li class="tab-link" data-tab="tab-3"><a
				href="movieChartList.do">일별 박스오피스</a></li>
		</ul>
	</div>
	<div id="tab-2" class="tab-content current">
		<div class="tit-heading-wrap tit-evt" id="title">
			<h3>상영 예정작</h3>
		</div>
		<div align="right">
			<mv:searchMv returnPage="movieExpectList.do" />
		</div>
		<ol>
			<c:forEach var="movie" items="${exMovies}">
				<li>
					<div style="margin-bottom: 5px;">
						<a href="movieDetail.do?seq=${movie.mvNum }"> <img
							id="moviePoster"
							src="${pageContext.request.contextPath}/images/${movie.mvPost}"></a>
					</div>
					<div style="margin-bottom: 5px;">
						<p>${movie.mvTitle }</p>
					</div>
					<div style="margin-bottom: 20px; min-height: 20px;">
						<span>개봉일 : ${movie.strdate }</span>
						<p>${movie.mvCont }</p>
					</div>
					<div>
						<a href="#" class="ticketBtn">예매</a>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	<img alt="TOP" id="topBtn"
		src="${pageContext.request.contextPath}/images/top.png">
</body>
</html>