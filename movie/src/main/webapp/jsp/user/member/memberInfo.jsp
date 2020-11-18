<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style type="text/css">
.txt {
	text-align: right;
}
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
.col-sm-12 {
	position:relative;
	bottom:110px;
}
/* @media screen and (max-width: 800px) {
	#frm,
	#menubar {
                width: 100%;
                padding: 0;
            }
        } */
#frm {
	float: left;
	width: 80%;
	position:relative;
	top:120px;
	margin:auto;
	padding: 20px;
	margin-bottom: 10px;
}  
#menubar {
	float: left;
	width: 20% !important;
	position:relative;
	top:120px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#menubar li a {
  display:block;
  color: #000;
  padding: 16px 16px;
  text-decoration: none;
  border-bottom: 1px solid;
}

#menubar li a.active {
  background-color: red;
  color: white;
  font-weight: bold;
}

#menubar li a:hover:not(.active) {
  background-color: #555;
  color: white;
}   

</style>
<script type="text/javascript">
	function formCheck(){
		var f = document.frm;
 		if(f.mbr_pw.value == "") {
			alert ("비밀번호를 입력하세요");
			f.mbr_pw.focus();
			return false;
		}
		if(isNaN(f.mbr_phone.value)) {
			alert ("전화번호는 숫자만 입력가능합니다");
			f.mbr_phone.focus();
			return false;
		}
	return true;
	}
</script>
</head>
<body>
<div id="menubar">
<ul>
  <li><a class="active">MY PAGE</a></li>
  <li><a href="${pageContext.request.contextPath}/memberInfo.do">회원정보</a></li>
  <li><a href="${pageContext.request.contextPath}/UserReservList.do">예매정보</a></li>
  <li><a href="${pageContext.request.contextPath}/couponForm.do">쿠폰</a></li>
  <li><a href="${pageContext.request.contextPath}/QnAListForm.do">1:1문의</a></li>

</ul>
</div>
<!-- 회원탈퇴 -->
<c:if test="${pwnull ne null}">
	<script> alert("비밀번호를 입력하세요");</script>
</c:if>
<c:if test="${pwwrong ne null}">
	<script>alert("비밀번호가 틀렸습니다");</script>
</c:if>
	<form class="frm" id="frm" name="frm" action="memberUpdate.do" method="post" style="max-width: 70%;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="title">
					<i class="fas fa-square"></i>회원 정보
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td class="txt">아이디</td>
								<td><input type="text" value="${ myPage.mbr_id }" readonly></td>
							</tr>
							<tr>
								<td class="txt">비밀번호&nbsp;<span style="color: red;">*</span></td>
								<td><input type="password" class="form-control pw" id="mbr_pw" name="mbr_pw" placeholder="비밀번호"></td>
							</tr>
							<tr>
								<td class="txt">비밀번호 확인&nbsp;<span style="color: red;">*</span></td>
								<td><input type="password" class="form-control pw" id="mbr_pw2" name="mbr_pw2" placeholder="비밀번호 확인"></td>
							</tr>
							<tr><td colspan="2">	
								<span id="alert-success"  style="display: none; color: #0B8026; font-weight: bold;">비밀번호가 일치합니다.</span>
    							<span id="alert-fail" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
							</td></tr>
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
							<tr>
								<td class="txt">이름</td>
								<td><input type="text" value="${ myPage.mbr_nm }" class="form-control" readonly></td>
							</tr>
							<tr>
								<td class="txt">생년월일</td>
								<td><input type="text" value="${ myPage.mbr_birth }" class="form-control" readonly></td>
							</tr>
							<tr>
								<td class="txt">전화번호</td>
								<td><input type="text" class="form-control" id="mbr_phone" name="mbr_phone" value="${ myPage.mbr_phone }"></td>
							</tr>
							<tr>
								<td class="txt">이메일</td>
								<td><input type="email" class="form-control" id="mbr_email" name="mbr_email" value="${ myPage.mbr_email }"></td>
							</tr>
							<tr>
								<td class="txt">회원가입일</td>
								<td><input type="text" value="${ myPage.mbr_regi_date }" class="form-control" readonly></td>
							</tr>
							<tr>
								<td class="txt">포인트</td>
								<td><input type="text" value="${ myPage.mbr_point }" class="form-control" readonly></td>
							</tr>
							<tr>
    							<td class="txt">이메일 광고 수신여부</td>
		    					<td colspan="2"><input type="checkbox" class="form-check-input" id="mbr_e_yn" name="mbr_e_yn" value="${ myPage.mbr_e_yn }"></td>
    						</tr>
<script type="text/javascript">
	var chk = $("input[id='mbr_e_yn']:checked");
	if (chk) {
		$("#mbr_e_yn").val("y");
	} else {
		$("#mbr_e_yn").val("n");
	}
	var nowchk = "${ myPage.mbr_e_yn }";
		if (nowchk == "y"){
			$("#mbr_e_yn").attr("checked", true);
		} else {
			$("#mbr_e_yn").attr("checked", false);
		}
</script>
						</table>
					</div>
				</div>
			</div>
			<div class="text-center mt-3">
				<button type="submit" class="btn btn-success" onclick="return formCheck()" style="margin-right: 30px;">수정</button>
				<button type="button" class="btn btn-dark" onclick="location.href='main.do'" style="margin-right: 30px;">메인으로</button>
				<button type="button" class="btn btn-danger" id="memDelBtn" data-toggle="modal" data-target="#memDelPop">탈퇴</button>		
			</div>
		</div>
		
	</form>
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
					<form id="frm2" name="frm2" action="memberDelete.do" method="post">
						<div id="delete">
							<input type="text" name="pchk" id="pchk" placeholder="비밀번호를 입력하세요">
						</div>
						<div style="text-align: center; margin: 10px;">
							<button type="submit" name="confirmDel" id="confirmDel" class="btn btn-success">탈퇴</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>