<%@ tag language="java" pageEncoding="UTF-8"%>
<form name="search" id="search" method="get" action="movieList.do">
	<select id="searchType" name="searchType">
		<option value="title">제목</option>
	</select> <input type="text" name="keyword" id="keyword" placeholder="영화 제목">
	<button type="submit" onclick="return formCheck()">검색</button>
</form>
<script>
	function formCheck() {
		var frm = document.search;
		if (frm.keyword.value == "") {
			alert("검색어를 입력해주세요.");
			return;	// todo 자기 페이지 그대로 있기
		}
		/* form.submit(); */
	}
</script>