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
	}
	function addFrm(){
		var ad = document.frm;
		
		if(ad.qa_title.value == ""){
			alert("제목을 입력하세요");
			ad.qa_title.focus();
			return false;
		}
		if(ad.qa_cont.value == ""){
			alert("내용을 입력하세요");
			ad.qa_cont.focus();
			return false;
		}
		return true;
	}
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
	<form name="frm" id="frm" method="post" action="QnAInsert.do"  >
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">제목</td>
				<td><input name="qa_title" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">작성자</td>
				<td><input name="qa_name" type="text" size="70"
					maxlength="100" value="${mbr_id}" /></td>
			</tr>
			<tr>
				<td id="title">문의유형</td>
				<td><select name="qa_type">
						<option value="예매/매표">예매/매표</option>
						<option value="할인혜택">할인혜택<option>
						<option value="영화관이용">영화관이용<option>
						<option value="홈페이지">홈페이지<option>
						<option value="결제수단">결제수단<option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="qa_cont" cols="70" rows="10"></textarea>
				</td>
			</tr>
			</table>
		<div align="center" colspan="2"> 
				<button id="btn" type="submit" onclick="return addFrm()">등록</button>
				<button id="btn" type="submit" onclick="listFrm()">작성취소</button>
		</div>
	</form>

</body>
</html>
