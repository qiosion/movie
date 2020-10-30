<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function formCheck() {
		var f = document.frm;
		if(f.id.value == "") {
			alert ("사용자 아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pw.value == "") {
			alert ("비밀번호를 입력하세요");
			f.pw.focus();
			return false;
		}
	return true;
	}
</script>
</head>
<body>
	<div align="center">
		<div>
			<form id="frm" name="frm" action="loginForm.do"method="post">
				<table border="1">
					<tr>
						<th width="150">아이디</th>
						<td width="300"><input type="text" id="mbr_id" name="mbr_id"></td>
						<td rowspan="2"><button type="submit" onclick="return formCheck()">로그인</button></td>
					</tr>
					<tr>
						<th width="150">비밀번호</th>
						<td width="300"><input type="password" id="mbr_pw" name="mbr_pw"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button" onclick="location.href='memberForm.do'">회원가입</button>&nbsp;&nbsp;
							<button type="button">ID/패스워드 찾기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>