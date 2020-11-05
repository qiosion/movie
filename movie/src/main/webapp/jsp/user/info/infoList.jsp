<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.cbox.common.Paging" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<html>
<head>
    <title>전체 게시글</title>
    <link rel="stylesheet" href="../css/info.css">
    <script>
    function writeForm(){
        location.href="infoWriteForm.do"; //글쓰기 버튼 클릭시 작성화면으로 이동
    }
    </script>
</head>
<body> 
<div class="tit-heading-wrap tit-evt">
<h3>공지사항/이벤트</h3>
</div>   
<br>
 
<div id="wrap">
	<div align="right">
        <form id="searchFrm" name="searchFrm">
            <select name="opt">
                <option value="제목">제목</option>
                <option value="내용">내용</option>
                <option value="제목+내용">제목+내용</option>
            </select>
            <input type="text" size="20" />&nbsp;
            <input name ="info_Title" type="submit" value="검색"/>
        </form>    
    </div>
    <br/>
    <div  align="center">
        <table class="tb-style">
            <tr height="30">
                <td>공지번호</td>
                <td>제목</td>
                <td>카테고리</td>
                <td>작성일</td>
                <td>조회수</td>
            </tr>
            <c:forEach var="info" items="${infoList}"> 
            <tr>
                <td>${info.info_Num}</td>
                <td><a href="DetailView.do?info_Num=${info.info_Num}">${info.info_Title}</a></td>
                <td>${info.info_Category}</td>
                <td>${info.info_Date}</td>
                <td>${info.info_Chk}</td>
            </tr>
            </c:forEach>   
        </table>
    </div>
   <c:if test="${mbr_author eq 'admin'}">
	 <div align="right" id="topForm">
         <input type="button" value="글등록" onclick="writeForm()">
    </div>
    </c:if>
   
    <script>
	function goPage(p){
    		//location.href="infoList.do?="+p;
		searchFrm.p.value = p;
		searchFrm.submit();
    	}
    </script>
    
    <my:paging paging="${paging}" jsfunc="goPage"></my:paging>
</div>    
 
</body>
</html>

