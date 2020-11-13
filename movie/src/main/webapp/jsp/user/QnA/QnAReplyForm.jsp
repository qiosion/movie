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
	location.href="QnAReply.do?qa_no=${vo.qa_no}";
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
<form method="post" action="QnAReply.do">
<div id="container">
		<table class="table table-bordered">
			<tbody>
			<tr>
				<td id="title">글번호</td>
				<td><input text="text" name="qa_no" value="${vo.qa_no}" readonly></td>
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
				<button id="btn" type="submit" onclick="listFrm()">목록</button>
		</div>
	</div>
		<table class="table table-bordered">
		<tbody>
			<tr>
				<td id="title">작성자</td>
				<td><input type="text" name="qa_ad_name" value="${mbr_nm}"></td>
			</tr>
			<tr>
			<td id="title">내용</td>
			<td id="cont"><textarea name="qa_ad_comment" cols="68" rows="20" class="form-control">
                   ${vo.qa_ad_comment}
                </textarea> </td>
			</tr>
		</tbody>
	</table>
	<div>
		<button id="btn" type="submit" class="btn btn-success" style="margin-right: 30px;">답변</button>
	</div>
	</form>
	


</body>
</html>
