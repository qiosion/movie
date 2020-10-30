<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div align="center">
		<div>
			<form id="frm" name="frm" action="loginForm.do"method="post">
				<table border="1">
					<tr>
						<th width="150">아이디</th>
						<td width="300"><input type="text" id="mbr_id" name="mbr_id"></td>
						<td rowspan="2"><button type="submit">로그인</button></td>
						<!-- onclick="return formCheck()" -->
					</tr>
					<tr>
						<th width="150">비밀번호</th>
						<td width="300"><input type="password" id="mbr_pw" name="mbr_pw"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="button">회원가입</button>&nbsp;&nbsp;
							<!-- onclick="location.href='memberForm.do'" -->
							<button type="button">ID/패스워드 찾기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>