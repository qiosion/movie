<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 상세정보</title>
<style type="text/css">
#mv_title{
	font-size: 21px;
	font-weight: bolder;
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
								<td><label id="tc_num" class="highlight">예매번호 ${ vo.tc_num }</label></td>
								<td class="txt">예매일</td>
								<td><label id="tc_date">${ vo.tc_date }</label></td>
							</tr>
							<tr>
								<td class="txt">영화 제목</td>
								<td colspan="2"><label class="highlight" id="mv_title">${ vo.mv_title } </label></td>
								<td class="txt"><label id="mv_age">${ vo.mv_age }</label></td>
							</tr>
							<tr>
								<td class="txt">상영일</td>
								<td><label id="tt_scr_date" class="highlight">${ vo.tt_scr_date }</label></td>
								<td class="txt">상영시간</td>
								<td><label id="tt_time"><b>${ vo.tt_start }</b> ~ <b>${ vo.tt_end }</b></label></td>
							</tr>
							<tr>
								<td class="txt">상영관명</td>
								<td><label id="th_name" class="highlight">${ vo.th_name }</label></td>
								<td class="txt">좌석번호</td>
								<td><label id="tc_st_num" class="highlight">${ vo.tc_st_num }</label></td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="button" class="btn btn-dark" onclick="location.href='UserReservList.do'">목록으로</button>
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