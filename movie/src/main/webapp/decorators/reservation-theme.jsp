<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>

<html>
<head id="ctl00_Head1">
<style>
	body, input, textarea, select, button, table {
	    font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif !important;
	    
	}
	body, input, select, textarea, header, footer {
    
    font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif !important;
   
}
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="imagetoolbar" content="no">
<meta name="keywords"
	content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작">
<meta name="description" content="영화 그 이상의 감동. CGV">
<title>CBOX 예매</title>
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/common.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_tnb.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_popup.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_step3.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_step3_special.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_step3_step1.css">
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/08/FORM_TYPE/reservation_step3_step2.css">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/cgvpackage.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.api.ticket.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.api.payment.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.api.coupon.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.crypto.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.data.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/jquery.cgv.net.js"></script>

<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/reservation.alert.js"></script>

<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/reservation.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/reservation.popup.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/reservation.step1.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/reservation.step2.js"></script>
<script type="text/javascript">
	// for loadStep3Resources_STEP2 include source path;
	var CDN_PATH_JS = "http://img.cgv.co.kr/CGV_RIA/Ticket/Common/js/2020/1013.TXTCHG/0909/";
	// 초기 선택값 설정
	preselectSetting('', '', '', '', '', '', '', '', '');
</script>
		<decorator:head />

</head>
<body>
	<header>
		
		<jsp:include page="/header.jsp" />
		<jsp:include page="/jsp/user/menu/mainMenu.jsp" />
	</header>
	<hr>
		<decorator:body />
	<hr>
	<footer>바보들의 행진이다</footer>
</body>
</html>


