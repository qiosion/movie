<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
</style>
<script type="text/javascript">
	$(function() {
		movieUpdate();
		movieDelete();
	});

	function movieDelete() {
		$("#confirmDel").on("click", function() {
			var delnum = '${vo.mvNum}';
			$.ajax({
				url : "ajax/mvDelete.do",
				data : {
					mvNum : delnum
				},
				dataType : 'json',
				method : 'post',
				success : function(xhr) {
					if(xhr.result) {
						alert("삭제 성공");
						location.href = "mvList.do";
					} else {
						alert("등록된 상영 정보가 있어 삭제가 불가능합니다.");
					}
				},
				error : function(xhr, status, msg) {
					alert("status : " + status + " error : " + msg);
				}
			});
		});
	}

	function movieUpdate() {
		$("#confirmUpt").on("click", function() {
			// multipart
			var form = $("#frm")[0];
			var data = new FormData(form);

			// 빈칸 체크
			if (!$("#mvDir").val()) {
				alert("감독명을 입력해주세요");
				return false;				
			}
			if (!$("#strdate").val()) {
				alert("개봉일을 선택 해주세요");
				return false;				
			}
			if (!$("#findate").val()) {
				alert("종료일을 선택 해주세요");
				return false;				
			}

			if (!$("#mvPost").val() && !$("#prevPost").val()) {
				alert("포스터 이미지를 첨부 해주세요.");
				return false;				
			}

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
					location.href = "mvUpdateForm.do?seq=" + ${vo.mvNum};
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
									<td><input type="text" name="mvTitle" id="mvTitle" class="form-control"
										value="${vo.mvTitle}" readonly></td>
									<td>감독&nbsp;<span style="color: red;">*</span></td>
									<td><input type="text" name="mvDir" id="mvDir" class="form-control"
										value="${vo.mvDir}"></td>
								</tr>
								<tr>
									<td>개봉일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="strdate" id="strdate" class="form-control"
										value="${vo.strdate}"></td>
									<td>상영 종료일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="findate" id="findate" class="form-control"
										value="${vo.findate}"></td>
								</tr>
								<tr>
									<td>장르</td>
									<td><input type="text" name="mvType" id="mvType" class="form-control"
										value="${vo.mvType}"></td>
									<td>관람 연령</td>
									<td><input type="text" name="mvAge" id="mvAge" class="form-control"
										value="${vo.mvAge}"></td>
								</tr>
								<tr>
									<td>등장인물</td>
									<td colspan="3"><input type="text" name="mvCha" id="mvCha"
										class="form-control mb-3" value="${vo.mvCha}"></td>
								</tr>
								<tr>
									<td>줄거리</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvSum" id="mvSum">${vo.mvSum}</textarea></td>
								</tr>
								<tr>
									<td>설명</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvCont" id="mvCont">${vo.mvCont}</textarea></td>
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
								<td style="margin-right: 5px; width: 50px;">
								<input type="hidden" name="prevPost" id="prevPost" value="${vo.mvPost}">
								<input
									type="file" id="mvPost" name="mvPost" style="width: 50px;"></td>
								<td style="width: 50px;">스틸컷</td>
								<td style="width: 50px;">
								<input type="hidden" name="prevImg" id="prevImg" value="${vo.mvImg}">
								<input type="file" id="mvImg"
									name="mvImg" style="width: 50px;"></td>
							</tr>
							<c:if test="${vo.mvPost ne null}">
								<tr>
									<td colspan="4" style="text-align: center;">
										<img style="max-height: 350px;" src="${pageContext.request.contextPath}/images/${vo.mvPost}">
									</td>
								</tr>
							</c:if>
							<tr style="float: center; text-align: center;">
								<td>티저 영상</td>
								<td>
								<input type="hidden" name="prevTeaser" id="prevTeaser" value="${vo.mvTeaser}">
								<input type="file" id="mvTeaser" name="mvTeaser"
									style="width: 50px;"></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<div class="text-center mt-3">
			<button type="button" id="uptBtn" style="margin-right: 30px;"
				data-toggle="modal" data-target="#mvUptPop" class="btn btn-success">수정</button>
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
					<h1 class="modal-title">영화 삭제</h1>
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

	<div class="modal" id="mvUptPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">영화 수정</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm">
						<p style="text-align: center; margin: 10px; font-size: 20px;">${vo.mvTitle}
							을(를) 수정하시겠습니까?</p>
						<div style="text-align: center;">
							<button type="button" style="margin-right: 5px;"
								name="confirmUpt" id="confirmUpt" class="btn btn-success">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>