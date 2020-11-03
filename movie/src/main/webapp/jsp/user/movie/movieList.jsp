<%@page import="com.cbox.movie.vo.MovieSearchVO"%>
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
</head>
<body>
	<script>
		$().ready(function() {
			$('.toggleBG').click(function() {
				var toggleBG = $(this);
				var toggleFG = $(this).find('.toggleFG');
				var left = toggleFG.css('left');
				if (left == '15px') {
					toggleBG.css('background', '#CCCCCC');
					type = toggleActionStart(toggleFG, 'TO_LEFT');
				} else if (left == '0px') {
					toggleBG.css('background', '#ABD0BC');
					type = toggleActionStart(toggleFG, 'TO_RIGHT');
				}
			});
		});

		// 토글 버튼 이동 모션 함수
		function toggleActionStart(toggleBtn, LR) {
			// 0.01초 단위로 실행
			var intervalID = setInterval(function() {
				// 버튼 이동
				var left = parseInt(toggleBtn.css('left'));
				left += (LR == 'TO_RIGHT') ? 5 : -5;
				if (left >= 0 && left <= 15) {
					left += 'px';
					toggleBtn.css('left', left);
				}
			}, 10);
			setTimeout(function() {
				clearInterval(intervalID);
			}, 201);
			const left_px = parseInt(toggleBtn.css('left'));
			return (left_px > 0) ? "전체" : "상영작";
		}
	</script>

	<div class="movietop">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1"><a
				href="movieList.do">박스 오피스</a></li>
			<li class="tab-link" data-tab="tab-2"><a
				href="movieExpectList.do">상영 예정작</a></li>
			<li class="tab-link" data-tab="tab-3"><a
				href="movieChartList.do">일별 박스오피스</a></li>
		</ul>
	</div>
	<div id="tab-1" class="tab-content current">
		<div align="right">
			<mv:searchMv returnPage="movieList.do" />
		</div>

		<div class="sort">
			<span>전체</span>
			<div class="toggleBG">
				<button type="button" class="toggleFG"></button>
			</div>
			<span>개봉작만</span>
		</div>
		<br>
		<ol>
			<c:forEach var="movie" items="${movies}">
				<c:choose>
					<c:when test="type eq '상영작'">
						<script>
							console.log("상영작");
						</script>
						<!-- todo 상영종료일이랑 오늘날짜 비교해서.. 해당하는거만 출력되도록 -->
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<li>
					<div>
						<a href="movieDetail.do?seq=${movie.mvNum }"> <img
							id="moviePoster"
							src="${pageContext.request.contextPath}/images/${movie.mvPost}"></a>
					</div>
					<div>
						<p>${movie.mvTitle }</p>
					</div>
					<div>
						<span>평점 : ${movie.mvRank }</span> | <span>개봉일 :
							${movie.strdate }</span>
						<p>${movie.mvCont }</p>
					</div>
					<div>
						<a href="#" class="ticketBtn">예매</a>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
</body>
</html>