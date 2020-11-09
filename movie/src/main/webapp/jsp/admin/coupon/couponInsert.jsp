<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠폰정보</h1>
	<a>쿠폰명: <input type="text" name="cp_nm" ></a><br>
	<a>유효기간: <input name="cp_valid_date" type="date">~<input name="cp_valid_date1" type="date"></a><br>
	<a>쿠폰종류: <select name="cp_type"><option value="VIP">VIP전용할인</option>
				<option value="Gold">Gold전용할인</option>
				<option value="Silver">Silver전용할인</option>
				<option value="Bronze">Bronze전용할인</option>
	</select></a><br>
	<a>할인금액: <input type="text" name="cp_discount" value=""></a>
</body>
</html>