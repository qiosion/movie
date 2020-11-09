<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	function formCheck(){
		var f = document.frm;
		if(f.mbr_id.value == "") {
			alert ("아이디를 입력하세요");
			f.mbr_id.focus();
			return false;
		}
		if(f.mbr_pw.value == "") {
			alert ("비밀번호를 입력하세요");
			f.mbr_pw.focus();
			return false;
		}
		if(f.mbr_nm.value == "") {
			alert ("이름 입력하세요");
			f.mbr_nm.focus();
			return false;
		}
		if(f.mbr_birth.value == "") {
			alert ("생년월일을 선택하세요");
			f.mbr_birth.focus();
			return false;
		}
		if(isNaN(f.mbr_phone.value)) {
			alert ("전화번호는 숫자만 입력가능합니다");
			f.mbr_phone.focus();
			return false;
		}
		if(f.mbr_phone.value == "") {
			alert ("전화번호를 입력하세요");
			f.mbr_phone.focus();
			return false;
		}
	return true;
	}
	function IdCheck() {
		if($("#mbr_id").val() == "") {
			alert ("아이디를 입력하세요");
			return;
		}
		var url = "idChk.do?mbr_id=" + $("#mbr_id").val(); 
		open(url,"idchk","width=400, height=350");
	}
</script>
</head>
<body>
	<form class="frm" id="frm" name="frm" action="memberInsert.do" method="post" style="padding: 20px; max-width: 70%; margin-bottom: 10px;">
		<div class="col-sm-12 pt-3"><!-- class="form-group" -->
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>회원 가입
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디&nbsp;<span style="color: red;">*</span></td>
								<td><input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디"></td>
    							<td><input type="button" id="idchk" class="btn btn-primary btn-sm" value="중복확인" onclick="IdCheck()"></td>
    		<!-- <input type="button" id="idchk" class="btn btn-danger btn-sm" value="중복확인" onclick="IdCheck(this.form)"> -->
    		<!-- <input type="hidden" id="idDuplication" name="idDuplication" value="idUncheck"> -->
  							</tr>
  							<tr>
  								<td class="txt">비밀번호&nbsp;<span style="color: red;">*</span></td>
  								<td colspan="2"><input type="password" class="form-control pw" id="mbr_pw" name="mbr_pw" placeholder="비밀번호"></td>
  							</tr>
  							<tr>
  								<td class="txt">비밀번호 확인&nbsp;<span style="color: red;">*</span></td>
    							<td colspan="2"><input type="password" class="form-control pw" id="mbr_pw2" name="mbr_pw2" placeholder="비밀번호 확인"></td>
    						</tr>
    						<tr>
    							<td colspan="3">
    								<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    								<span id="alert-fail" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
    							</td>
							</tr>
<script>
	$('.pw').focusout(function(){
		var pw1 = $("#mbr_pw").val();
		var pw2 = $("#mbr_pw2").val();
				
		if (pw1 != "" && pw2 == ""){
			null;
		} else if (pw1 != "" || pw2 != ""){
			if(pw1 == pw2) {
				$("#alert-success").css("display","inline-block");
				$("#alert-fail").css("display","none");
			} else{
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요");
				$("#alert-success").css("display","none");
				$("#alert-fail").css("display","inline-block");
			}
		}
	});
</script>
							<tr>
  								<td class="txt">이름&nbsp;<span style="color: red;">*</span></td>
  								<td colspan="2"><input type="text" class="form-control" id="mbr_nm" name="mbr_nm" placeholder="이름"></td>
  							</tr>
  							<tr>
  								<td class="txt">생년월일&nbsp;<span style="color: red;">*</span></td>
  								<td colspan="2"><input type="date" class="form-control" id="mbr_birth" name="mbr_birth"></td>
  							</tr>
  							<tr>
  								<td class="txt">전화번호&nbsp;<span style="color: red;">*</span></td>
  								<td colspan="2"><input type="text" class="form-control" id="mbr_phone" name="mbr_phone" placeholder="-없이 입력"></td>
  							</tr>
  							<tr>
  								<td class="txt">이메일&nbsp;<span style="color: red;">*</span></td>
  								<td colspan="2"><input type="email" class="form-control" id="mbr_email" name="mbr_email" placeholder="abc@example.com"></td>
  							</tr>
    						<tr>
    							<td class="txt">이메일 광고 수신여부</td>
		    					<td colspan="2"><input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn"></td>
    						</tr>
<script type="text/javascript">
// 현재 체크박스 체크 여부		
	var chk = $("input[id='mbr_e_yn']:checked");
	if (chk) {
		$("#mbr_e_yn").val("y");
	} else {
		$("#mbr_e_yn").val("n");
	}
</script>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
    		<button type="submit" class="btn btn-success" onclick="return formCheck()"  style="margin-right: 30px;">회원가입</button>
			<button type="reset" class="btn btn-danger" style="margin-right: 30px;">취소</button>
		</div>
	</form>
</body>
</html>