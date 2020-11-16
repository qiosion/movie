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
	location.href="QnAReplyForm.do?qa_no=${vo.qa_no}";
}
function deleteFrm(){
	location.href="QnADelete.do?qa_no=${vo.qa_no}";
}
	
</script>
<style>
.txt {
	font-size: 20px;
	font-weight: bolder;
	width: 20%;
}
#qa_cont {
	height:400px;
	font-size: 15px;
}

</style>
</head>
<body>

<div class="tit-heading-wrap tit-evt">
	<h3>내용</h3>
</div> 
<br>

	<div class="col-sm-12 pt-3">
		<div class="card">
			<div class="card-header card-header-primary">
				<span class="card-title" id="title"> <i class="fas fa-square"></i>${vo.qa_title}
				</span>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table">
						<tr style="line-height: 32px;">
							<td class="txt">글번호</td>
							<td><label id="qa_no">${vo.qa_no}</label></td>
						</tr>
						<tr>
							<td class="txt">문의유형</td>
							<td><label id="qa_type">${vo.qa_type}</label></td>
						</tr>
						<tr>
							<td class="txt">날짜</td>
							<td><label id="qa_date">${vo.qa_date}</label></td>
						</tr>
						<tr>
							<td class="txt">내용</td>
							<td><label id="qa_cont">${vo.qa_cont}</label></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="tit-heading-wrap tit-evt">
		<h3>답변</h3>
	</div>
	<div class="col-sm-12 pt-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<td class="txt">작성자</td>
						<td>${vo.qa_ad_name}</td>
					</tr>
					<tr>
						<td class="txt">내용</td>
						<td id="qa_cont">${vo.qa_ad_comment}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="text-center mt-3">
				<c:if test="${mbr_author eq 'admin'}">
	 				<button id="btn" type="button" class="btn btn-success" onclick ="replyFrm()">답변달기</button>
	 				<button id="btn" type="button" class="btn btn-danger" onclick ="deleteFrm()">삭제</button>
	 			</c:if>
					<button id="btn" type="button" class="btn btn-dark" onclick="listFrm()">목록</button>
		</div>
		
</body>
</html>
