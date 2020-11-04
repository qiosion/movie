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

	
</script>
</head>
<body>
   		<form method="post" action="infoUpdate.do">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">공지번호</td>
				<td><input type="text" name="info_Num" value="${vo.info_Num}"></td>
			</tr>
			<tr>
				<td id="title" >제목</td>
				<td><input name="info_Title" type="text" size="70" maxlength="100" 
                    value="${vo.info_Title}"/>
                </td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td><input name="info_Date" type="text" size="70" maxlength="100" 
                    value="${vo.info_Date}">
                </td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td><select name="info_Category">
						<option value="0">공지사항</option>
						<option value="1">이벤트</option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="info_Cont" cols="68" rows="20">
                   ${vo.info_Cont}
                </textarea> 
				</td>
				

				
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5">
				<input type ="submit" value="수정">
				<input type="button" value="목록" onclick="listFrm()">
				</td>
			</tr>
		</table>
		</form>

</body>
</html>
