<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function formCheck() {
		if (keyword.value == "") {
			alert("검색어를 입력해주세요.");
			return;
		} else {
			showMvList();
		}
	}

	function showMvList() {
		console.log("영화목록");
	}
</script>
</head>
<body>
	<h2>영화 등록 화면</h2>
	<button type="button" id="searchBtn" data-toggle="modal"
		data-target="#searchPopup">검색</button>
	<form id="frm" name="frm" action="mvRegist.do" method="post">
		<table border="1" id="mvReg">
			<tr>
				<th width="150">제목</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="제목 입력"></td>
			</tr>
			<tr>
				<th width="150">감독</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="감독 입력"></td>
			</tr>
			<tr>
				<th width="150">배급사</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="배급사 입력"></td>
			</tr>
			<tr>
				<th width="150">등장인물</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="등장인물 입력"></td>
			</tr>
			<tr>
				<th width="150">개봉일</th>
				<td width="500" align="center"><input type="date"></td>
			</tr>
			<tr>
				<th width="150">종료일</th>
				<td width="500" align="center"><input type="date"></td>
			</tr>
			<tr>
				<th width="150">줄거리</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="줄거리 입력"></td>
			</tr>
			<tr>
				<th width="150">장르</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="장르 입력"></td>
			</tr>
			<tr>
				<th width="150">포스터 이미지</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
			<tr>
				<th width="150">썸네일</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
			<tr>
				<th width="150">티저영상</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
		</table>
	</form>

	<!-- 팝업창 -->
	<div class="modal" id="searchPopup">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">영화 검색</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="search">
							<input type="text" name="keyword" id="keyword"
								placeholder="영화 제목을 입력하세요">
							<button id="searchButton" type="button"
								onclick="return formCheck()">검색</button>
					</div>
					<div id="popContent">
						<p>조회된 영화가 없습니다.</p>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>