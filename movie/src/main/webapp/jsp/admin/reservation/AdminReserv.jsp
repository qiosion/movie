<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ page import="com.cbox.common.Paging" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 예매현황 페이지</title>
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

#selBtn {
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

</head>
<body>
	<div class="tit-heading-wrap tit-evt">
		<h3>전체 예매 내역</h3>
	</div>
	<div id="topMvMenu">
		<div align="right">
			<my:searchId returnPage="AdminReserv.do" />
		</div>
	</div>
	<div id="ReservList" align="center">
		<table border="1" class="table table-hover"
			style="margin-bottom: 20px;">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>회원아이디</th>
					<th>영화이름</th>
					<th>상영일</th>
					<th>상영시작시간</th>
					<th>좌석번호</th>
					<th>상영관명</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="allReserv" items="${ allReservList }">
				<tr>
					<td>${ allReserv.tc_num }</td>
					<td>${ allReserv.mbr_id }</td>
					<td>${ allReserv.mv_title }</td>
					<td>${ allReserv.tt_scr_date }</td>
					<td>${ allReserv.tt_start }</td>
					<td>${ allReserv.tc_st_num }</td>
					<td>${ allReserv.th_name }</td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	<my:paging paging="${paging}" jsfunc="goPage" ></my:paging>
</div>
	<script type="text/javascript">
		function goPage(p) {
			location.href="AdminReserv.do?p=" + p;
			// searchForm.p.value = p;
			// searchForm.submit();
		}
	</script>
</body>
</html>