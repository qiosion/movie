<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function deleteFrm(){
	location.href="couponDelete.do?cp_no=${vo.cp_no}";
}
function addFrm(){
	location.href="";
}
</script>
</head>
<body>
<div>
	<h2>CBOX 할인쿠폰 내역</h2>
</div>
<div class="tbl-data">
	<table>
		<thead>
			<tr>
				<td>쿠폰번호</td>
				<td>쿠폰이름</td>
				<td>유효기간</td>
				<td>쿠폰종류</td>
				<td>할인금액</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="cp" items="${couponList}">
			<tr>
				<td>${cp.cp_no}</td>
				<td>${cp.cp_nm}</td>
				<td>${cp.cp_valid_date}</td>
				<td>${cp.cp_type}</td>
				<td>${cp.cp_discount}</td>
				<c:if test="${mbr_author eq 'admin'}">	
				<td><button type="submit" onclick="deleteFrm()">삭제</button></td>
				</c:if>
			</tr>
			</c:forEach>
		</tbody>
		<div><button type="submit" onclick="addFrm()">쿠폰등록</button>
		</div>
		
	</table>
</div>
</body>
</html>