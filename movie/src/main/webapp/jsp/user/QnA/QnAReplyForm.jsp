
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="/css/info.css">
<script>
	function listFrm(){
		location.href="QnAListForm.do";
</script>
<style>
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
</style>
</head>
<body>
	<form name="frm" id="frm" method="post" action="QnAReply.do"  >
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">제목</td>
				<td><input name="qa_title" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td><input name="qa_date" type="date" value=""></td>
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="qa_cont" cols="70" rows="10"></textarea>
				</td>
			</tr>
			</table>
		<div align="center" colspan="2"> 
				<button id="btn" type="submit">등록</button>
				<button id="btn" type="submit" onclick="listFrm()">작성취소</button>
		</div>
	</form>

</body>
</html>
