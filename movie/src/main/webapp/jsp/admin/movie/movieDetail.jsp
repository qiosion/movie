<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="info" class="info">
		<div id="infoR">
			<img src="${pageContext.request.contextPath}/images/${vo.mvPost}">
			<div class="btnGrpDiv">
				<a href="#" class="updateBtn">수정</a>
				<a href="mvList.do" class="listBtn">목록</a>
				<!-- todo -->
			</div>
		</div>
		<div id="infoL">
			<p class="title">${vo.mvTitle}</p>
			<p>${vo.mvCont}</p>
			<p style="align: bottom;">${vo.mvRank}</p>
		</div>
	</div>
</body>
</html>