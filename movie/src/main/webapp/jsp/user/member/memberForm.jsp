<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		if(f.mbr_phone.value == "") {
			alert ("전화번호를 입력하세요");
			f.mbr_phone.focus();
			return false;
		}
	return true;
	}
</script>
</head>
<body>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="memberInsert.do" method="post">
		<div class="form-group">
   	 		<label for="mbr_id">아이디</label>
    		<input type="text" class="form-control" id="mbr_id" name="mbr_id" placeholder="아이디">
    		<input type="button" id="idchk" value="중복확인">
  		</div>
		<div class="form-group">
    		<label for="mbr_pw">비밀번호</label>
    		<input type="password" class="form-control pw" id="mbr_pw" name="mbr_pw" placeholder="비밀번호">
		</div>
		<div class="form-group">
    		<label for="mbr_pw">비밀번호 확인</label>
    		<input type="password" class="form-control pw" id="mbr_pw2" name="mbr_pw2" placeholder="비밀번호 확인">
    		<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    		<span id="alert-fail" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
		</div>
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
  		<div class="form-group">
    		<label for="mbr_nm">이름</label>
    		<input type="text" class="form-control" id="mbr_nm" name="mbr_nm" placeholder="이름">
		</div>
		<div class="form-group">
    		<label for="mbr_birth">생년월일</label>
    		<input type="date" class="form-control" id="mbr_birth" name="mbr_birth">
		</div>
		<div class="form-group">
    		<label for="mbr_phone">전화번호</label>
    		<input type="text" class="form-control" id="mbr_phone" name="mbr_phone" placeholder="-없이 입력">
		</div>
		<div class="form-group">
    		<label for="mbr_email">이메일</label>
    		<input type="email" class="form-control" id="mbr_email" name="mbr_email" placeholder="abc@example.com">
		</div>
		<script type="text/javascript">
// 현재 체크박스 체크 여부		
			if ($("#mbr_e_yn").prop("checked", true)){
				$("#mbr_e_yn").attr("value", "y");
			} else {
				$("#mbr_e_yn").attr("value", "n");
			}
		</script>
		<div class="form-group form-check">
    		<input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn">
    		<label class="form-check-label" for="mbr_e_yn">이메일 광고 수신여부</label>
		</div>
		
    	<button type="submit" class="btn btn-primary" onclick="return formCheck()">회원가입</button>
		<button type="reset" class="btn btn-primary">취소</button>		
	</form>
</div>
</body>
</html>