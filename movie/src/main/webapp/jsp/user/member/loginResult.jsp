<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<c:if test="${ vo.mbr_id eq null || vo.mbr_pw eq null}">
	<h1>${ vo.mbr_id }님 로그인에 실패하였습니다.</h1>
</c:if>
<c:if test="${ vo.mbr_id ne null && vo.mbr_pw ne null}">
	<h1>${ vo.mbr_id }님 안녕하세요.</h1>
</c:if>
</body>
</html>