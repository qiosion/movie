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
					aria-expanded="false" onfocus="blur()"> 영화 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/movieListForm.do">전체 리스트</a>
						<a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/movieExpectList.do">상영
							예정작</a> <a class="dropdown-item" onfocus="blur()"
							href="${pageContext.request.contextPath}/movieChartList.do">박스
							오피스</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/mvList.do" onfocus="blur()">관리자 영화 목록</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/screenMvForm.do" onfocus="blur()">상영 영화 관리</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/reservation/reservationForm.do">예매하기
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" onfocus="blur()"
					href="${pageContext.request.contextPath}/infoList.do">공지사항 <span
						class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>
