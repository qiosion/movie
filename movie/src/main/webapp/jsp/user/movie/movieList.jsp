
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="mv" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.tgl {
	display: none;
}

.tgl+.tgl-btn {
	outline: 0;
	display: block;
	width: 4em;
	height: 2em;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.tgl+.tgl-btn:after, .tgl+.tgl-btn:before {
	position: relative;
	display: block;
	content: "";
	width: 50%;
	height: 100%;
}

.tgl+.tgl-btn:after {
	left: 0;
}

.tgl+.tgl-btn:before {
	display: none;
}

.tgl:checked+.tgl-btn:after {
	left: 50%;
}

.tgl-flat+.tgl-btn {
	padding: 2px;
	transition: all .2s ease;
	background: #fff;
	border: 4px solid #f2f2f2;
	border-radius: 2em;
}

.tgl-flat+.tgl-btn:after {
	transition: all .2s ease;
	background: #f2f2f2;
	content: "";
	border-radius: 1em;
}

.tgl-flat:checked+.tgl-btn {
	border: 4px solid #7FC6A6;
}

.tgl-flat:checked+.tgl-btn:after {
	left: 50%;
	background: #7FC6A6;
}
</style>
</head>
<body>
	<script>
		$().ready(function() {
			var chkType = "";
			/* $('.toggleBG').click(function() {
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
			}); */

			$('.tgl-flat').change(function() {
				if ($('.tgl-flat').is(":checked")) {
					chkType = "ing";
				} else {
					chkType = "all";
				}
				//localhost.href="${pageContext.request.contextPath}/movieList.do?searchType='chkType'&keyword="+chkType;
				$.ajax({
					url : 'movieList.do',
					type : 'post',
					data : {
						searchType : 'chkType',
						keyword : chkType
					},
					success : function() {
					},
					error : function() {
						alert("실패");
					}
				});
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
				href="movieList.do">전체 영화</a></li>
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

		<div class="sort" style="min-height: 30px;">
			<span>전체</span>
			<!-- <div class="toggleBG">
				<button type="button" class="toggleFG"></button>
			</div> -->
			<span style="margin: 0 5px;;"> <input class="tgl tgl-flat" id="cb4" type="checkbox" />
				<label class="tgl-btn" for="cb4"></label>
			</span> <span>개봉작만</span>
		</div>
		<br>
		<ol align="center">
			<c:forEach var="movie" items="${movies}">
				<li>
					<div style="margin-bottom: 5px;">
						<a href="movieDetail.do?seq=${movie.mvNum }"> <img
							id="moviePoster"
							src="${pageContext.request.contextPath}/images/${movie.mvPost}"></a>
					</div>
					<div style="margin-bottom: 5px;">
						<p>${movie.mvTitle}</p>
					</div>
					<div style="margin-bottom: 20px; min-height: 30px;">
						<span>평점 : 
							<c:if test="${empty movie.mvRank}">
								<c:forEach begin="1" end="5">&#127770;</c:forEach>
							</c:if>
							<c:if test="${!empty movie.mvRank}">
								<c:set var="num" value="${movie.mvRank - (movie.mvRank % 1)}"/>
								<c:forEach begin="1" end="${num}">&#127773;</c:forEach>
								<c:if test="${movie.mvRank-num eq 0.5}">
								<script type="text/javascript">
									console.log(">>>0.5");
								</script>
									<c:forEach begin="1" end="${movie.mvRank-num+1}">&#127767;</c:forEach>
								</c:if>
							</c:if>
						</span>
						 | <span>개봉일 : ${movie.strdate}</span>
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