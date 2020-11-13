<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
/* .container {
	float: left;
	width: 80%;
	position:relative;
	top:50px;
} */
.btn {
  background-color: white;
  color: black;
  border: 2px solid #555555;
  width:60px;
  height:40px;
  border-radius:10%;
  
}

.btn:hover {
  background-color: #555555;
  color: white;
}

#form1{
	position:relative;
	bottom:110px;
}

#container{
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
	top:40px;
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
input[type='text'], input[type='password'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
</style>
<script type="text/javascript">
	$(function(){
		couponList();
		
		couponSelect();
		
		
		init();
		
	});
	//초기화
	function init(){
		$('#btnInit').on('click',function(){
			$('#form1').each(function(){
				this.reset();
			});
		});
	}

	//상세조회
	function couponSelect(){
		$('tbody').on('click','#btnSelect',function(){
			var cpNo = $(this).closest('tr').find('#hidden_cpNo').val();
			$.ajax({
				url:'ajax/couponSelect.do',
				data:{cp_no:cpNo},
				dataType:'json',
				error:function(xhr,status,msg){
					
				},success:couponSelectResult
			});
		});
	}
	//쿠폰 조회 응답
	function couponSelectResult(coupon){
		$('input:text[name="cp_no"]').val(coupon.cp_no);
		$('input:text[name="cp_nm"]').val(coupon.cp_nm);
		$('input:date[name="cp_vaild_date"]').val(coupon.cp_vaild_date); 
		$('select[name="cp_type"]').val(coupon.cp_type).attr("selected","selected","selected","selected");
		$('select[name="cp_discount"]').val(coupon.cp_discount).attr("selected","selected","selected","selected");
	}
	
	function couponList(){
		$.ajax({
			url:'ajax/couponList.do',
			type:'GET',
			dataType:'json',
			error:function(xhr,status,msg){
				
			},
			success:couponListResult
		});
	}
	
	
	//목록 조회
	function couponListResult(data){
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.cp_no))
			.append($('<td>').html(item.cp_nm))
			.append($('<td>').html(item.cp_vaild_date))
			.append($('<td>').html(item.cp_type))
			.append($('<td>').html(item.cp_discount))
			.append($('<td>').html('<button class=\'btn\' id=\'btnSelect\'>조회</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_cpNo\'>').val(item.cp_no))
			.appendTo('.table');
			
		});
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
<div id="container">
	<form id="form1"  class="form-horizontal">
		<h4>쿠폰 조회</h4>
		<div class="form-group">		
			<label >쿠폰번호:</label>
			<input type="text"  class="form-control" name="cp_no" >
		</div>	
		<div class="form-group">
			<label>쿠폰이름:</label>
			<input type="text"  class="form-control"  name="cp_nm" >
		</div>				
		<div class="form-group">
			<label >유효기간:</label>
			<input type="date" name="cp_vaild_date" >
		</div>	    
		<div class="form-group">   
			<label>쿠폰종류:</label>
				<select class="form-control" name="cp_type">
					   		<option value="VIP">VIP전용할인</option>
					   		<option value="Gold">Gold전용할인</option>
					   		<option value="SILVER">SILVER전용할인</option>
					   		<option value="BRONZE">BRONZE전용할인</option>
				</select>
		</div>
		<div class="form-group">   
			<label>할인금액:</label>
				<select class="form-control" name="cp_discount">
					   		<option value="10000">10000</option>
					   		<option value="6000">6000</option>
					   		<option value="4000">4000</option>
					   		<option value="2000">2000</option>
				</select>
		</div>
	</form>
</div>
<br>		
<div>
	<h2>CBOX 할인쿠폰 내역</h2>
</div>
<div class="tbl-data">
	<table class="table">
		<thead>
			<tr>
				<th>쿠폰번호</th>
				<th>쿠폰이름</th>
				<th>유효기간</th>
				<th>쿠폰종류</th>
				<th>할인금액</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
</div>
</body>
</html>