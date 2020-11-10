<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
.txt {
	text-align: right;
}
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
</style>
<script type="text/javascript">
	function formCheck() {
		var frm = document.frm;
		if (frm.mbr_id.value == "") {
			alert("사용자 아이디를 입력하세요");
			frm.mbr_id.focus();
			return false;
		}
		if (frm.mbr_pw.value == "") {
			alert("비밀번호를 입력하세요");
			frm.mbr_pw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form class="frm" id="frm" name="frm" action="login.do" method="post" style="margin:auto; padding: 20px; max-width: 70%; margin-bottom: 10px;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>로그인
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디"></td>
							</tr>
							<tr>
								<td class="txt">비밀번호</td>
								<td><input type="password" class="form-control" id="mbr_pw" name="mbr_pw" placeholder="비밀번호"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="submit" class="btn btn-success" onclick="return formCheck()" style="margin-right: 30px;">로그인</button>
			<button type="button" class="btn btn-dark" onclick="location.href='searchidpwForm.do'" style="margin-right: 30px;">ID/패스워드 찾기</button>
			<button type="button" class="btn btn-danger" onclick="location.href='memberForm.do'">회원가입</button>
		</div>
	</form>
	<%
	// id, pw 틀리면 화면에 메세지 출력
		String msg = request.getParameter("msg");
		if(msg!=null && msg.equals("0")) {
			out.println("<br>");
			out.println("<font color='red' size='5' align='center'>비밀번호를 확인해 주세요.</font>");
		} else if(msg!=null && msg.equals("-1")) {    
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
	%>
</body>
</html>