<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mv"%>

<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.pagination li {
	display: inline-block; /* li태그가 가로로 오도록 */
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
}
</style>
</head>
<body>
	<h2>영화 리스트 관리</h2>
	<div id="topMvMenu">
		<a href="mvRegistForm.do" class="registBtn">등록</a>
		<mv:searchMv returnPage="mvList.do" />
	</div>
	<div id="mvList" align="center">
		<table border="1">
			<tr>
				<th width="50">번호</th>
				<th width="150">제목</th>
				<th width="180">포스터</th>
				<th>설명</th>
				<th width="100">개봉일</th>
				<th width="100">평균 평점</th>
				<th width="70">수정</th>
			</tr>
			<c:forEach var="movie" items="${movies}">
				<tr>
					<td>${movie.mvNum }</td>
					<td>${movie.mvTitle }</td>
					<td><img id="mvPoster"
						src="${pageContext.request.contextPath}/images/${movie.mvPost}"></td>
					<td>${movie.mvCont }</td>
					<td>${movie.strdate }</td>
					<td>${movie.mvRank }</td>
					<td><a href="mvUpdateForm.do?seq=${movie.mvNum }">&#x2705;</a></td>
				</tr>
			</c:forEach>
		</table>
		<script type="text/javascript">
			function goPage(p) {
				location.href = "mvList.do?p=" + p;
				//searchFrm.p.value = p; // 폼에 페이지 번호 넘긴다.
				//	searchFrm.submit(); // 폼 전송
			}
		</script>
		<mv:paging paging="${paging}" jsfunc="goPage" />
	</div>
</body>
</html>