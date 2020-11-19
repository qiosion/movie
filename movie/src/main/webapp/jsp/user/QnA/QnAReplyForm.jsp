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
	alert("답변작성완료")
	location.href="QnAReply.do?qa_no=${vo.qa_no}";
}
	
</script>
<style>
.table > tbody > tr > td{
 	font-color: #666666;
 	font-size:large;
 	font-weight:normal;
 	border-bottom: 1px solid black;
 	border-left-color: black;
 	
 }
.table > tbody > tr > #title{
	width: 150px;
	font-weight:bold;

}
.table > tbody > tr > #cont{
	height:500px;
}
.table{
	border-color: black;
	
}
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
}
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

<div class="tit-heading-wrap tit-evt">
	<h3>내용</h3>
</div> 
<br>
	<form method="post" action="QnAReply.do">

		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title"> <i
						class="fas fa-square"></i>Q&A답변
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table" width="700" border="3"
							bordercolor="lightgray" align="center">
							<tr>
								<td id="title">글번호</td>
								<td><input type="text" name="qa_no" value="${vo.qa_no}"class="form-control" readonly></td>
							</tr>
							<tr>
								<td id="title">제목</td>
								<td><input name="qa_title" type="text" size="70" maxlength="100" 
                    class="form-control" value="${vo.qa_title}"readonly/></td>
							</tr>
							<tr>
								<td id="title">문의유형</td>
								<td><input name="qa_type" type="text" size="70" maxlength="100" 
                    class="form-control" value="${vo.qa_type}"readonly/></td>
							</tr>
							<tr>
								<td id="title">날짜</td>
								<td><input name="qa_date" type="text" size="70" maxlength="100" 
                    class="form-control" value="${vo.qa_date}"readonly/></td>
							</tr>
							<tr>
								<td id="title">내 용</td>
								<td ><textarea name="qa_cont" cols="68" rows="20" class="form-control" readonly>
                   ${vo.qa_cont}
                </textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
<div class="tit-heading-wrap tit-evt">
	<h3>답변</h3>
</div> 
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td id="title">작성자</td>
					<td><input type="text" name="qa_ad_name" value="${mbr_nm}" readonly></td>
				</tr>
				<tr>
					<td id="title">내용</td>
					<td id="cont"><textarea name="qa_ad_comment" cols="68"
							rows="20" class="form-control">
                   ${vo.qa_ad_comment}
                </textarea></td>
				</tr>
			</tbody>
		</table>
		<div>
			<button id="btn" type="submit" onclick="replyFrm()">답변</button>
			<button id="btn" type="submit" onclick="listFrm()">목록</button>
		</div>
	</form>



</body>
</html>
