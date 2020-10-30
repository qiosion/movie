<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
    <title>전체 게시글</title>
    <link rel="stylesheet" href="/css/info.css">
    
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
    <form action="infoList.do" method="post">
    <div align="center" id="info" >
        <table id="bList" width="800" border="3" bordercolor="black">
            <tr height="30">
                <td>공지번호</td>
                <td>카테고리</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일</td>
                <td>조회수</td>
            </tr>
            <c:forEach var="info" items="${infoList}"> 
            <tr>
                <td>${info.infoNum}</td>
                <td>${info.infoCategory}</td>
                <td>${info.infoTitle}</td>
                <td>${info.infoDate}</td>
                <td>${info.infoChk}</td>
                <td>${info.infoCont}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    </form>
    <br>
    <div align="center">
        	<a href="#" type="submit">1</a>
        	<a href="#" type="submit">2</a>
     </div>
    <br>
</div>    
 
</body>
</html>

