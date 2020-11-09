<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style type="text/css">
td {
	text-align: center !important;
	vertical-align: middle !important;
}
th {
	text-align: center !important;
	vertical-align: middle !important;
}
</style>
<script type="text/javascript">
$(function() {
// 이메일전송버튼	
	$("#mailing").bind("click", function() {
	var chk = $("input[type='checkbox']:checked");
		console.log("----" + chk.length);
		for (var i=0; i<chk.length; i++ ){
			var em = $(chk[i]).parent().parent().find("td").eq(6).text();
			console.log('em' + em);
		}
	});
// 행 클릭하면 거기서 id 받아와서 그거의 예매현황보는 페이지로 넘기도록 하자
	$('#tbl tbody').on('click', 'tr', function () {
		var userId = $(this).find("td").eq(2).text();
		
	});	
// 회원탈퇴용
	$('#tbl tbody').on('click','#memDelBtn',function() {
		var userId = $(this).closest('tr').find("td").eq(2).text();
		$("#hdn").val(userId);
	});
});
</script>
</head>
<body>
<div class="table-responsive" align="center">
	<form>
		<table class="table table-bordered" id="tbl" border="1" style="text-align: center;">
			<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">회원번호</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">생년월일</th>
				<th scope="col">전화번호</th>
				<th scope="col">이메일</th>
				<th scope="col">메일수신</th>
				<th scope="col">가입일</th>
				<th scope="col">포인트</th>
				<th scope="col">권한</th>
				<th scope="col">회원탈퇴</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="member" items="${ members }">
				<tr>
					<td><input type="checkbox" id="mbr_e" name="mbr_e"></td>
					<td>${ member.mbr_no }</td>
					<td>${ member.mbr_id }</td>
					<td>${ member.mbr_nm }</td>
					<td>${ member.mbr_birth }</td>
					<td>${ member.mbr_phone }</td>
					<td>${ member.mbr_email }</td>
					<td>${ member.mbr_e_yn }</td>
					<td>${ member.mbr_regi_date }</td>
					<td>${ member.mbr_point }</td>
					<td>${ member.mbr_author }</td>
					<td><button type="button" class="btn btn-outline-secondary btn-sm" id="memDelBtn" data-toggle="modal" data-target="#memDelPop">탈퇴</button></td>
				</tr>			
			</c:forEach>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="12" align="center">
					<button type="button" class="btn btn-link" id="mailing">이메일 전송</button>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript">
		function goPage(p) {
			searchForm.p.value = p;
			searchForm.submit();
		}
	</script>
	<my:paging paging="${paging}" jsfunc="goPage" ></my:paging>
</div>
<!-- 팝업창 -->
	<div class="modal" id="memDelPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">회원 탈퇴</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm" action="memDel.do" method="post">
						<div>해당 회원을 탈퇴시키겠습니까?<br><br></div>
						<input type="hidden" id="hdn" name="hdn">
						<button type="submit" name="confirmDel" id="confirmDel" class="btn btn-success">탈퇴</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>