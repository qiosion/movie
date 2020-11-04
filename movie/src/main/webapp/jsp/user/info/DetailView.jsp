<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="css/info.css">
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
</head>
<body>
<div class="tit-heading-wrap tit-evt">
<h3>내용</h3>
</div> 
<br>
		<table border="1" width="1000" border="3" bordercolor="black" align="center">
			<tr>
				<td id="title" name=" info_Num">공지번호</td>
				<td>${vo.info_Num}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Title">제목</td>
				<td>${vo.info_Title}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Date">날짜</td>
				<td>${vo.info_Date}</td>
			</tr>
			<tr>
				<td id="title" name=" info_Category">카테고리</td>
				<td>${vo.info_Category}</td>
				
			</tr>
			<tr>
				<td id="title" name=" info_Cont">내 용</td>
				<td>${vo.info_Cont}
				</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type ="button" value="수정" onclick = "updateFrm()">
	 			<input type ="button" value="삭제" onclick ="deleteFrm()">
				<input type="button" value="목록" onclick="listFrm()">
				</td>
			</tr>
		</table>

</body>
</html>
