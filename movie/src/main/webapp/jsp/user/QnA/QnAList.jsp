<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<html>
<head>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>전체 게시글</title>
<link rel="stylesheet" href="/css/info.css">
    <script>
    function writeForm(){
        location.href="QnAWriteForm.do"; //글쓰기 버튼 클릭시 작성화면으로 이동
    }
    </script>
    
 <style>
  
 .table > thead { 
 background-color: #EDEBE1; 
 
 }
 .table > thead > tr > td{
 	text-align: center;
 	font-color: #666666;
 	font-size:large;
 	font-weight:bold;
 	border-bottom: 1px solid #ddd;
 }
 
 
 .table > tbody > tr > td{
 border-bottom: 1px solid #ddd;
 font-family: monospace;
 text-align: center;
 }
 
 .table > tbody > tr > #td1{
 	text-align: left;
 }
 
 .table > tbody > tr > td > a:hover {
  text-decoration: underline;
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

.table{
position:relative;
	bottom:110px;
}

#container{
float: left;
	width: 80%;
	position:relative;
	top:120px;
	margin:auto;
	padding: 20px;
	margin-bottom: 10px;

}
#menubar {
	float: left;
	width: 20% !important;
	position:relative;
	top:100px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#menubar li a {
  display:block;
  color: #000;
  padding: 16px 16px;
  text-decoration: none;
  border-bottom: 1px solid;
}

#menubar li a.active {
  background-color: red;
  color: white;
  font-weight: bold;
}

#menubar li a:hover:not(.active) {
  background-color: #555;
  color: white;
}  

 </style>
</head>
<body> 
<div id="menubar">
<ul>
  <li><a class="active">MY PAGE</a></li>
  <li><a href="${pageContext.request.contextPath}/memberInfo.do">회원정보</a></li>
  <li><a href="${pageContext.request.contextPath}/UserReservList.do">예매정보</a></li>
  <li><a href="${pageContext.request.contextPath}/couponForm.do">쿠폰</a></li>
  <li><a href="${pageContext.request.contextPath}/QnAListForm.do">1:1문의</a></li>
</ul>
</div>
<div class="tit-heading-wrap tit-evt">
<h3>1:1문의</h3>
</div>   
<br>

 
<div id="container">
    <br/>
    <div  align="center">
        <table class="table table-hover">
        	<thead>
            	<tr height="30">
                	<td>글번호</td>
                	<td>제목</td>
                	<td>문의유형</td>
                	<td>작성일</td>
                	<td>작성자</td>
           		</tr>
            </thead>
            <tbody>
            <c:forEach var="qa" items="${qnaList}"> 
            	<tr>
                	<td>${qa.qa_no}</td>                	
                	<td id="td1"><a href="QnADetailView.do?qa_no=${qa.qa_no}">&nbsp;${qa.qa_title}</a></td>           	            
                	<td>${qa.qa_type}</td>	
                	<td>${qa.qa_date}</td>
                	<td>${qa.qa_name}</td>
            	</tr>
            	</c:forEach>
            </tbody>   
        </table>
    </div>
   <c:if test="${mbr_author eq 'user'}">
	 <div align="right" id="topForm">
         <button id="btn" type="submit" onclick="writeForm()">글등록</button>
    </div>
    </c:if>
</div>
   
 
</body>
</html>

