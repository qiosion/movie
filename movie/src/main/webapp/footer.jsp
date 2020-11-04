<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=1024">
<meta name="keywords"
	content="CBOX, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cbox, cbox, 예매, 상영작">
<meta name="description"
	content="CBOX는 선진화된 관람문화와 최고의 서비스로 고객에게 잊을 수 없는 감동을 선사합니다. CBOX홈페이지를 통해 영화 예매뿐만 아니라 그 이상의 서비스와 감동을 전달하고, 다양한 즐거움과 특별한 경험을 제공하고자 합니다.">
<meta property="og:site_name" content="영화 그 이상의 감동. CBOX">
<meta id="og_title" property="og:title" content="영화 그 이상의 감동. CBOX">

<meta id="og_image" property="og:image"
	content="http://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png">
<link rel="alternate" href="http://m.cgv.co.kr">
<link rel="shortcut icon"
	href="http://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon">
<title id="headerTitle">영화 그 이상의 감동. CBOX</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://img.cgv.co.kr/R2014/images/favicon.ico">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/reset.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/layout.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/module.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/common.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/content.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/eggupdate.css">
<link rel="stylesheet" media="print" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/print.css">
<link rel="stylesheet" type="text/css"
	href="http://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/phototicket/phototicket.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/slick.css">
<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/slick-theme-custom.css">

<script type="text/javascript" async=""
	src="http://www.google-analytics.com/analytics.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NNNFR3"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="http://www.google-analytics.com/analytics.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NNNFR3"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="/common/js/extraTheaters.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/app.config.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/app.utils.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/app.init.js"></script>

<!--[if lte IE 9]><script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script src="http://img.cgv.co.kr/R2014/js/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>

<!-- 각페이지 Header Start-->
<!--/각페이지 Header End-->
<script type="text/javascript">
    //<![CDATA[

        app.config('staticDomain', 'http://img.cgv.co.kr/R2014/')
            .config('imageDomain', 'http://img.cgv.co.kr')
            .config('isLogin', 'False');

        var iframe = document.getElementById("ticket_iframe");

        function ticketIframeResize(height) {
            var iframe = document.getElementById("ticket_iframe");
            // resize
            iframe.height = height;
        }

        function addEvent(event, elem, func) {
            // W3C DOM
            if (elem.addEventListener) {
                elem.addEventListener(event, func, false);
            }
            // IE DOM
            else if (elem.attachEvent) {
                var r = elem.attachEvent("on" + event, func);
                return r;
            }
            // else
            else {
            }
        }

        function f_clientWidth() {
            return f_filterResults(
			window.innerWidth ? window.innerWidth : 0,
			document.documentElement ? document.documentElement.clientWidth : 0,
			document.body ? document.body.clientWidth : 0
		);
        }
        function f_clientHeight() {
            return f_filterResults(
			window.innerHeight ? window.innerHeight : 0,
			document.documentElement ? document.documentElement.clientHeight : 0,
			document.body ? document.body.clientHeight : 0
		);
        }
        function f_scrollLeft() {
            return f_filterResults(
			window.pageXOffset ? window.pageXOffset : 0,
			document.documentElement ? document.documentElement.scrollLeft : 0,
			document.body ? document.body.scrollLeft : 0
		);
        }
        function f_scrollTop() {
            return f_filterResults(
			window.pageYOffset ? window.pageYOffset : 0,
			document.documentElement ? document.documentElement.scrollTop : 0,
			document.body ? document.body.scrollTop : 0
		);
        }
        function f_filterResults(n_win, n_docel, n_body) {
            var n_result = n_win ? n_win : 0;
            if (n_docel && (!n_result || (n_result > n_docel)))
                n_result = n_docel;
            return n_body && (!n_result || (n_result > n_body)) ? n_body : n_result;
        }
        function scrollToTop(y, isAnimate) {
            if (y == undefined) y = 0;
            $("html, body").animate({ scrollTop: y + "px" });
        }

        function ticketInfoModifyMobile(mobile1, mobile2, mobile3) {
            try {
                $.ajax({
                    type: "post",
                    url: "/user/join/UpdateUserInfoRia.aspx?mobile1=" + mobile1 + "&mobile2=" + mobile2 + "&mobile3=" + mobile3,
                    dataType: "html",
                    contentType: "application/html; charset=utf-8",
                    success: function (_data) {
                        //alert(_data); // 00000
                    }
                });
            } catch (ex) {
            }
        }
        function ticketGuestLogin(name, ssn) {
            var keyObject = document.getElementById("loginform");
            if (keyObject) {
                document.loginform.method = "post";
                document.loginform.id.value = name;
                document.loginform.password.value = ssn;
                document.loginform.returnURL.value = "AA";
                document.loginform.action = "/user/guest/GuestMember.aspx";
                document.loginform.submit();
            }
            else {
                alert("진행중입니다. 화면이 완료된 후에 클릭해주세요.");
                document.location.reload();
            }
        }

    //]]>

        function goFamilySite() {
            var famulySiteURL = $(familysite).val();
            if (famulySiteURL != "") {
                var win = window.open(famulySiteURL, 'winFamilySite')
                win.focus();
            }
        }
    </script>
<script type="text/javascript"
	src="https://nsso.YEDAMone.com/findCookieSecured.jsp?YEDAMssoq=CO3JmqSNvH8Pan7rVYgTd7MzxAOOKli9rJsaQQgtxdXo5B7lwuOT2slgkdnFVPhQyjz5LZog7lkGCHwk7M4YsTZYcDdaUzIwMUg2SVJMSkF5eEVNaEI3RG5qcVlLenlvRjZCYlc4bng5WnJuVW1OOTFBQkx3d29pc0JTTndRQnE%3d"></script>
<script type="text/javascript"
	src="http://img.cgv.co.kr/R2014//js/system/system.packed.js"></script>
</head>

<body>
	<!-- Footer -->
		<div id="footer">
			<!-- footer_area (s) -->


			<div id="BottomWrapper" class="sect-ad">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Bottom"
					width="100%" height="240" title="광고-CBOX 기프트 카드" frameborder="0"
					scrolling="no" marginwidth="0" marginheight="0" name="Bottom"
					id="Bottom"></iframe>
			</div>
			<div class="foot">
				<div class="sect-smuse">
					<h2>특별관 리스트</h2>
					<ul>
						<li><a
							href="#"
							class="dx">4DX</a></li>
						<li><a
							href="#"
							class="imax">IMAX</a></li>
						<li><a
							href="#"
							class="screenx">SCREENX</a></li>
						<li><a
							href="#"
							class="spherex">SphereX</a></li>
						<li><a
							href="#"
							class="tempur">Tempur</a></li>
						<li><a
							href="#"
							class="gold">GOLDCLASS</a></li>
						<li><a
							href="#"
							class="cine">CINE de CHEF</a></li>
						<li><a
							href="#"
							class="cinema">THE PRIVATE CINEMA</a></li>
						<li><a
							href="#"
							class="kids">Cine kids</a></li>
						<li><a
							href="#"
							class="cinenforet">CINE&amp;FORET</a></li>
					</ul>
				</div>
				<div class="sect-cinfo">
					<h2>YEDAM CBOX 회사소개 및 정책</h2>
					<div class="policy">
						<ul>
							<li><a href="#" target="_blank">회사소개</a></li>
							<li><a
								href="#"
								target="_blank">IR</a></li>
							<li><a
								href="#"
								target="_blank">채용정보</a></li>
							<li><a
								href="#"
								target="_blank">광고/프로모션문의</a></li>
							<li><a
								href="#"
								target="_blank">제휴문의</a></li>
							<li><a
								href="#"
								target="_blank">출점문의</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">편성기준</a></li>
							<li><a href="#"
								class="empha-red">개인정보처리방침</a></li>
							<li><a href="#">법적고지</a></li>
							<li><a href="#">이메일주소무단수집거부</a></li>
							<li><a href="#">상생경영</a></li>
							<li><a href="#">사이트맵</a></li>
						</ul>
					</div>
					<div class="share">
						<a href="#" target="_blank"
							class="facebook" title="새창">페이스북</a><a
							href="#" target="_blank" class="twitter"
							title="새창">트위터</a><a href="#"
							target="_blank" class="instagram" title="새창">인스타그램</a>
					</div>
					<div class="address">
						<img alt="test" src="images/cboxlog_noTitle.png" style="height: 60px; width:80px; float: left; margin-right: 5px;">
						<div style="text-align: left;">
						<address>대구광역시 중구 국채보상로 537 (수동, 5층)</address>
						<p class="vl">
							<span>대표이사 : 이화진</span><span>사업자등록번호 : 123-81-45690</span><span>통신판매업신고번호
								: 2017-대구중구-0662</span> <a href="javascript:void(0);" onclick="goFtc()"
								class="btn_goFtc"><img
								src="http://img.cgv.co.kr/r2014/images/common/btn_reg.png"
								alt="사업자정보확인"></a><a> </a>
						</p>
						<a>
							<p class="vl">
								<span>호스팅사업자 : YEDAM올리브네트웍스</span><span>개인정보보호 책임자 : 강은선</span><span>대표이메일
									: yedamcboxmaster@yedam.net</span><span>CBOX고객센터 : 1234-5678</span>
							</p>
							<p class="copyright">© YEDAM CBOX. All Rights Reserved</p>
						</a></div>
					</div>
					<a>
						<div class="familysite">
							<label for="familysite" class="hidden">YEDAM그룹 계열사 바로가기</label> <select
								id="familysite">
								<option value="">계열사 바로가기</option>
								<optgroup label="YEDAM그룹">
									<option value="http://www.YEDAM.net/">YEDAM주식회사</option>
								</optgroup>
								<optgroup label="엔터테인먼트 &amp; 미디어">
									<option value="http://www.YEDAMenm.com/">YEDAM ENM (E&amp;M)</option>
									<option value="http://www.cgv.co.kr/">YEDAM CBOX</option>
									<option value="http://www.YEDAMpowercast.com/">YEDAM파워캐스트</option>
								</optgroup>
								<optgroup label="식품 &amp; 식품서비스">
									<option value="https://www.YEDAM.co.kr">YEDAM제일제당 (식품)</option>
									<option value="http://www.YEDAMfreshway.com/">YEDAM프레시웨이</option>
									<option value="http://www.YEDAMfoodville.co.kr/">YEDAM푸드빌</option>
									<option value="http://www.md1.co.kr/">YEDAM엠디원</option>
								</optgroup>
								<optgroup label="생명공학">
									<option value="https://www.YEDAM.co.kr/kr/about/business/bio">YEDAM제일제당
										(바이오)</option>
								</optgroup>
								<optgroup label="신유통">
									<option value="http://display.YEDAMmall.com">YEDAM ENM (오쇼핑)</option>
									<option value="http://www.YEDAMlogistics.com">YEDAM대한통운</option>
									<option value="http://www.YEDAMtelenix.com/">YEDAM텔레닉스</option>
									<option value="http://www.oliveyoung.co.kr/store/main/main.do">YEDAM올리브영</option>
								</optgroup>
								<optgroup label="인프라">
									<option value="http://www.YEDAMenc.co.kr/">YEDAM대한통운 (건설)</option>
									<option value="http://www.YEDAMolivenetworks.co.kr/itbusiness/">YEDAM올리브네트웍스</option>
								</optgroup>
							</select>
							<button type="button" title="새창" onclick="goFamilySite()">GO</button>
						</div>
					</a>
				</div>
				<a> </a>
			</div>
			
		</div>
</body>
</html>