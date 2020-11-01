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
<jsp:include page="${pageContext.request.contextPath}/main.jsp"></jsp:include>
<c:if test="${ vo.getMbr_id eq null }">
	<h1>${ vo.getMbr_id }님 로그인에 실패하였습니다.</h1>
</c:if>
<c:if test="${ vo.getMbr_id ne null }">
	<!-- vo가 가진 name 변수가 null값이 아니면 (not equal) -->
	<h1>${ vo.getMbr_id }님 안녕하세요.</h1>
</c:if>
</body>
</html>