<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 상세정보</title>
<style type="text/css">
.txt {
	text-align: right;
}
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
</style>
</head>
<body>
	<form class="frm" id="frm" name="frm" method="post" style="padding: 20px; max-width: 70%; margin-bottom: 10px;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>예매 상세 정보
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">예매번호</td>
								<td><input type="text" name="tc_num" class="form-control" value="${ vo.mv_title }" readonly></td>
							</tr>
							<tr>
								<td class="txt">영화 제목</td>
								<td><input type="text" name="mv_title" class="form-control" value="${ vo.mv_title }" readonly></td>
							</tr>
							<tr>
								<td class="txt">연령제한</td>
								<td><input type="text" name="mv_age" class="form-control" value="${ vo.mv_age }" readonly></td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="button" class="btn btn-dark" onclick="location.href='main.do'">목록으로</button>
			<!-- <button type="button" class="btn btn-danger" id="cancelBtn" data-toggle="modal" data-target="#cancelPop">예매 취소</button> -->
		</div>
	</form>
<!-- 예매취소 팝업창
	<div class="modal" id="cancelPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<div class="modal-header">
					<h1 class="modal-title">예매 취소</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<div class="modal-body">
					<form id="frm2" name="frm2" action="" method="post">
						<div id="cancel">
							<input type="text" name="pwchk" id="pwchk" placeholder="비밀번호를 입력하세요">
						</div>
						<button type="submit" name="confirmDel" id="confirmDel" class="btn btn-success">탈퇴</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
 -->
</body>
</html>