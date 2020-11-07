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
th, td {
	text-align: center !important;
	vertical-align: middle !important;
}

.table>thead {
	background-color: #EDEBE1;
}

.table>thead>tr>td {
	text-align: center;
	font-color: #666666;
	font-size: large;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
}

.table>tbody>tr>td {
	border-bottom: 1px solid #ddd;
	font-family: monospace;
	text-align: center;
}

.table>tbody>tr>#td1 {
	text-align: left;
}

.table>tbody>tr>td>a:hover {
	text-decoration: underline;
}

#editBtn {
	background-color: #7A8DA0;
	padding: 5px;
	border-radius: 5px;
	color: white;
}
</style>
</head>
<body>
	<div class="tit-heading-wrap tit-evt">
		<h3>영화 리스트 관리</h3>
	</div>
	<div id="topMvMenu">
		<p style="margin-bottom: 20px;">
			<a href="mvRegistForm.do" class="registBtn">등록</a>
		</p>
		<mv:searchMv returnPage="mvList.do" />
	</div>
	<div id="mvList" align="center">
		<table border="1" class="table table-hover"
			style="margin-bottom: 20px;">
			<thead>
				<tr>
					<th width="50">번호</th>
					<th width="160">제목</th>
					<th width="180">포스터</th>
					<th>설명</th>
					<th width="100">개봉일</th>
					<th width="100">평균 평점</th>
					<th width="70"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="movie" items="${movies}">
					<tr>
						<td>${movie.mvNum }</td>
						<td>${movie.mvTitle }</td>
						<td><img id="mvPoster"
							src="${pageContext.request.contextPath}/images/${movie.mvPost}"></td>
						<td>${movie.mvCont }</td>
						<td>${movie.strdate }</td>
						<td>${movie.mvRank }</td>
						<td><button id="editBtn"
								onclick="location.href='mvUpdateForm.do?seq=${movie.mvNum}'">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
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