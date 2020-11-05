<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<c:if test="${pwnull ne null}">
	<script> alert("비밀번호를 입력하세요");</script>
</c:if>
<c:if test="${pwwrong ne null}">
	<script>alert("비밀번호가 틀렸습니다");</script>
</c:if>
<div class="divform">
	<form class="frm" id="frm" name="frm" action="memberUpdate.do" method="post">
		<div class="form-group">
   	 		<label for="mbr_id">아이디</label>
    		<input type="text" value="${ myPage.mbr_id }" readonly>
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
// 비밀번호 확인
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
    		<input type="text" value="${ myPage.mbr_nm }" readonly>
		</div>
		<div class="form-group">
    		<label for="mbr_birth">생년월일</label>
    		<input type="text" value="${ myPage.mbr_birth }" readonly>
		</div>
		<div class="form-group">
    		<label for="mbr_phone">전화번호</label>
    		<input type="text" class="form-control" id="mbr_phone" name="mbr_phone" value="${ myPage.mbr_nm }">
		</div>
		<div class="form-group">
    		<label for="mbr_email">이메일</label>
    		<input type="email" class="form-control" id="mbr_email" name="mbr_email" value="${ myPage.mbr_email }">
		</div>
		<div class="form-group">
    		<label for="mbr_regi_date">회원가입일</label>
    		<input type="text" value="${ myPage.mbr_regi_date }" readonly>
		</div>
		<div class="form-group">
    		<label for="mbr_point">포인트</label>
    		<input type="text" value="${ myPage.mbr_point }" readonly>
		</div>
		<script type="text/javascript">
// 회원의 기존 체크박스 체크여부
			var chk = $("#mbr_e_yn").val();
			console.log("chk: " + chk);
			if (chk == 'y'){
				$("#mbr_e_yn").prop("checked", true);
			} else {
				$("#mbr_e_yn").prop("checked", false);
			}
// 현재 체크박스 체크 여부		
			if ($("#mbr_e_yn").prop("checked", true)){
				$("#mbr_e_yn").attr("value", "y");
			} else {
				$("#mbr_e_yn").attr("value", "n");
			}
		</script>
		<div class="form-group form-check">
    		<input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn" value="${ myPage.mbr_e_yn }">
    		<label class="form-check-label" for="mbr_e_yn">이메일 광고 수신여부</label>
		</div>
		<button type="button" class="btn btn-primary" onclick="location.href='main.do'">메인으로</button>
    	<button type="submit" class="btn btn-primary" onclick="location.href='memberUpdate.do'">수정</button>
		<button type="button" class="btn btn-primary" id="memDelBtn" data-toggle="modal" data-target="#memDelPop">탈퇴</button>		
	</form>
</div>
<!-- 팝업창 -->
	<div class="modal" id="memDelPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">회원 탈퇴</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm" action="memberDelete.do" method="post">
						<div id="delete">
							<input type="text" name="pwchk" id="pwchk" placeholder="비밀번호를 입력하세요">
						</div>
						<button type="submit" name="confirmDel" id="confirmDel" class="btn btn-success">탈퇴</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>