<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="css/info.css">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script>
function listFrm(){
	location.href="infoList.do";
}
function deleteFrm(){
	location.href="infoDelete.do?info_Num=${vo.info_Num}";
}
function updateFrm(){
	location.href="infoUpdateForm.do?info_Num=${vo.info_Num}";
}
	
</script>
<style>
.table > tbody > tr > td{
 	font-color: #666666;
 	font-size:large;
 	font-weight:normal;
 	border-bottom: 1px solid black;
 	border-left-color: black;
 	
 }
.table > tbody > tr > #title{
	width: 150px;
	font-weight:bold;

}
.table > tbody > tr > #cont{
	height:500px;
}
.table{
	border-color: black;
	
}


</style>
</head>
<body>

<div class="tit-heading-wrap tit-evt">
	<h3>내용</h3>
</div> 
<br>

<div id="container">
		<table class="table table-bordered">
			<tbody>
			<tr>
				<td id="title">공지번호</td>
				<td>${vo.info_Num}</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td>${vo.info_Title}</td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td>${vo.info_Date}</td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td>${vo.info_Category}</td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td id="cont">${vo.info_Cont}</td>
			</tr>
			</tbody>
		</table>
		<div align="center">
				<c:if test="${mbr_author eq 'admin'}">
				<input type ="button" value="수정" onclick = "updateFrm()">
	 			<input type ="button" value="삭제" onclick ="deleteFrm()">
	 			</c:if>
				<input type="button" value="목록" onclick="listFrm()">
		</div>
	</div>

</body>
</html>
