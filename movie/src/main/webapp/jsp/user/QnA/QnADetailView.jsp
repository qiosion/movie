<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


function replyFrm(){
	location.href="QnAReplyForm.do?qa_no=${vo.qa_no}";
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
				<td>${vo.qa_no}</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td>${vo.qa_title}</td>
			</tr>
			<tr>
				<td id="title">문의유형</td>
				<td>${vo.qa_type}</td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td>${vo.qa_date}</td>
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td id="cont">${vo.qa_cont}</td>
			</tr>
			</tbody>
		</table>
		<div align="center">
				<c:if test="${mbr_author eq 'admin'}">
	 			<button id="btn" type="submit" onclick ="replyFrm()">답변달기</button>
	 			</c:if>
				<button id="btn" type="submit" onclick="listFrm()">목록</button>
		</div>
	</div>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td id="title">작성자</td>		
					<td>${vo.qa_ad_name}</td>
			</tr>
			<tr>
			<td id="title">내용</td>
			<td id="cont">${vo.qa_ad_comment}</td>
			</tr>
		</tbody>
	</table>
		
</body>
</html>
