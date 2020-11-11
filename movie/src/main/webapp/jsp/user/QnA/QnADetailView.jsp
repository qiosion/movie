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
	location.href="QnAListForm.do";
}

function updateFrm(){
	location.href="QnAUpdateForm.do?qa_no=${vo.qa_no}";
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
#btn {
  background-color: white;
  color: black;
  border: 2px solid #555555;
  width:50px;
  height:30px;
  border-radius:10%;
}

#btn:hover {
  background-color: #555555;
  color: white;
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
				<td id="title">글번호</td>
				<td></td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td></td>
			</tr>
			<tr>
				<td id="title">문의유형</td>
				<td></td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td></td>
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td id="cont"></td>
			</tr>
			</tbody>
		</table>
		<div align="center">
				<c:if test="${mbr_author eq 'user'}">
				<button id="btn" type="submit" onclick = "updateFrm()">수정</button>
				</c:if>
				<c:if test="${mbr_author eq 'admin'}">
	 			<button id="btn" type="submit" onclick ="QnAReplyForm.do">답변달기</button>
	 			</c:if>
				<button id="btn" type="submit" onclick="listFrm()">목록</button>
		</div>
	</div>

</body>
</html>
