<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		couponList();
		
		couponSelect();
		
		couponDelete();
		
		couponInsert();
		
		init()
		
	});
	//초기화
	function init(){
		$('#btnInit').on('click',function(){
			$('#form1').each(function(){
				this.reset();
			});
		});
	}
	//쿠폰삭제
	function userDelete(){
		$('body').on('click','#btnDelete',function(){
			var cpNo = $(this).closest('tr').find('#hidden_cpNo').val();
			var result = confirm(cpNo +"쿠폰을 정말로 삭제하시겠습니까?");
			if(result){
				$.ajax({
					url:'ajax/couponDelete.do',
					data : {cp_no:cpNo},
					dataType:'json',
					error:function(xhr,status,msg){
						
					},success:function(xhr){
						couponList();
					}
				});
			}
		});
	}
	//상세조회
	function couponSelect(){
		$('body').on('click','#btnSelect',function(){
			var cpNo = $(this).closest('tr').find('hidden_cpNo').val();
			$.ajax({
				url:'ajax/coupons.do',
				data:{cp_no:cpNo},
				dataType:'json',
				error:function(xhr,status,msg){
					
				},success:couponSelectResult
			});
		});
	}
	//쿠폰 조회 응답
	function couponSelectResult(coupon){
		$('input:text[name="cp_no"].val(coupon.cp_no)');
		$('input:text[name="cp_nm"].val(coupon.cp_nm)');
		$('input:date[name="cp_valid_date"].val(coupon.cp_valid_date)'); 
		$('select[name="cp_type"]'.val(coupon.cp_type).attr("selected","selected","selected","selected"));
		$('select[name="cp_discount"]'.val(coupon.cp_discount).attr("selected","selected","selected","selected"));
	}
	//쿠폰등록
	function couponInsert(){
		$('btnInsert').on('click',function(){
			$.ajax({
				url:"ajax/couponInsert.do",
				dataType: 'json',
				method:"POST",
				data : $("#form1").serialize(),
				success: function(response){
					couponList();
				},
				error:function(xhr, status, message){
				alert("status: " + status+"er: "+message);
				}
			});
		});
	}
	//목록 조회
	function couponListResult(data){
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.cp_no))
			.append($('<td>').html(item.cp_nm))
			.append($('<td>').html(item.cp_valid_date))
			.append($('<td>').html(item.cp_type))
			.append($('<td>').html(item.cp_discount))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_cpNo\'>').val(item.cp_no))
			.appendTo('tbody');
		});
	}
</script>
</head>
<body>
<div class="container">
	<form id="form1"  class="form-horizontal">
		<h2>쿠폰 등록 및 조회</h2>
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
			<input type="date"  class="form-control"  name="cp_valid_date" >
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
					   		<option value="VIP">10000</option>
					   		<option value="Gold">6000</option>
					   		<option value="SILVER">4000</option>
					   		<option value="BRONZE">2000</option>
				</select>
		</div>
		<div class="btn-group">      
				<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
				<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
		</div>
	</form>
</div>
<hr>		
<div>
	<h2>CBOX 할인쿠폰 내역</h2>
</div>
<div class="tbl-data">
	<table class="table text-center">
		<thead>
			<tr>
				<th class="text-center">쿠폰번호</th>
				<th class="text-center">쿠폰이름</th>
				<th class="text-center">유효기간</th>
				<th class="text-center">쿠폰종류</th>
				<th class="text-center">할인금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<c:forEach var="cp" items="${cpList}">
				<td>${cp.cp_no}</td>
				<td>${cp.cp_nm}</td>
				<td>${cp.cp_vaild_date}</td>
				<td>${cp.cp_type}</td>
				<td>${cp.cp_discount}</td>
			</c:forEach>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>