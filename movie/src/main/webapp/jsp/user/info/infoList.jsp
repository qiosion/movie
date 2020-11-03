<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
    <title>전체 게시글</title>
    <link rel="stylesheet" href="/css/info.css">
    <script>
    function writeForm(){
        location.href="infoWriteForm.do"; //글쓰기 버튼 클릭시 작성화면으로 이동
    }
    </script>
</head>
<body>    
 
<div id="wrap">
<div align="right" id="searchForm">
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
    </div>
    <br/>
    <div align="center">
        <table  width="800" border="3" bordercolor="black">
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
    
	 <div align="right" id="topForm">
            <input type="button" value="글등록" onclick="writeForm()">
             <input type="button" value="글삭제" onclick="deleteForm()">
    </div>
    
</div>    
 
</body>
</html>

