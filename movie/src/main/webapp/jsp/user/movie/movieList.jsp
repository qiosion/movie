<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/movie.css" rel="stylesheet">
</head>
<body>
	<script>
		$().ready(function() {
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
				var type;
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

		function formCheck() {
			var frm = document.search;
			if (frm.keyword.value == "") {
				alert("검색어를 입력해주세요.");
				return;
			}
			/* form.submit(); */
		}

		// 토글 버튼 이동 모션 함수
		function toggleActionStart(toggleBtn, LR) {
			// 0.01초 단위로 실행
			var intervalID = setInterval(function() {
				// 버튼 이동
				var left = parseInt(toggleBtn.css('left'));
				left += (LR == 'TO_RIGHT') ? 5 : -5;
				if (left >= 0 && left <= 30) {
					left += 'px';
					toggleBtn.css('left', left);
				}
			}, 10);
			setTimeout(function() {
				clearInterval(intervalID);
			}, 201);

			const left_px = parseInt(toggleBtn.css('left'));
			console.log("left_px : " + left_px);
			return (left_px > 0) ? "expected" : "screening";
		}
	</script>
	<div>
		<div class="top">
			<form name="search" id="search" method="post">
				<input type="text" name="keyword" id="keyword" placeholder="영화 제목">
				<button type="submit" onclick="return formCheck()">검색</button>
			</form>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">박스 오피스</li>
				<li class="tab-link" data-tab="tab-2">상영 예정작</li>
				<li class="tab-link" data-tab="tab-3">메뉴_셋</li>
			</ul>
		</div>
		<div class="sort">
			<span>전체</span>
			<div class="toggleBG">
				<button type="button" class="toggleFG"></button>
			</div>
			<span>개봉작만</span>
		</div><br>
		<div class="mainContent">
			<div id="tab-1" class="tab-content current">Lorem ipsum dolor
				sit amet, consectetur adipisicing elit, sed do eiusmod tempor
				incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
				ea commodo consequat.</div>
			<div id="tab-2" class="tab-content">Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</div>
			<div id="tab-3" class="tab-content">Ut enim ad minim veniam,
				quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
				commodo consequat. Duis aute irure dolor in reprehenderit in
				voluptate velit esse cillum dolore eu fugiat nulla pariatur.</div>
		</div>
	</div>
</body>
</html>