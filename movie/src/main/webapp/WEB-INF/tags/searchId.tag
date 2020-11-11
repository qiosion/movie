<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="returnPage" required="true" %>
<form name="search" id="search" method="get" action="${returnPage}">
	<input type="hidden" name="action" value="list" />
	<input type="hidden" name="p" value="1" />
		 <select id="searchType" name="searchType">
		<option value="id">아이디</option>
	</select> <input type="text" name="keyword" id="keyword" placeholder="회원 아이디">
	<button type="submit" id="menuSearchBtn">검색</button>
</form>