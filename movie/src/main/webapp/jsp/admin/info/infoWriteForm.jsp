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
	<form method="post" action="infoInsert.do" name="infoForm"
		enctype="multipart/form-data">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">공지번호</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td><input name="info_name" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">날짜</td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td><select name="opt">
						<option value="0">1</option>
						<option value="1">2</option>
						<option value="2">3</option>
						<option value="3">4</option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="info_content" cols="70" rows="10"></textarea>
				</td>
			</tr>
			

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type="reset" value="내용지우기"> 
				<input type="submit" value="등록">
				<input type="button" value="작성취소" onclick="listFrm()">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
