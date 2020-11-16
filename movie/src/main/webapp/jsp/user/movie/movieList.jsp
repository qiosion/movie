
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

#topBtn {
	posotion: fixed;
	float: right;
	bottom: 50px;
	display: none;
	z-index: 999;
	height: 40px;
}

#div1 {
	margin: 5px 0;
}

#div2 {
	margin-bottom: 20px;
	min-height: 30px;
}
#div3 {
	text-align: center;
}
</style>
</head>
<body>
	<script>
		$(function() {
			var keyword = "";
			var searchType ="";
			
			movieList();

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
			
			$("#menuSearchBtn").click(function() {
				searchType = 'title';
				keyword = $("#keyword").val();
				movieList(searchType, keyword);
				$("#keyword").val("");
			});

			$('.tgl-flat').change(function() {
				searchType ="chkType";
				if ($('.tgl-flat').is(":checked")) {
					keyword = "ing";
				} else {
					keyword = "all";
				}
				//localhost.href="${pageContext.request.contextPath}/movieList.do?searchType='chkType'&keyword="+chkType;
				movieList(searchType, keyword);
			});
		});

		function movieList(searchType, keyword) {
			$.ajax({
				url : 'ajax/movieList.do',
				type : 'get',
				dataType : 'json',
				data : {
					searchType : searchType,
					keyword : keyword
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : movieListResult
			});
		}

		function movieListResult(data) {
			$("ol[id='listCont']").empty();
			$.each(data, function(idx, item) {
				var rank = "";
				if (item.mvRank == "") {
					for (var i = 0; i < 5; i++) {
						rank += '&#127770';
					}
				} else {
					var cnt = Math.floor(item.mvRank);
					for (var i = 0; i < cnt; i++) {
						rank += '&#127773';
					}
					if ((item.mvRank - cnt) == 0.5) {
						rank += '&#127767';
					} else {
						rank += '&#127770';
					}
				}

				var cont = "";
				if (typeof item.mvCont == "undefined") {
					cont = "";
				} else {
					cont = item.mvCont
				}

				$('<li>').append($('<div>').html('<a href="movieDetail.do?seq='+item.mvNum+'"><img id="moviePoster" src="${pageContext.request.contextPath}/images/'+item.mvPost+'"></a>'))
						.append($('<div>').attr('id', 'div1').html('<p style="font-size:20px;">'+ item.mvTitle+ '</p>'))
						.append($('<div>').attr('id', 'div2').html('<span style="font-size:15px;">평점 : '+ rank+ '</span> | <span style="font-size:15px;">개봉일 : '+ item.strdate+ '</span><p style="font-size:15px; margin-top:5px;">'+ cont+ '</p>'))
						.append($('<div>').attr('id', 'div3').html('<a href="reservation/reservationForm.do" class="ticketBtn Rerv">예매</a>'))
						.appendTo('ol[id="listCont"]');
			});
		}
	</script>

	<div class="movietop">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1"><a
				href="movieListForm.do">전체 영화</a></li>
			<li class="tab-link" data-tab="tab-2"><a
				href="movieExpectList.do">상영 예정작</a></li>
			<li class="tab-link" data-tab="tab-3"><a
				href="movieChartList.do">일별 박스오피스</a></li>
		</ul>
	</div>
	<div id="tab-1" class="tab-content current">
		<div align="right">
			<form name="search" id="search">
				<input type="hidden" name="action" value="list" />
				<input type="hidden" name="p" value="1" />
				<select id="searchType" name="searchType">
					<option value="title">제목</option>
				</select> <input type="text" name="keyword" id="keyword" placeholder="영화 제목">
				<button type="button" id="menuSearchBtn">검색</button>
			</form>
		</div>

		<div class="sort" style="min-height: 30px;">
			<span>전체</span>
			<!-- <div class="toggleBG">
				<button type="button" class="toggleFG"></button>
			</div> -->
			<span style="margin: 0 5px;"> <input class="tgl tgl-flat"
				id="cb4" type="checkbox" /> <label class="tgl-btn" for="cb4"></label>
			</span> <span>상영작만</span>
		</div>
		<br>
		<ol id="listCont"></ol>
	</div>
	<img alt="TOP" id="topBtn"
		src="${pageContext.request.contextPath}/images/top.png">
</body>
</html>