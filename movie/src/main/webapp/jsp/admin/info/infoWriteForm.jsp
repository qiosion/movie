<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="/css/info.css">
<script>
	function listFrm(){
		location.href="infoList.do";
	}
</script>
</head>
<body>
	<form method="post" action="infoInsert.do" name="infoForm" >
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">공지번호</td>
				<td><input name="info_Num" type="text" value=""></td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td><input name="info_Title" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td><input name="info_Date" type="date" value=""></td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td><select name="info_Category">
						<option value="공지사항">공지사항</option>
						<option value="이벤트">이벤트</option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="info_Cont" cols="70" rows="10"></textarea>
				</td>
			</tr>
			
			<div align="center">
			<tr>
				<td colspan="5">
				<input type="reset" value="내용지우기"> 
				<input type="submit" value="등록">
				<input type="button" value="작성취소" onclick="listFrm()">
				</td>
			</tr>
			</div>
		</table>
	</form>

</body>
</html>
