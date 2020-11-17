<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시판 - 글쓰기</title>
<script>
function listFrm(){
	location.href="infoList.do";
}
function updateFrm(){
	alert("수정이 완료되었습니다.")
	location.href="infoList.do"
}


</script>
<style>
/* #btn {
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
} */
input[type='text'], input[type='password'], select {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
input[type='date'] {
	height: calc(1.5em + .75rem + 2px) !important;
}
</style>
</head>
<body>
<!-- <div class="tit-heading-wrap tit-evt">
<h3>글수정</h3>
</div> 
<br>
<div> -->
   	<form id="frm" name="frm" method="post" action="infoUpdate.do">
<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>공지사항 수정
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
		<table class="table" width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">공지번호</td>
				<td><input type="text" name="info_Num" value="${vo.info_Num}" class="form-control" readonly></td>
			</tr>
			<tr>
				<td id="title" >제목</td>
				<td><input name="info_Title" type="text" size="70" maxlength="100" 
                    class="form-control" value="${vo.info_Title}"/>
                </td>
			</tr>
			<tr>
				<td id="title">날짜</td>
				<td><input name="info_Date" type="date" size="70" maxlength="100" 
                    value="${vo.info_Date}" class="form-control" readonly>
                </td>
			</tr>
			<tr>
				<td id="title">카테고리</td>
				<td><select name="info_Category" class="form-control">
						<option value="공지사항">공지사항</option>
						<option value="이벤트">이벤트</option>
				</select></td>
				
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="info_Cont" cols="68" rows="20" class="form-control">
                   ${vo.info_Cont}
                </textarea> 
				</td>			
			</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
				<button id="btn" type="submit" class="btn btn-success" style="margin-right: 30px;" onclick="updateFrm()">수정</button>
				<button id="btn" type="button" onclick="listFrm()" class="btn btn-dark">목록</button>
		</div>
	</form>
</div>
</body>
</html>
