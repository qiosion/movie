<%@page import="com.cbox.movie.dao.MovieDAO"%>
<%@page import="com.cbox.movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type='text'], input[type='password'] {
	height: calc(1.5em + .75rem + 2px) !important;
	width: 100% !important;
}

#frm img {
	display: block;
	margin: 0px auto;
}

#topBtn {
	posotion: fixed;
	float: right;
	bottom: 50px;
	display: none;
	z-index: 999;
	height: 40px;
}

#status {
	padding: 0 10px;
	border-radius: 10px;
	color: red;
	margin-left: 5px;
	border: 2px solid black;
	font-weight: bold;
}

.info::after {
	overflow: auto;
	height: 500px;
	width: 100%;
	/* background-image: url("../images/event1.jpg"); */
	background-color: black;
	opacity: 0.5;
}
</style>
</head>
<body>
	<script>
		$().ready(function() {
			var type;
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

			$('.toggleBG').click(function() {
				var toggleBG = $(this);
				var toggleFG = $(this).find('.toggleFG');
				var left = toggleFG.css('left');
				if (left == '30px') {
					toggleBG.css('background', '#CCCCCC');
					type = toggleActionStart(toggleFG, 'TO_LEFT');
				} else if (left == '0px') {
					toggleBG.css('background', '#ABD0BC');
					type = toggleActionStart(toggleFG, 'TO_RIGHT');
				}
			});

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
	<div id="info" class="info">
		<div id="infoR">
			<img src="${pageContext.request.contextPath}/images/${vo.mvPost}">
			<div class="btnDiv">
				<a href="#" class="ticketBtn">예매</a>
			</div>
		</div>
		<div id="infoL">
			<div style="height: 50px; line-height:40px;">
			<span class="title"
				style="white-space: normal; display: inline-block; line-height:40px; float: left;">${vo.mvTitle}</span>

			<jsp:useBean id="today" class="java.util.Date" />
			<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
			<c:if test="${vo.findate >= now }">
				<span id="status" style="height:40px; float: left; vertical-align: middle;">현재상영중</span>
			</c:if>
			</div>
			<p style="font-size: 20px;">${vo.mvAge}</p>
			<p style="font-size: 20px; margin: 10px 0;">${vo.mvCont}</p>
			<p style="font-size: 20px;">
				<c:if test="${vo.mvRank eq 0.0}">
					<c:forEach begin="1" end="5">&#127770;</c:forEach>
				</c:if>
				<c:if test="${!empty vo.mvRank}">
					<c:set var="num" value="${vo.mvRank - (vo.mvRank % 1)}" />
					<c:forEach begin="1" end="${num}">&#127773;</c:forEach>
					<c:if test="${vo.mvRank-num eq 0.5}">
						<c:forEach begin="1" end="${vo.mvRank-num+1}">&#127767;</c:forEach>
					</c:if>
				</c:if>
				${vo.mvRank}
			</p>
		</div>
	</div>
	<div class="tab-list">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">주요 정보</li>
			<li class="tab-link" data-tab="tab-2">실관람평</li>
			<li class="tab-link" data-tab="tab-3">예고편/스틸컷</li>
		</ul>
	</div>
	<div id="mainContent" style="min-width: 600px !important;">
		<div id="tab-1" class="tab-content current">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<span class="card-title" id="movieTitle"> <i
								class="fas fa-square"></i>${vo.mvTitle}
							</span>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr style="line-height: 32px;">
											<td>제목</td>
											<td><input type="text" name="mvTitle"
												class="form-control" value="${vo.mvTitle}" readonly></td>
											<td>감독</td>
											<td><input type="text" name="mvDir" class="form-control"
												value="${vo.mvDir}" readonly></td>
										</tr>
										<tr>
											<td>개봉일</td>
											<td><input type="text" name="strdate"
												class="form-control" value="${vo.strdate}" readonly></td>
											<td>상영 종료일</td>
											<td><input type="text" name="findate"
												class="form-control" value="${vo.findate}" readonly></td>
										</tr>
										<tr>
											<td>장르</td>
											<td><input type="text" name="mvType"
												class="form-control" value="${vo.mvType}" readonly></td>
											<td>관람 연령</td>
											<td><input type="text" name="mvAge" class="form-control"
												value="${vo.mvAge}" readonly></td>
										</tr>
										<tr>
											<td>등장인물</td>
											<td colspan="3"><input type="text" name="mvCha"
												class="form-control mb-3" value="${vo.mvCha}" readonly></td>
										</tr>
										<tr>
											<td>줄거리</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvSum" readonly>${vo.mvSum}</textarea></td>
										</tr>
										<tr>
											<td>설명</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvCont" readonly>${vo.mvCont}</textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div id="tab-2" class="tab-content">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<span class="card-title" id="movieTitle"> <i
								class="fas fa-square"></i>${vo.mvTitle} 관람평
							</span>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>작성자</th>
											<th>내용</th>
											<th>평점</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="rv" items="${rvList}">
											<tr>
												<td>${rv.mbrId }</td>
												<td>${rv.rvCont }</td>
												<td>${rv.rvRank }</td>
												<td>${rv.rvDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div id="tab-3" class="tab-content">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header">
							<i class="fas fa-square"></i> 티저 / 스틸컷
						</div>
						<div class="table-responsive">
							<div class="card-body">
								<table class="table">
									<tbody>
										<tr
											style="line-height: 32px; float: center; text-align: center;">
											<td colspan="4"><p style="size: 20px;">포스터 이미지</p> <img
												style="max-height: 400px;"
												src="${pageContext.request.contextPath}/images/${vo.mvPost}"></td>
										</tr>
										<tr style="text-align: center;">
											<td colspan="4" style="max-height: 400px;"><p>스틸컷</p> <img
												src="${pageContext.request.contextPath}/images/${vo.mvImg}"></td>
										</tr>
										<tr style="text-align: center;">
											<td colspan="2"><p>티저 영상</p> <video autoplay="autoplay"
													src="${pageContext.request.contextPath}/images/${vo.mvTeaser}"></video></td>
											<td colspan="2"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>
	<img alt="TOP" id="topBtn"
		src="${pageContext.request.contextPath}/images/top.png">
</body>
</html>