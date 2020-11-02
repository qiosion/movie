<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cbox.movie.dao.MovieDAO"%>
<%@page import="com.cbox.movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	MovieVO vo = new MovieVO();
MovieDAO dao = new MovieDAO();

vo.setSearchType(request.getParameter("searchType")); // request.getParameter("searchType") : mvTitle로 고정
vo.setSearchKeyword(request.getParameter("keyword"));

List<MovieVO> list = new ArrayList<MovieVO>();
list = dao.selectAll(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script>
		function formCheck() {
			var frm = document.search;
			if (frm.keyword.value == "") {
				alert("검색어를 입력해주세요.");
				return;
			}
			/* form.submit(); */
		}
	</script>

	<div class="movietop">
		<ul class="tabs">
			<li class="tab-link" data-tab="tab-1"><a href="movieList.do">박스
					오피스</a></li>
			<li class="tab-link current" data-tab="tab-2"><a
				href="movieExpectList.do">상영 예정작</a></li>
			<li class="tab-link" data-tab="tab-3"><a
				href="movieChartList.do">일별 박스오피스</a></li>
		</ul>
	</div>
	<div id="tab-2" class="tab-content current">
		<form name="search" id="search" method="get"
			action="movieExpectList.do">
			<select id="searchType" name="searchType">
				<option value="title">제목</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="영화 제목">
			<button type="submit" onclick="return formCheck()">검색</button>
		</form>
		<ol>
			<c:forEach var="movie" items="${exMovies}">
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
</body>
</html>