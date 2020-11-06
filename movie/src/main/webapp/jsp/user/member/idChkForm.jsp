<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idChkForm.jsp</title>
<script type="text/javascript">
	function nullChk(f) {
		var mbr_id = f.mbr_id.value;
		mbr_id = mbr_id.trim();
		if (mbr_id.length < 3) {
			alert ("아이디는 3글자 이상 입력해주십시오");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="jsp/user/member/idChk.jsp" method="post" onsubmit="return nullChk(this)">
		<input type="text" name="mbr_id" id="mbr_id" placeholder="아이디를 입력하세요" autofocus >
		<input type="submit" name="chkBtn" id="chkBtn" value="중복확인">
	</form>
</div>
</body>
</html>