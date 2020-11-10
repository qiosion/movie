<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserReservList.jsp</title>
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
		<h3>예매 내역</h3>
	</div>
	<div id="ReservList" align="center">
		<table border="1" class="table table-hover"
			style="margin-bottom: 20px;">
			<thead>
				<tr>
					<th>예매번호</th>
					<th>영화이름</th>
					<th>상영일</th>
					<th>상영시작시간</th>
					<th>좌석번호</th>
					<th>상영관명</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="uReList" items="${ userReservList }">
				<tr>
					<td>${ uReList.mbr_no }</td>
					<td>${ uReList.mbr_id }</td>
					<td>${ uReList.mbr_nm }</td>
					<td>${ uReList.mbr_birth }</td>
					<td>${ uReList.mbr_phone }</td>
					<td>${ uReList.mbr_email }</td>
					<td><button id="selBtn">조회</button></td>
				</tr>			
			</c:forEach>
			</tbody>
		</table>
	</form>
	<script type="text/javascript">
		function goPage(p) {
			location.href="UserReservList.do?p=" + p;
			// searchForm.p.value = p;
			// searchForm.submit();
		}
	</script>
	<my:paging paging="${paging}" jsfunc="goPage" ></my:paging>
</div>
</body>
</html>