<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="memberForm.do" method="post">
		<div class="form-group">
   	 		<label for="mbr_id">아이디</label>
    		<input type="text" class="form-control" id="mbr_id" name="mbr_id">
  		</div>
		<div class="form-group">
    		<label for="mbr_pw">비밀번호</label>
    		<input type="password" class="form-control" id="mbr_pw" name="mbr_pw">
		</div>
		<div class="form-group">
    		<label for="mbr_pw">비밀번호 확인</label>
    		<input type="password" class="form-control" id="mbr_pw2" name="mbr_pw2">
		</div>
  		<div class="form-group">
    		<label for="mbr_nm">이름</label>
    		<input type="text" class="form-control" id="mbr_nm" name="mbr_nm">
		</div>
		<div class="form-group">
    		<label for="mbr_birth">생년월일</label>
    		<input type="date" class="form-control" id="mbr_birth" name="mbr_birth">
		</div>
		<div class="form-group">
    		<label for="mbr_phone">전화번호</label>
    		<input type="tel" class="form-control" id="mbr_phone" name="mbr_phone">
		</div>
		<div class="form-group">
    		<label for="mbr_email">이메일</label>
    		<input type="email" class="form-control" id="mbr_email" name="mbr_email">
		</div>  
		<div class="form-group form-check">
    		<input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn">
    		<label class="form-check-label" for="mbr_e_yn">이메일 광고 수신여부</label>
		</div>
    	<button type="submit" class="btn btn-primary">회원가입</button>
		<button type="reset" class="btn btn-primary">취소</button>		
	</form>
</div>
</body>
</html>