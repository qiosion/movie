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


</style>
<script type="text/javascript">
	$(function(){
		couponList();
		
		couponSelect();
		
		couponDelete();
		
		couponInsert();
		
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
	//쿠폰삭제
	function couponDelete(){
		$('tbody').on('click','#btnDelete',function(){
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
	//쿠폰등록
	function couponInsert(){
		$('#btnInsert').on('click',function(){
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
			.append($('<td>').html('<button class=\'btn\' id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_cpNo\'>').val(item.cp_no))
			.appendTo('.table');
			
		});
	}
</script>
</head>
<body>
<div class="container">
	<form id="form1"  class="form-horizontal">
		<h4>쿠폰 등록 및 조회</h4>
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
		<div class="btn-group">      
				<input type="button"  class="btn" value="등록"  id="btnInsert" />&nbsp;&nbsp; 
				<input type="button"  class="btn" value="초기화" id="btnInit" />
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