<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<!-- 아니 근데 이거.. 회원정보 그냥 보는거랑 수정하는거랑 2개를 만들어야하는거야 뭐야?? ㅠㅠ -->
	<div align="center">
		<div>
		 <!-- vo 객체이름 그대로 넣어줘야함 -->
<%-- 		<h3>아이디 : ${ vo.id }</h3>
		<h3>성   명 : ${ vo.name }</h3>
		<h3>주   소 : ${ vo.address }</h3>
		<h3>전화번호 : ${ vo.tel }</h3>
		<h3>가입일자 : ${ vo.enterdate }</h3>
		<h3>사용자권한 : ${ vo.author }</h3>

이거처럼 vo만들어서 각 td안에 넣어주면 되는가..
아 근데 리스트나 attribute 를 이름 vo 말고selectedMember 해서 해....
--%>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="memberInfo.do" method="post">
		<div class="form-group">
   	 		<label for="mbr_id">아이디</label>
    		<input type="text" value="${ selectedMember.mbr_id }" readonly>
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
    		<input type="text" value="${ selectedMember.mbr_nm }" readonly>
		</div>
		<div class="form-group">
    		<label for="mbr_birth">생년월일</label>
    		<input type="text" value="${ selectedMember.mbr_birth }" readonly>
		</div>
		<div class="form-group">
    		<label for="mbr_phone">전화번호</label>
    		<input type="text" class="form-control" id="mbr_phone" name="mbr_phone" placeholder="000-0000-0000">
		</div>
		<div class="form-group">
    		<label for="mbr_email">이메일</label>
    		<input type="email" class="form-control" id="mbr_email" name="mbr_email" placeholder="abc@example.com">
		</div>  
		<div class="form-group form-check">
    		<input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn" value="y">
    		<label class="form-check-label" for="mbr_e_yn">이메일 광고 수신여부</label>
		</div>
    	<button type="submit" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-primary">탈퇴</button>		
	</form>
</div>
</body>
</html>