<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.cbox.common.Paging" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<html>
<head>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>전체 게시글</title>
<link rel="stylesheet" href="/css/info.css">
    <script>
    function writeForm(){
        location.href="infoWriteForm.do"; //글쓰기 버튼 클릭시 작성화면으로 이동
    }
    </script>
    <script>
    //쿠키설정    
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + '=' + escape(value) + '; path=/; expires='
				+ todayDate.toGMTString() + ';'
	}

	//쿠키 불러오기
	function getCookie(name) {
		var obj = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + obj.length);
			if (document.cookie.substring(x, y) == obj) {
				if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	//닫기 버튼 클릭시
	function closeWin(key) {
		if ($("#todaycloseyn").prop("checked")) {
			setCookie('divpop' + key, 'Y', 1);
		}
		$("#divpop" + key + "").hide();
	}
	$(function() {
		if (getCookie("divpop1") != "Y") {
			$("#divpop1").show();
		}
	});
</script>
    
 <style>
 
  .divpop {
      position: absolute; 
      z-index:500; 
      top:20px; 
      left:60px;
      width:280px; 
      height:413px; 
      border:1px solid black;
      background-color:white;display:none;
  }
  .title_area {
  font-weight:bold;
  text-align:center;
  width:100%;
  }
  .button_area {
  position:absolute;
  bottom:0;
  left:80px;
  
  } 
  
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
 
 
 #paging{
 	text-align: center;
 	
 }
</style>
</head>
<body> 
<div class="tit-heading-wrap tit-evt">
<h3>공지사항/이벤트</h3>
</div>   
<br>
 
<div id="container">
    <br/>
    <div  align="center">
        <table class="table table-hover">
        	<thead>
            	<tr height="30">
                	<td>공지번호</td>
                	<td>제목</td>
                	<td>카테고리</td>
                	<td>작성일</td>
                	<td>조회수</td>
           		</tr>
            </thead>
            <tbody>
            	<c:forEach var="info" items="${infoList}"> 
            	<tr>
                	<td>${info.info_Num}</td>
                	<td id="td1"><a href="DetailView.do?info_Num=${info.info_Num}">${info.info_Title}</a></td>
                	<td>${info.info_Category}</td>
                	<td>${info.info_Date}</td>
                	<td>${info.info_Chk}</td>
            	</tr>
            	</c:forEach>
            </tbody>   
        </table>
    </div>
   <c:if test="${mbr_author eq 'admin'}">
	 <div align="right" id="topForm">
         <button id="btn" class="btn btn-danger" type="button" onclick="writeForm()">글등록</button>
    </div>
    </c:if>
   
    <script>
	function goPage(p){
    		location.href="infoList.do?p="+p;
    	}
    </script>
    
    <div id="paging">
    <my:paging paging="${paging}" jsfunc="goPage"></my:paging>
	</div>
</div>

<form name="notice_form">
		<div id="divpop1" class="divpop">
			<div class="title_area">공지사항/이벤트</div>
			<div style="text-align:center">
				<a href="http://www.cgv.co.kr/culture-event/event/detailviewunited.aspx?seq=30029">
				<img alt="" height="280" src="http://img.cgv.co.kr/Event/cultureplexPhoto/15693148655180.jpg" width="280" style="width: 100%; height: 100%;">
				</a>
			</div>
			<div class="button_area">
				<input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>오늘 하루 이 창을 열지 않음
				<a href='#' onclick="javascript:closeWin(1);"><B>[닫기]</B>
				</a>
			</div>
		</div>
	</form>    
 
</body>
</html>

