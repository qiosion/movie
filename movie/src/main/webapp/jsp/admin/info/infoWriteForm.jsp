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
		if(ad.info_Num.value == ""){
			alert("공지번호를 입력하세요");
			ad.info_Num.focus();
			return false;
		}
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
		if(ad.info_Category.value == ""){
			alert("카테고리를 선택하세요");
			ad.info_Category.focus();
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
</head>
<body>
	<form name="frm" id="frm" method="post" action="infoInsert.do"  >
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
			</table>
		<div align="center" colspan="3">
				<input type="reset" value="내용지우기"> 
				<button type="submit" onclick="return addFrm()">등록</button>
				<input type="button" value="작성취소" onclick="listFrm()">
		</div>
	</form>

</body>
</html>
