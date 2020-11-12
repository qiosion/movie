<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ page import="com.cbox.common.Paging" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘포함 이후 예매내역</title>
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
		<h3>오늘이후 예매 내역</h3>
	</div>
	<div id="topMvMenu">
		<div align="right">
			<my:searchId returnPage="ReservFromToday.do" />
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
			<c:forEach var="FromToday" items="${ ReservFromTodayList }">
				<tr>
					<td>${ FromToday.tc_num }</td>
					<td>${ FromToday.mbr_id }</td>
					<td>${ FromToday.mv_title }</td>
					<td>${ FromToday.tt_scr_date }</td>
					<td>${ FromToday.tt_start }</td>
					<td>${ FromToday.tc_st_num }</td>
					<td>${ FromToday.th_name }</td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	<my:paging paging="${paging}" jsfunc="goPage" ></my:paging>
</div>
	<script type="text/javascript">
		function goPage(p) {
			location.href="ReservFromToday.do?p=" + p;
			// searchForm.p.value = p;
			// searchForm.submit();
		}
	</script>
</body>
</html>