<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(function() {
		movieUpdate();
		movieDelete();
	});

	function movieDelete() {
		$("#confirmDel").on("click", function() {
			var delnum = '${vo.mvNum}';
			console.log("movieDelete");
			$.ajax({
				url : "ajax/mvDelete.do",
				data : {
					mvNum : delnum
				},
				dataType : 'json',
				method : 'post',
				success : function(xhr) {
					alert("삭제 성공");
					location.href = "mvList.do";
				},
				error : function(xhr, status, msg) {
					alert("status : " + status + " error : " + msg);
				}
			});
		});
	}

	function movieUpdate() {
		$("#uptBtn").on("click", function() {
			console.log("movieUpdate");

			$.ajax({
				url : "ajax/mvUpdate.do",
				dataType : "json",
				method : "POST",
				processData : false,
				contentType : false,
				//data : $("#frm").serialize(),
				data : data,
				success : function(response) {
					// 목록으로 이동
					alert("수정 성공");
					location.href = "mvUpdateForm.do?seq=" + $
					{
						vo.mvNum
					}
					;
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
								<input type="hidden" name="mvNum" value="${vo.mvNum}">
								<tr style="line-height: 32px;">
									<td>제목&nbsp;<span style="color: red;">*</span></td>
									<td><input type="text" name="mvTitle" class="form-control"
										value="${vo.mvTitle}" readonly></td>
									<td>감독&nbsp;<span style="color: red;">*</span></td>
									<td><input type="text" name="mvDir" class="form-control"
										value="${vo.mvDir}"></td>
								</tr>
								<tr>
									<td>개봉일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="strdate" class="form-control"
										value="${vo.strdate}"></td>
									<td>상영 종료일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="findate" class="form-control"
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
									<td>등장인물</td>
									<td colspan="3"><input type="text" name="mvCha"
										class="form-control mb-3" value="${vo.mvCha}"></td>
								</tr>
								<tr>
									<td>줄거리</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvSum">${vo.mvSum}</textarea></td>
								</tr>
								<tr>
									<td>설명</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvCont">${vo.mvCont}</textarea></td>
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
								<td style="width: 50px;">포스터 이미지&nbsp;<span
									style="color: red;">*</span></td>
								<td style="margin-right: 5px; width: 50px;"><input
									type="file" id="mvPost" name="mvPost" style="width: 50px;"
									value="${vo.mvPost}"></td>
								<td style="width: 50px;">스틸컷</td>
								<td style="width: 50px;"><input type="file" id="mvImg"
									name="mvImg" style="width: 50px;" value="${vo.mvImg}"></td>
							</tr>
							<tr style="float: center; text-align: center;">
								<td>티저 영상</td>
								<td><input type="file" id="mvTeaser" name="mvTeaser"
									style="width: 50px;" value="${vo.mvTeaser}"></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<div class="text-center mt-3">
			<button type="button" id="uptBtn" style="margin-right: 30px;"
				class="btn btn-success">수정</button>
			<button type="button" class="btn btn-danger"
				style="margin-right: 30px;" id="delBtn" data-toggle="modal"
				data-target="#mvDelPop">삭제</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='mvList.do'">목록</button>
		</div>
	</form>

	<!-- 팝업창 -->
	<div class="modal" id="mvDelPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">회원 탈퇴</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm">
						<p style="text-align: center; margin: 10px; font-size: 20px;">${vo.mvTitle}
							을(를) 삭제하시겠습니까?</p>
						<div style="text-align: center;">
							<button type="button" style="margin-right: 5px;"
								name="confirmDel" id="confirmDel" class="btn btn-success">삭제</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>