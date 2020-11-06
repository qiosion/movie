<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>게시판 - 글쓰기</title>
<link rel="stylesheet" href="/css/info.css">
<script>
	function listFrm(){
		location.href="infoList.do";
	}
	function addFrm(){
		var ad = document.frm;
		
		if(ad.info_Title.value == ""){
			alert("제목을 입력하세요");
			ad.info_Title.focus();
			return false;
		}
		if(ad.info_Date.value == ""){
			alert("날짜를 입력하세요");
			ad.info_Date.focus();
			return false;
		}
		if(ad.info_Cont.value == ""){
			alert("내용을 입력하세요");
			ad.info_Cont.focus();
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
	<form name="frm" id="frm" method="post" action="infoInsert.do"  >
		<table width="700" border="3" bordercolor="lightgray" align="center">
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
			</table>
		<div align="center" colspan="3">
				<button id="btn" type="reset">내용삭제</button> 
				<button id="btn" type="submit" onclick="return addFrm()">등록</button>
				<button id="btn" type="submit" onclick="listFrm()">작성취소</button>
		</div>
	</form>

</body>
</html>
