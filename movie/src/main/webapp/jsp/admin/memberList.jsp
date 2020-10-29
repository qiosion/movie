<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<div align="center">
	<div>
		<table border="1" style="text-align: center;">
			<tr>
				<th width="100">회원번호</th>
				<th width="100">아이디</th>
				<th width="100">이름</th>
				<th width="100">생년월일</th>
				<th width="150">전화번호</th>
				<th width="200">이메일</th>
				<th width="50">메일수신</th>
				<th width="100">가입일</th>
				<th width="100">포인트</th>
			</tr>
		<!-- 데이터가 몇개일지 모르니까 forEach 돌려서 행 만들어준다 -->	
			<%-- <c:forEach var="member" items="${ members }">
				<tr>
					<td>${ member.id }</td>
					<td>${ member.name }</td>
					<td>${ member.address }</td>
					<td>${ member.tel }</td>
					<td>${ member.enterdate }</td>
					<td>${ member.author }</td>
				</tr>			
			</c:forEach> --%>
		</table>
	</div>
</div>
</body>
</html>