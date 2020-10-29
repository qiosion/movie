<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<!-- 아니 근데 이거.. 회원정보 그냥 보는거랑 수정하는거랑 2개를 만들어야하는거야 뭐야?? ㅠㅠ -->
	<div align="center">
		<div>
		 <!-- vo 객체이름 그대로 넣어줘야함 -->
<%-- 		<h3>아이디 : ${ vo.id }</h3>
		<h3>성   명 : ${ vo.name }</h3>
		<h3>주   소 : ${ vo.address }</h3>
		<h3>전화번호 : ${ vo.tel }</h3>
		<h3>가입일자 : ${ vo.enterdate }</h3>
		<h3>사용자권한 : ${ vo.author }</h3>

이거처럼 vo만들어서 각 td안에 넣어주면 되는가..--%>
				<table border="1">
					<tr>
						<th width="150">아이디</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th width="150">이름</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th width="150">생년월일</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th width="150">전화번호</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th width="150">이메일</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th width="150">이메일 광고 수신여부</th>
						<td width="300"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정">&nbsp;&nbsp;
							<input type="button" value="탈퇴?">
						</td>
					</tr>
				</table>
		</div>
	</div>
</body>
</html>