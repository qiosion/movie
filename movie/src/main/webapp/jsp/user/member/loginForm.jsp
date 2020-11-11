<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
.txt {
	text-align: right;
}
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
.find {
	margin: 10px;
	height: 100px;
	width: 120px;
	background-color: #343A40;
	color: #FFFFFF;
	border-radius: 10px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
	function formCheck() {
		var frm = document.frm;
		if (frm.mbr_id.value == "") {
			alert("사용자 아이디를 입력하세요");
			frm.mbr_id.focus();
			return false;
		}
		if (frm.mbr_pw.value == "") {
			alert("비밀번호를 입력하세요");
			frm.mbr_pw.focus();
			return false;
		}
		return true;
	}
	function findIdCheck() {
		if (frm3.nmch.value == "") {
			alert("이름을 입력하세요");
			frm3.nmch.focus();
			return false;
		}
		var frm3 = document.frm3;
		if(frm3.bdch.value == "") {
			alert ("생년월일을 선택하세요");
			frm3.bdch.focus();
			return false;
		}
		if(isNaN(frm3.phch.value)) {
			alert ("전화번호는 숫자만 입력가능합니다");
			frm3.phch.focus();
			return false;
		}
		return true;
	}
	function findPwCheck() {
		var frm4 = document.frm4;
		if(frm4.idchk.value == "") {
			alert ("아이디를 입력하세요");
			frm4.idchk.focus();
			return false;
		}
		if (frm4.nmchk.value == "") {
			alert("이름을 입력하세요");
			frm4.nmchk.focus();
			return false;
		}
		if(isNaN(frm4.phchk.value)) {
			alert ("전화번호는 숫자만 입력가능합니다");
			frm4.phchk.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form class="frm" id="frm" name="frm" action="login.do" method="post" style="margin:auto; padding: 20px; max-width: 70%; margin-bottom: 10px;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>로그인
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디"></td>
							</tr>
							<tr>
								<td class="txt">비밀번호</td>
								<td><input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="submit" class="btn btn-success" onclick="return formCheck()" style="margin-right: 30px;">로그인</button>
			<button type="button" class="btn btn-dark" style="margin-right: 30px;" id="findBtn" data-toggle="modal" data-target="#findPop">ID/패스워드 찾기</button>
			<button type="button" class="btn btn-danger" onclick="location.href='memberForm.do'">회원가입</button>
		</div>
	</form>
	<%
	// id, pw 틀리면 화면에 메세지 출력
		String msg = request.getParameter("msg");
		if(msg!=null && msg.equals("0")) {
			out.println("<br>");
			out.println("<font color='red' size='5' align='center'>비밀번호를 확인해 주세요.</font>");
		} else if(msg!=null && msg.equals("-1")) {    
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
	%>
<!-- id/비번찾기  -->
	<div class="modal" id="findPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">아이디/비밀번호 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm2" name="frm2">
						<div id="find" align="center">
							<button type="button" class="find" id="idBtn" data-toggle="modal" data-target="#idPop">ID 찾기</button>
							<button type="button" class="find" id="pwBtn" data-toggle="modal" data-target="#pwPop">비밀번호 찾기</button>
						</div>
						<div style="margin-bottom: 40px;"></div>
						<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">닫기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- id찾기 -->
	<div class="modal" id="idPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">아이디 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm3" name="frm3" action="searchId.do" method="post">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">이름</td>
								<td><input type="text" class="form-control" id="nmch" name="nmch" placeholder="이름"></td>
							</tr>
							<tr>
								<td class="txt">생년월일</td>
								<td><input type="date" class="form-control" id="bdch" name="bdch"></td>
							</tr>
							<tr>
								<td class="txt">전화번호</td>
								<td><input type="text" class="form-control" id="phch" name="phch" placeholder="숫자"></td>
							</tr>
						</table>
						<button type="submit" name="fid" id="fid" class="btn btn-danger" onclick="return findIdCheck()">아이디찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal" style="margin-left: 10px;">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 비번찾기 -->
	<div class="modal" id="pwPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">비밀번호 찾기</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center">
					<form id="frm4" name="frm4" action="searchPw.do" method="post">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" class="form-control" id="idchk" name="idchk" placeholder="아이디"></td>
							</tr>
							<tr style="line-height: 32px;">
								<td class="txt">이름</td>
								<td><input type="text" class="form-control" id="nmchk" name="nmchk" placeholder="이름"></td>
							</tr>
							<tr>
								<td class="txt">전화번호</td>
								<td><input type="text" class="form-control" id="phchk" name="phchk" placeholder="숫자"></td>
							</tr>
						</table>
						<button type="submit" name="fid" id="fid" class="btn btn-danger" onclick="return findPwCheck()">비밀번호찾기</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal" style="margin-left: 10px;">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>