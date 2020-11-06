<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cbox.member.dao.MemberDAO" %>
<%@ page import="com.cbox.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idChk.jsp</title>
</head>
<body>
<%
	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	String id = request.getParameter("mbr_id");	
	int cnt = dao.idC(id);
	if (cnt == 0) {
		out.println("<p>사용가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply'");
	}
%>
</body>
</html>