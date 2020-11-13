<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/movie/css/mainMenu.css">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" onfocus="blur()"
			href="${pageContext.request.contextPath}/main.do">CBOX</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" onfocus="blur()">영화관리</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/mvList.do">영화관리</a>
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/screenMvForm.do">상영 영화 관리</a>
					</div>
				</li>
				<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/memberList.do">회원관리
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" onfocus="blur()">예매관리</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/AdminReserv.do">전체 예매내역</a>
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/ReservFromToday.do">이후 예매내역</a>
					</div>
				</li>
				<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/infoList.do">공지사항 <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/couponFormAd.do">쿠폰관리 <span
						class="sr-only">(current)</span>
				</a></li>
					<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/QnAListForm.do">1:1문의관리 <span
						class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>
