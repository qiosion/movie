<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(function() {
		$("#uptBtn").click(function() {
			movieUpdate();
		});
	});

	function movieUpdate() {
		$("#uptBtn").on("click", function() {
			console.log("movieUpdate");
			
			$.ajax({
				url : "mvUpdate.do",
				dataType : "json",
				method : "POST",
				data : $("#frm").serialize(),
				success : function(response) {
					// 목록으로 이동
					alert("수정 성공");
				},
				error : function(xhr, status, message) {
					alert("status : " + status + " error : " + message);
				}
			});
		});
	}
</script>
</head>
<body>
	<form id="frm" name="frm">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="movieTitle"> <i
						class="fas fa-square"></i>"${vo.mvTitle}" 수정
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr style="line-height: 32px;">
									<td>제목</td>
									<td><input type="text" name="mvTitle" class="form-control"
										value="${vo.mvTitle}" readonly></td>
									<td>감독</td>
									<td><input type="text" name="mvDir" class="form-control"
										value="${vo.mvDir}"></td>
								</tr>
								<tr>
									<td>개봉일</td>
									<td><input type="text" name="strdate" class="form-control"
										value="${vo.strdate}"></td>
									<td>상영 종료일</td>
									<td><input type="text" name="findate" class="form-control"
										value="${vo.findate}"></td>
								</tr>
								<tr>
									<td>장르</td>
									<td><input type="text" name="mvType" class="form-control"
										value="${vo.mvType}"></td>
									<td>관람 연령</td>
									<td><input type="text" name="mvAge" class="form-control"
										value="${vo.mvAge}"></td>
								</tr>
								<tr>
									<td style="width: 70px;">등장인물</td>
									<td colspan="3"><input type="text" name="mvCha"
										class="form-control mb-3" value="${vo.mvCha}"></td>
								</tr>
								<tr>
									<td>줄거리</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvSum"
											readonly>${vo.mvSum}</textarea></td>
								</tr>
								<tr>
									<td>설명</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvCont"
											readonly>${vo.mvCont}</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="pt-3"></div>
			<div class="card">
				<div class="card-header">
					<i class="fas fa-square"></i> 티저 / 스틸컷 수정
				</div>
				<div class="card-body">
					<table class="table">
						<tbody>
							<tr style="line-height: 32px; text-align: center;">
								<td style="width: 50px;">포스터 이미지</td>
								<td style="margin-right: 5px; width: 50px;"><input
									type="file" id="mvPost" name="mvPost" style="width: 50px;"></td>
								<td style="width: 50px;">스틸컷</td>
								<td style="width: 50px;"><input type="file" id="mvImg"
									name="mvImg" style="width: 50px;"></td>
							</tr>
							<tr style="float: center; text-align: center;">
								<td>티저 영상</td>
								<td><input type="file" id="mvTeaser" name="mvTeaser"
									style="width: 50px;"></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</form>
	<div class="text-center mt-3">
		<button type="button" id="uptBtn" style="margin-right: 30px;"
			class="btn btn-success">수정</button>
		<button type="button" class="btn btn-danger">취소</button>
	</div>

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
					<div id="list"></div>
					<div id="result"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" name="uptBtn" id="uptBtn"
						class="btn btn-success">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="clearSearch()">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>