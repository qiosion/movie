<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script type="text/javascript">
$(function() {
	$("#mailing").bind("click", function() {
	var chk = $("input[type='checkbox']:checked");
		console.log("----" + chk.length);
		for (var i=0; i<chk.length; i++ ){
			var em = $(chk[i]).parent().parent().find("td").eq(6).text();
			console.log('em' + em);
		}
	});
});
</script>
</head>
<body>
<div align="center">
	<div>
	<form>
		<table border="1" style="border-collapse: collapse; text-align: center;">
			<tr>
				<th width="100">선택</th>
				<th width="100">회원번호</th>
				<th width="100">아이디</th>
				<th width="100">이름</th>
				<th width="100">생년월일</th>
				<th width="150">전화번호</th>
				<th width="150">이메일</th>
				<th width="100">메일수신</th>
				<th width="100">가입일</th>
				<th width="100">포인트</th>
				<th width="100">권한</th>
			</tr>
			<c:forEach var="member" items="${ members }">
				<tr>
					<td><input type="checkbox" class="form-check-input" id="mbr_e" name="mbr_e"></td>
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
				</tr>			
			</c:forEach>
			<tr>
				<td colspan="11" align="center">
					<button type="button" id="mailing">이메일 전송</button>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function goPage(p) {
			// location.href="memberList.do?p="+p; 이거 번거롭다. 폼 이용하면 간단
			searchForm.p.value = p;
			searchForm.submit();
		}
	</script>
	<my:paging paging="${paging}" jsfunc="goPage" ></my:paging>
	</div>
</div>
</body>
</html>