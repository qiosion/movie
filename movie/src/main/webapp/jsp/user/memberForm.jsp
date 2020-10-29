<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div align="center">
		<div>
			<form id="frm" name="frm" method="post">
<!-- action="memberInsert.do"  -->
				<table border="1">
					<tr>
						<th width="150">아이디</th>
						<td width="300"><input type="text" id="mbr_id" name="mbr_id"></td>
					</tr>
					<tr>
						<th width="150">비밀번호</th>
						<td width="300"><input type="password" id="mbr_pw" name="mbr_pw"></td>
					</tr>
					<tr>
						<th width="150">비밀번호 확인</th>
						<td width="300"><input type="password" id="mbr_pw"
							name="mbr_pw"></td>
					</tr>
					<tr>
						<th width="150">이름</th>
						<td width="300"><input type="text" id="mbr_nm" name="mbr_nm"></td>
					</tr>
					<tr>
						<th width="150">생년월일</th>
						<td width="300"><input type="date" id="mbr_birth" name="mbr_birth"></td>
					</tr>
					<tr>
						<th width="150">전화번호</th>
						<td width="300"><input type="text" id="mbr_phone" name="mbr_phone"></td>
					</tr>
					<tr>
						<th width="150">이메일</th>
						<td width="300"><input type="text" id="mbr_email" name="mbr_email"></td>
					</tr>
					<tr>
						<th width="150">이메일 광고 수신여부</th>
						<td width="300"><input type="radio" id="mbr_e_yn" name="mbr_e_yn"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원가입">&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>