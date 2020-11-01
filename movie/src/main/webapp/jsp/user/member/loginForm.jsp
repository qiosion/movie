<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
</script>
</head>
<body>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="login.do" method="post">
		<div class="form-group">
			<label for="mbr_id">아이디</label>
			<input type="text" class="form-control" id="mbr_id" name="mbr_id">
		</div>
		<div class="form-group">
			<label for="mbr_pw">비밀번호</label>
			<input type="password" class="form-control" id="mbr_pw" name="mbr_pw">
		</div>
		<button type="submit" class="btn btn-primary" onclick="return formCheck()">로그인</button>
		<button type="button" class="btn btn-primary" onclick="location.href='searchidpwForm.do'">ID/패스워드 찾기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='memberForm.do'">회원가입</button>
	</form>
</div>
</body>
</html>