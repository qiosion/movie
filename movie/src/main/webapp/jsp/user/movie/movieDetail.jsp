<%@page import="com.cbox.movie.dao.MovieDAO"%>
<%@page import="com.cbox.movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				console.log("type : " + type);
			});
		});
	</script>
	<div id="info" class="info">
		<div id="infoR">
			<img src="${pageContext.request.contextPath}/images/${vo.mvPost}">
			<div class="btnDiv">
				<a href="#" class="ticketBtn">예매</a>
				<!-- todo -->
			</div>
		</div>
		<div id="infoL">
			<p class="title">${vo.mvTitle}</p>
			<p>${vo.mvCont}</p>
			<p style="align: bottom;">${vo.mvRank}</p>
		</div>
	</div>
	<div class="tab-list">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">주요 정보</li>
			<li class="tab-link" data-tab="tab-2">실관람평</li>
			<li class="tab-link" data-tab="tab-3">예고편/스틸컷</li>
		</ul>
	</div>
	<div id="mainContent">
		<div id="tab-1" class="tab-content current">Duis aute irure
			dolor in reprehenderit in voluptate velit esse cillum dolore eu
			fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
			proident, sunt in culpa qui officia deserunt mollit anim id est
			laborum.</div>
		<div id="tab-2" class="tab-content"></div>
		<div id="tab-3" class="tab-content"></div>
	</div>
</body>
</html>