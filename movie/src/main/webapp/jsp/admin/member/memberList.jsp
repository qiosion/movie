<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ page import="com.cbox.common.Paging" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
th, td {
	text-align: center !important;
	vertical-align: middle !important;
}

.table>thead {
	background-color: #EDEBE1;
}

.table>thead>tr>td {
	text-align: center;
	font-color: #666666;
	font-size: large;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
}

.table>tbody>tr>td {
	border-bottom: 1px solid #ddd;
	font-family: monospace;
	text-align: center;
}

.table>tbody>tr>#td1 {
	text-align: left;
}

.table>tbody>tr>td>a:hover {
	text-decoration: underline;
}

#memDelBtn {
	background-color: #D85E48;
	padding: 5px;
	border-radius: 5px;
	color: white;
}

.tit-evt {
	position: relative;
}

.tit-heading-wrap {
	position: relative;
	height: 51px;
	margin-top: 30px;
	border-bottom: 3px solid #241d1e;
}

.tb-style {
	width: 1000;
	border-style: solid;
	border-color: black;
}

.dvtable-style {
	width: 700;
	border: 3;
	bordercolor: lightgray;
	align: center;
}
</style>
<script type="text/javascript">
$(function() {
// 회원탈퇴
	$('tbody').on('click','#memDelBtn',function() {
		var userId = $(this).closest('tr').find("td").eq(2).text();
		$("#hdn").val(userId);
	});
});
</script>
</head>
<body>
	<div class="tit-heading-wrap tit-evt">
		<h3>회원 관리</h3>
	</div>
	<div id="memList" align="center">
		<table border="1" class="table table-hover"
			style="margin-bottom: 20px;">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>메일수신</th>
					<th>가입일</th>
					<th>포인트</th>
					<th>권한</th>
					<th>회원탈퇴</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="member" items="${ members }">
				<tr>
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
					<td><button id="memDelBtn" data-toggle="modal" data-target="#memDelPop">탈퇴</button></td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	<script type="text/javascript">
		function goPage(p) {
			location.href="memberList.do?p=" + p;
			// searchForm.p.value = p;
			// searchForm.submit();
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
				<div class="modal-body" align="center">
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