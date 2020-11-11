<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예매 페이지</title>
<style>
	.seatTableTitle{
		border:2px solid black;
		font-size: 22px;	
		
	}
	.seatTable{
		border:1px solid black;
		font-size:22px;
	}
	.seatTr{
		border:1px solid black;
	}
	.seatTr .seatTd{
		border:1px solid black;
		padding: 10px;
	}
	.seatAll {
		display: flex;
		justify-content:center; 
		align-items:center; 
		
	}
	td.selected{
		border-color:#000;
		background-color:#333;
		color:white;
	}
	.tnb .info.movie .row .data{
		width:140px !important;
	}
	*, ::after, ::before{
		box-sizing:inherit;
	}
	.row{
		margin-right: 0px;
    	margin-left: 0px;
	}
	.header {
	    min-height: 0px; 
	    margin-bottom: 0px; 
    
	}
	
</style>

<script type="text/javascript">

	$(function(){
		
		
		$("#test00 a").on("click",function(){ //예매에서 영화를 선택했을경우
			$("#test01 a").css("background-color","");
			//$("#test00 a").css("background-color","");
			//$("#test00 .text").css("color","");			
			//$(this).css("background-color", "black");
			//$(this).children(".text").css("color","white");
			if($("#test00 li").hasClass("selected")){
				$("#test00 li").removeClass("selected");
			}
				$(this).parent().addClass("selected");
			
			
			
			//$(this).attr("title"); //영화 id
			var paramid = $(this).attr("title");
			var param_id = {m_id: $(this).attr("title")};
			//console.log($("#test01 li").attr("date"));
			
			$.ajax({ //뭘받아오냐? 영화 id값에 해당하는 모든 해당상영일을 받아오는 ajax
				url:"${pageContext.request.contextPath}/ajax/mvFindDate.do", //data보낼 주소
				type:"get", //전송방식
				data:param_id, //보낼 data
				dataType: "json", //요청한 데이터를 받을 형식
				success : mvFindDate,
					//function(data){ //data에 결과값받아옴
					//전송에 성공하면 실행될 코드
					//alert(data[0].tt_scr_date);
					
				//},
				error : function(xhr, status){
					alert("오류");
				}
			}); //end ajax
			
			
			//start img ajax
			$.ajax({
				url:"${pageContext.request.contextPath}/ajax/mvFindImg.do", //data보낼 주소
				type:"get", //전송방식
				data:param_id, //보낼 data
				dataType: "json", //요청한 데이터를 받을 형식
				success : mvFindImg,
				error:function(xhr,status){
					alert("이미지 불러오기 오류");
				}
			});//end img ajax
			
			function mvFindImg(data){
				var mv_title = data[0].mv_title;
				var mv_post = data[0].mv_post;
				//console.log(mv_title);
				$(".info.movie .placeholder").css("display","none");
				$(".info.movie .movie_poster img")
				.attr({"src":"${pageContext.request.contextPath}/images/"+mv_post, "style":"display:inline"});
				$(".info.movie .row.movie_title.colspan2").css("display","block");
				$(".info.movie .row.movie_title.colspan2 a").attr("title",mv_title);
				$(".info.movie .row.movie_title.colspan2 a").text(mv_title);

				
				
				
			}
			
			function mvFindDate(data){//start mvFindate
				$("li.day span").css("color","#A9A9A9"); //누를때마다 초기화 
				var test;
				$.each(data,function(idx,items){
					var mvDate = items.tt_scr_date;
					
					//console.log(mvDate);
					var list= $("#test01 li.day");
					for(var i=0; i<list.length; i++){//브라우저의 li목록에 있는 날짜 다출력
						//$("#test01 li.day")[i].children[0].children[0].style="color:#A9A9A9"
						//$("#test01 li.day")[i].children[0].children[1].style="color:#A9A9A9"
						var date = $(list[i]).data("date") +"";
					//	console.log("li날짜 : " +date)
						if(date.length != 8){
							date = parseInt(date.replace(/(.{6})/g,"$10"));
						}else{
							date =date;
						}
						//	console.log("바뀐날짜 : " +date)
						//mvDate - DB에서 가지고온 영화의 상영일, date = 브라우저에 뿌려진 현재 월의 날짜
						if(mvDate == date) { //DB에서 갖고온 해당영화의 상영일과 , 브라우저에서 갖고온 날짜와 비교해서 같지않으면, 해당textcolor회색처리
							$(list[i]).find("span").css("color","black"); //누를때마다 초기화
							break;
						}
						
						
					}// end for
					
				});//end each
			}//end funtion mvFindate
			
			
			$("#test01 a").on("click", function(){  //영화 클릭후 날짜 클릭
				$("#test01 a").css("background-color","");		
				//$("#tnb_step_btn_right").css("background-color", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat");
				$(".btn-right").css("background-position", "0px -220px")
				var screenInfo = $(".section.section-screen-select .playYMD-info");
				var date2 = $(this).parent().data("date")+"";
				if( date2.length !=8){
					date2 = date2.replace(/(.{6})/g,"$10")
				}else{
					date2=date2;
				}
				$(screenInfo).children(".date").text(date2);
				var dayweek2 = $(this).children(".dayweek").text();
				$(screenInfo).children(".exe").text("("+dayweek2+")");
				
				
				//$("#test01 span").css("color","");
				$(this).css("background-color", "black");
				//$("#tnb_step_btn_right").css("backgorund-position","0px 0px");
				//$(this).children().css("color","white");
				//console.log($(this).parent().data("date")) -- 클릭한 년월일
				var cDate = $(this).parent().data("date")+""; //cDate - 클릭한 년월일., replace할려면 문자열이여야함
				if(cDate.length != 8){
					cDate = cDate.replace(/(.{6})/g,"$10");
				}else{
					cDate =cDate;
				}
				//console.log(cDate);
				var param_idDate = {m_id: paramid, m_date:cDate}; //영화 id값 받아오는거.
				//console.log(param_idDate);
				
				$.ajax({
					url:"${pageContext.request.contextPath}/ajax/mvFindTime.do", //data보낼 주소
					type:"get", //전송방식
					data:param_idDate, //보낼 data
					dataType: "json", //요청한 데이터를 받을 형식
					success : MvFindTime, //함수호출
						//console.log(data[0]);
					error : function(xhr, status){
						alert("오류");
					}
				});//end ajax
				//$("#test02 .theater").css("display","block"); --영화, 날짜에 맞는 영화시간표 출력해라.
				
				function MvFindTime(data){
					//$("#test02").css("display","none"); //time창 초기화
					$("#test02").empty();
					
					//console.log(data.length);
					for(var i=0; i<data.length; i++){
					var test = '<div class="theater" screen_cd="'+i+'" >'+
										'<span class="title"><span class="name">2D</span><span '+
										'class="floor">'+data[i].th_name+'</span><span class="seatcount">(총'+data[i].th_max+'석)</span></span>'+
									'<ul>'+
										'<li data-index="0" data-remain_seat="211" '+
											'play_start_tm="1800"  '+
											'play_num="4"><a class="button" href="#" '+
											'onclick="return false;"><span '+
												'class="time">'+data[i].tt_start+'</span><span class="count"><!-- 잔여좌석 --></span>'+
											'<div class="sreader">'+data[i].tt_end+'</div>'+
												'<span class="sreader mod"></span></a></li>'+
									 '</ul>'+
								'</div>';
					$("#test02").append(test);
					} // end for
				
			
				}//end MvFindTime function
				$(".info.theater .placeholder").css("display","none");
				//$(".info.theater .row.date").css("display","block");
				//$(".info.theater .row.screen").css("display","block");
				//$(".info.theater .row.number").css("display","block");
				$(".info.theater .row").css("display","block");
				//console.log($(this).children(".dayweek").text());
				//console.log($(this).parent().data("date"));
				var date = $(this).parent().data("date");
				var dayweek = $(this).children(".dayweek").text();
				
				$(".info.theater .row.date .data").text(date+"("+dayweek+")");
				$(".info.theater .row.date .data").attr("title",date+"("+dayweek+")");
				
				//start #test02 click
				$("#test02").on("click",".time", function(){ //비동기방식, 시간선택
					$("#test02 a .time").css("background-color","");
					$("#test02 a .time").css("color","");
					$(this).css("background-color", "black");
					$(this).css("color","white");
					$(".btn-right").css("background-position", "-150px -220px"); //좌석선택 버튼 빨간색
					
					var text = $(this).parents("ul").prev().children(".floor").text();
					$(".section.section-screen-select .screen").text(text);
					var Cmax = $(this).parents("ul").prev().children(".seatcount").text();
					Cmax = Cmax.substring(2,4);
					$(".section.section-screen-select .totalNum").text(Cmax);
					
					var start2 = $(this).text();//시작시간
					var end2 = $(this).parent().children("div.sreader").text();//종료시간\
					
					$(".section.section-screen-select .time").text(start2+" ~ "+end2);
					
					$("#tnb_step_btn_right").on("click",function(){
						//console.log("aaa");
						$(".step.step1").css("display","none");
						$(".step.step2").css("display","block");
						$("#ticket_tnb .info.path").css("display","none");
						$(".tnb.step1 .info.seat").css("display","block");
						$("#ticket_tnb .tnb.step1 .info.seat .placeholder").css("display","none");
						$(".btn-right").css("background-position", "0 -330px");
						
						
					});
					
					var screen = $(this).parents("div.theater").children().children(".floor").text();
					$(".info.theater .row.screen .data").text(screen);
					var starttime= $(this).text();
					var endtime = $(this).siblings(".sreader").text();
					
					$(".info.theater .row.date .data").text(date+"("+dayweek+")"+" "+starttime);
					$(".info.theater .row.date .data").attr("title",date+"("+dayweek+")"+" "+starttime);
					
				});//end time button click
				
			});//end date button click 	
			
		}); //end #test00 a, movie button click
		//$(".theater_minimap .seatsClick").
		var title = ["A","B","C","D","E","F"];
		var cnt=0;
		var table = $("<table >").attr("class","seatTable");
		var seaNum = 1;
		for(var i=0; i<6 ; i++){
			var tr=$("<tr >").attr("class","seatTr");
			for(var j=1; j<=8; j++){
				var td=$("<td >").attr({"class":"seatTd", "data-seaNum":title[cnt]+"-"+j+"번"});
				tr.append(td.html(j+"번"));
				seaNum++;
			}
			cnt++;
			table.append(tr);
		}
		$(".theater_minimap .seatsClick").append(table);
		
		cnt=0;
		table = $("<table>").attr("class","seatTableTitle");
		for(var i=1; i<=6; i++){
		    tr=$("<tr>").attr("class","seatTr");
		    td=$("<td>").attr("class","seatTd");
			tr.append(td.html(title[cnt]));
			cnt++;
			table.append(tr);
			
			$(".theater_minimap .seatsLeft").append(table);
			
		}
		
		var ReservNum; //예매인원
		var btnCount = 0;//좌석클릭카운트
		$("#nop_group_adult ul li").on("click", function(){//예매인원클릭
			btnCount=0;//좌석클릭카운트 초기화
			var persons =$(this).data("count");
			$(".info.theater .row.number .data").text(persons);
			$(".seatTable .seatTd.selected").removeClass("selected");//좌석선택 초기화
			$(".btn-right").css("background-position", "0 -330px");
			$("#nop_group_adult ul li.selected").removeClass("selected");
			$(this).addClass("selected");
			
			if($(this).data("count")>0){
				$(".mouse_block").css("display","none");
			}else{
				$(".mouse_block").css("display","block");
			}
				
			ReservNum = $(this).data("count");
		}); //end 예매인원 선택
		
		var seanum= "";
		$(".seatTable .seatTd").on("click",function(){ //예매인원에 맞게 좌석선택
			console.log($(this).data("seanum"));
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				btnCount=$("td.selected").length;
				$("#ticket_tnb .tnb.step1 .info.seat .data.ellipsis-line3").text();
				.removeData($(this).data("seanum"));
				if(btnCount != ReservNum){
					$(".btn-right").css("background-position", "0 -330px");
				}
			}else{
				//console.log(ReservNum);
				//예매인원 받아와서, 인원수에맞게 클릭
				seanum = seanum + $(this).data("seanum");
	
				if(btnCount >= ReservNum){
					alert("선택한 예매인원수를 초과하셨습니다.");
				}else{
					$("#ticket_tnb .tnb.step1 .info.seat .data.ellipsis-line3").text(seanum);
					$(this).addClass("selected");
					btnCount=$("td.selected").length;
					if(btnCount == ReservNum){
						$(".btn-right").css("background-position", "-150px -330px");
						
						$("#tnb_step_btn_right").on("click",function(){
							$(".step.step2").css("display","none");
							$(".step.step3").css("display","block");
						});
					}
				}
			}
		});//end 좌석선택 function
		
		
		
	}); //end start function
</script>


<%
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR); //년도
		int nowMonth = (cal.get(Calendar.MONTH) + 1); //달
		int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 일
		int nowLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //마지막날
		String[] weekDay = { "일", "월", "화", "수", "목", "금", "토" };
		int num = cal.get(Calendar.DAY_OF_WEEK) - 1;
		String today = weekDay[num]; //요일
		String cDate = String.valueOf(nowYear)+String.valueOf(nowMonth);
%>
</head>
<body>

	<div id="wrap" oncontextmenu="return false" ondragstart="return false"
		onselectstart="return false">
		<!-- 컨텐츠 -->
		<div id="container">
			<!-- 빠른예매 -->
			<div id="ticket" class="ticket ko">

				<!-- 메인컨텐츠 -->
				<div class="steps">
					<!-- step1 -->
					<div class="step step1" style="height: 595px; display: block;">

						<!-- MOVIE 섹션 -->
						<div class="section section-movie">
							<!-- col-head -->
							<div class="col-head" id="skip_movie_list">
								<h3 class="sreader">영화</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('skip_theater_list');return false;">영화선택
									건너뛰기</a>
							</div>
							<!-- col-body -->
							<div class="col-body" style="height: 560px;">
								<!-- 영화선택 -->
								<div class="movie-select">

									<div class="tabmenu">
										<!-- 전체보기 -->
										<span class="side on"></span> <a href="#"
											class="button menu1 selected">전체</a> <span class="side on"></span>
									</div>

									<div class="sortmenu">
										<!-- 정렬 -->
										<a href="#" onclick="sortMovieByName();return false;"
											id="movieSortNameBtn" class="button btn-abc">가나다순</a>
									</div>

									<!-- 영화목록 -->
									<div class="movie-list nano has-scrollbar has-scrollbar-y"
										id="movie_list">
										<ul id="test00" class="content scroll-y"
											onscroll="movieSectionScrollEvent();" tabindex="-1"
											style="right: -17px;" ">
											
											<c:forEach var="movie" items="${movies }">
												<li class="rating-18" ><a href="#"
												 title="${movie.mvNum }" alt="${movie.mvTitle }"><span
													class="icon">&nbsp;</span><span class="text">${movie.mvTitle }</span><span
													class="sreader"></span></a></li>
												
											</c:forEach>
										</ul>
										<div class="pane pane-y"
											style="display: block; opacity: 1; visibility: visible;">
											<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
										</div>
										<div class="pane pane-x"
											style="display: none; opacity: 1; visibility: visible;">
											<div class="slider slider-x" style="width: 50px;"></div>
										</div>
									</div>


								</div>
							</div>
						</div>


						<!-- DATE 섹션 -->
						<div class="section section-date">
							<!-- 날짜 타이틀 -->
							<div class="col-head" id="skip_date_list">
								<h3 class="sreader">날짜</h3>
								<a href="#" onclick="return false;" class="skip_to_something">날짜
									건너뛰기</a>
							</div>
							<!-- 날짜 body -->
							<div class="col-body" style="height: 560px;">
								<!-- 날짜선택 -->
								<div class="date-list nano has-scrollbar has-scrollbar-y"
									id="date_list">
									<ul id="test01" class="content scroll-y" tabindex="-1"
										style="right: -17px;">

										<div>
											<li class="month dimmed"><div>
													<span class="year">
														<!-- 현재년도 --><%=nowYear%></span> 
													<span class="month">
														<!-- 현재월 --><%=nowMonth%></span>
													<div></div>
												</div></li>
											<!--  <li data-index="0" date="20201102" class="day"><a
												href="#" onclick="return false;"><span class="dayweek">오늘날짜(무슨요일) </span><span
													class="day">오늘일 </span><span class="sreader"></span></a></li> 
											-->
											<c:forEach var="item" begin="<%=nowDay%>"
												end="<%=nowLastDay%>" step="1">
												<li id="d${item}" data-date=<%=cDate %>${item } class="day">
												   <a href="#" onclick="return false;">
												    <span class="dayweek" ><%=weekDay[num++ % 7]%></span>
													<span class="day">${item }</span>
													<span class="sreader"></span></a>
													</li>

											</c:forEach>

										</div>
									</ul>
									<div class="pane pane-y"
										style="display: block; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px; top: 0px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- TIME 섹션 -->
						<div class="section section-time">
							<!-- 시간 타이틀 -->
							<div class="col-head" id="skip_time_list">
								<h3 class="sreader">시간</h3>
								<a href="#" class="skip_to_something"
									onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택
									건너뛰기</a>
							</div>
							<!-- ENd 시간 타이틀 -->
							<div class="col-body" style="height: 560px;">
								<!-- 시간선택 -->
								<div class="time-option">
									<span class="morning">조조</span><span class="night">심야</span>
								</div>
								<!--  <div class="placeholder">영화, 날짜를 선택해주세요.</div>-->
								<!-- 관 , 시간출력 -->
								<div class="time-list nano has-scrollbar">
									<div id="test02" class="content scroll-y" tabindex="-1"
										style="right: -17px; ">
									<!--  여기에 클릭한 영화, 날짜에 맞는 상영시간 출력 -->
						
										
									</div>
									<div class="pane pane-y"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- End TIME섹션 -->
					</div>
					<!-- //step1 -->

					<!-- step2 -->
					<div class="step step2" style="display: none;">
					<!-- SEAT 섹션 -->
					<div class="section section-seat three_line dimmed">
						<div class="col-head" id="skip_seat_list">
							<h3 class="sreader">
								인원 / 좌석
								<span class="sreader">인원/좌석선택은 레이어로 서비스 되기 때문에 가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</span>
							</h3>
							<a href="#" class="skip_to_something" onclick="skipToSomething('tnb_step_btn_right');return false;">인원/좌석선택 건너뛰기</a>
						</div>
						<div class="col-body">
							<div class="person_screen">
								<!-- NUMBEROFPEOPLE 섹션 -->
								<div class="section section-numberofpeople">
									<div class="col-body">

										
										<div id="nopContainer" class="numberofpeople-select">
											
											
											<div class="group adult" id="nop_group_adult" style="display: block;">
												<span class="title">일반</span>
												<ul>
													<li data-count="0" class="selected" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>0<span class="sreader">명</span></a></li>
													<li data-count="1" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>1<span class="sreader">명</span></a></li>
													<li data-count="2" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>2<span class="sreader">명</span></a></li>
													<li data-count="3" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>3<span class="sreader">명</span></a></li>
													<li data-count="4" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>4<span class="sreader">명</span></a></li>
													<li data-count="5" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>5<span class="sreader">명</span></a></li>
													<li data-count="6" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>6<span class="sreader">명</span></a></li>
													<li data-count="7" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>7<span class="sreader">명</span></a></li>
													<li data-count="8" type="adult"><a href="#" onclick="return false;"><span class="sreader mod">일반</span>8<span class="sreader">명</span></a></li>
												</ul>
											</div>
											<!--  
											<div class="group youth" id="nop_group_youth" style="display: block;">
												<span class="title">청소년</span>
												<ul>
													<li data-count="0" class="selected" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>0<span class="sreader">명</span></a></li>
													<li data-count="1" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>1<span class="sreader">명</span></a></li>
													<li data-count="2" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>2<span class="sreader">명</span></a></li>
													<li data-count="3" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>3<span class="sreader">명</span></a></li>
													<li data-count="4" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>4<span class="sreader">명</span></a></li>
													<li data-count="5" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>5<span class="sreader">명</span></a></li>
													<li data-count="6" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>6<span class="sreader">명</span></a></li>
													<li data-count="7" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>7<span class="sreader">명</span></a></li>
													<li data-count="8" type="youth"><a href="#" onclick="return false;"><span class="sreader mod">청소년</span>8<span class="sreader">명</span></a></li>
												</ul>
											</div>-->
									
											
											
										</div>
									</div>
								</div>
								<!-- NUMBEROFPEOPLE 섹션 -->
								<div class="section section-screen-select">
									
									<div id="user-select-info">
										<p class="theater-info">
											<span class="site">CBOX 예담</span>
											<span class="screen"></span>
											<span class="seatNum">남은좌석  <b class="restNum"></b>/<b class="totalNum"></b></span>
										</p>
										<p class="playYMD-info"><b class="date"></b><b class="exe">(월)</b><b class="time"></b></p>
									</div>
								</div>
								
							</div>
							<!-- THEATER -->
							<div class="theater_minimap">
								<div class="theater nano has-scrollbar" id="seat_minimap_nano">
									<div class="content" tabindex="-1" style="right: -17px; bottom: -17px;">
										<div class="screen" title="SCREEN" style="width: 652px;"><span class="text"></span></div>
										
											<div class="seatAll">
												<div class="seatsLeft" >
													<!-- title -->
												</div>
												<div class="seatsClick" >
													<!-- 좌석 선택 !!!!!!!!!!!!!!!!!! -->
												</div>
												<!-- end 좌석 선택 -->
											</div>
									</div>
								<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;"><div class="slider slider-y" style="height: 50px;"></div></div><div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;"><div class="slider slider-x" style="width: 50px;"></div></div></div>
								<div class="minimap opened" id="minimap" style="display: none;">
									<div class="mini_header" onclick="ftSeatMinimapToggle();event.preventDefault();">Minimap<span></span></div>
									<div class="mini_container" style="width: 98px; height: 96px;">
										<div class="mini_screen">SCREEN</div>
										<div class="mini_seats"><div class="mini_seat" style="left:0px;top:0px;"><span></span></div><div class="mini_seat" style="left:4px;top:0px;"><span></span></div><div class="mini_seat" style="left:8px;top:0px;"><span></span></div><div class="mini_seat" style="left:12px;top:0px;"><span></span></div><div class="mini_seat" style="left:16px;top:0px;"><span></span></div><div class="mini_seat" style="left:20px;top:0px;"><span></span></div><div class="mini_seat" style="left:24px;top:0px;"><span></span></div><div class="mini_seat" style="left:28px;top:0px;"><span></span></div><div class="mini_seat" style="left:32px;top:0px;"><span></span></div><div class="mini_seat" style="left:36px;top:0px;"><span></span></div><div class="mini_seat handicap" style="left:48px;top:0px;"><span></span></div><div class="mini_seat handicap" style="left:52px;top:0px;"><span></span></div><div class="mini_seat" style="left:0px;top:4px;"><span></span></div><div class="mini_seat" style="left:4px;top:4px;"><span></span></div><div class="mini_seat" style="left:8px;top:4px;"><span></span></div><div class="mini_seat" style="left:12px;top:4px;"><span></span></div><div class="mini_seat" style="left:16px;top:4px;"><span></span></div><div class="mini_seat" style="left:20px;top:4px;"><span></span></div><div class="mini_seat" style="left:24px;top:4px;"><span></span></div><div class="mini_seat" style="left:28px;top:4px;"><span></span></div><div class="mini_seat" style="left:32px;top:4px;"><span></span></div><div class="mini_seat" style="left:36px;top:4px;"><span></span></div><div class="mini_seat" style="left:40px;top:4px;"><span></span></div><div class="mini_seat" style="left:44px;top:4px;"><span></span></div><div class="mini_seat" style="left:48px;top:4px;"><span></span></div><div class="mini_seat" style="left:52px;top:4px;"><span></span></div><div class="mini_seat" style="left:0px;top:8px;"><span></span></div><div class="mini_seat" style="left:4px;top:8px;"><span></span></div><div class="mini_seat" style="left:8px;top:8px;"><span></span></div><div class="mini_seat" style="left:12px;top:8px;"><span></span></div><div class="mini_seat" style="left:16px;top:8px;"><span></span></div><div class="mini_seat" style="left:20px;top:8px;"><span></span></div><div class="mini_seat" style="left:24px;top:8px;"><span></span></div><div class="mini_seat" style="left:28px;top:8px;"><span></span></div><div class="mini_seat" style="left:32px;top:8px;"><span></span></div><div class="mini_seat" style="left:36px;top:8px;"><span></span></div><div class="mini_seat" style="left:40px;top:8px;"><span></span></div><div class="mini_seat" style="left:44px;top:8px;"><span></span></div><div class="mini_seat" style="left:48px;top:8px;"><span></span></div><div class="mini_seat" style="left:52px;top:8px;"><span></span></div><div class="mini_seat" style="left:0px;top:12px;"><span></span></div><div class="mini_seat" style="left:4px;top:12px;"><span></span></div><div class="mini_seat" style="left:8px;top:12px;"><span></span></div><div class="mini_seat" style="left:12px;top:12px;"><span></span></div><div class="mini_seat" style="left:16px;top:12px;"><span></span></div><div class="mini_seat" style="left:20px;top:12px;"><span></span></div><div class="mini_seat" style="left:24px;top:12px;"><span></span></div><div class="mini_seat" style="left:28px;top:12px;"><span></span></div><div class="mini_seat" style="left:32px;top:12px;"><span></span></div><div class="mini_seat" style="left:36px;top:12px;"><span></span></div><div class="mini_seat" style="left:40px;top:12px;"><span></span></div><div class="mini_seat" style="left:44px;top:12px;"><span></span></div><div class="mini_seat" style="left:48px;top:12px;"><span></span></div><div class="mini_seat" style="left:52px;top:12px;"><span></span></div><div class="mini_seat reserved" style="left:0px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:4px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:8px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:12px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:16px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:20px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:24px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:28px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:32px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:36px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:40px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:44px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:48px;top:16px;"><span></span></div><div class="mini_seat reserved" style="left:52px;top:16px;"><span></span></div><div class="mini_seat" style="left:0px;top:20px;"><span></span></div><div class="mini_seat" style="left:4px;top:20px;"><span></span></div><div class="mini_seat" style="left:8px;top:20px;"><span></span></div><div class="mini_seat" style="left:12px;top:20px;"><span></span></div><div class="mini_seat" style="left:16px;top:20px;"><span></span></div><div class="mini_seat" style="left:20px;top:20px;"><span></span></div><div class="mini_seat" style="left:24px;top:20px;"><span></span></div><div class="mini_seat" style="left:28px;top:20px;"><span></span></div><div class="mini_seat" style="left:32px;top:20px;"><span></span></div><div class="mini_seat" style="left:36px;top:20px;"><span></span></div><div class="mini_seat" style="left:40px;top:20px;"><span></span></div><div class="mini_seat" style="left:44px;top:20px;"><span></span></div><div class="mini_seat" style="left:48px;top:20px;"><span></span></div><div class="mini_seat" style="left:52px;top:20px;"><span></span></div><div class="mini_seat" style="left:8px;top:24px;"><span></span></div><div class="mini_seat" style="left:12px;top:24px;"><span></span></div><div class="mini_seat" style="left:16px;top:24px;"><span></span></div><div class="mini_seat" style="left:20px;top:24px;"><span></span></div><div class="mini_seat" style="left:24px;top:24px;"><span></span></div><div class="mini_seat" style="left:28px;top:24px;"><span></span></div><div class="mini_seat" style="left:32px;top:24px;"><span></span></div><div class="mini_seat" style="left:36px;top:24px;"><span></span></div><div class="mini_seat" style="left:40px;top:24px;"><span></span></div><div class="mini_seat" style="left:44px;top:24px;"><span></span></div><div class="mini_seat" style="left:48px;top:24px;"><span></span></div><div class="mini_seat" style="left:52px;top:24px;"><span></span></div><div class="mini_seat" style="left:8px;top:28px;"><span></span></div><div class="mini_seat" style="left:12px;top:28px;"><span></span></div><div class="mini_seat" style="left:16px;top:28px;"><span></span></div><div class="mini_seat" style="left:20px;top:28px;"><span></span></div><div class="mini_seat reserved" style="left:24px;top:28px;"><span></span></div><div class="mini_seat reserved" style="left:28px;top:28px;"><span></span></div><div class="mini_seat" style="left:32px;top:28px;"><span></span></div><div class="mini_seat" style="left:36px;top:28px;"><span></span></div><div class="mini_seat" style="left:40px;top:28px;"><span></span></div><div class="mini_seat" style="left:44px;top:28px;"><span></span></div><div class="mini_seat" style="left:48px;top:28px;"><span></span></div><div class="mini_seat" style="left:52px;top:28px;"><span></span></div><div class="mini_seat" style="left:8px;top:32px;"><span></span></div><div class="mini_seat" style="left:12px;top:32px;"><span></span></div><div class="mini_seat" style="left:16px;top:32px;"><span></span></div><div class="mini_seat" style="left:20px;top:32px;"><span></span></div><div class="mini_seat" style="left:24px;top:32px;"><span></span></div><div class="mini_seat" style="left:28px;top:32px;"><span></span></div><div class="mini_seat reserved" style="left:32px;top:32px;"><span></span></div><div class="mini_seat" style="left:36px;top:32px;"><span></span></div><div class="mini_seat" style="left:40px;top:32px;"><span></span></div><div class="mini_seat" style="left:44px;top:32px;"><span></span></div><div class="mini_seat" style="left:48px;top:32px;"><span></span></div><div class="mini_seat" style="left:52px;top:32px;"><span></span></div><div class="mini_seat" style="left:8px;top:36px;"><span></span></div><div class="mini_seat" style="left:12px;top:36px;"><span></span></div><div class="mini_seat" style="left:16px;top:36px;"><span></span></div><div class="mini_seat" style="left:20px;top:36px;"><span></span></div><div class="mini_seat reserved" style="left:24px;top:36px;"><span></span></div><div class="mini_seat reserved" style="left:28px;top:36px;"><span></span></div><div class="mini_seat" style="left:32px;top:36px;"><span></span></div><div class="mini_seat" style="left:36px;top:36px;"><span></span></div><div class="mini_seat reserved" style="left:40px;top:36px;"><span></span></div><div class="mini_seat reserved" style="left:44px;top:36px;"><span></span></div><div class="mini_seat" style="left:48px;top:36px;"><span></span></div><div class="mini_seat" style="left:52px;top:36px;"><span></span></div><div class="mini_seat" style="left:8px;top:40px;"><span></span></div><div class="mini_seat" style="left:12px;top:40px;"><span></span></div><div class="mini_seat" style="left:16px;top:40px;"><span></span></div><div class="mini_seat" style="left:20px;top:40px;"><span></span></div><div class="mini_seat reserved" style="left:24px;top:40px;"><span></span></div><div class="mini_seat reserved" style="left:28px;top:40px;"><span></span></div><div class="mini_seat" style="left:32px;top:40px;"><span></span></div><div class="mini_seat" style="left:36px;top:40px;"><span></span></div><div class="mini_seat" style="left:40px;top:40px;"><span></span></div><div class="mini_seat" style="left:44px;top:40px;"><span></span></div><div class="mini_seat" style="left:48px;top:40px;"><span></span></div><div class="mini_seat" style="left:52px;top:40px;"><span></span></div><div class="mini_seat sweet" style="left:60px;top:40px;"><span></span></div><div class="mini_seat sweet" style="left:64px;top:40px;"><span></span></div><div class="mini_seat" style="left:8px;top:44px;"><span></span></div><div class="mini_seat" style="left:12px;top:44px;"><span></span></div><div class="mini_seat" style="left:16px;top:44px;"><span></span></div><div class="mini_seat" style="left:20px;top:44px;"><span></span></div><div class="mini_seat reserved" style="left:24px;top:44px;"><span></span></div><div class="mini_seat reserved" style="left:28px;top:44px;"><span></span></div><div class="mini_seat" style="left:32px;top:44px;"><span></span></div><div class="mini_seat" style="left:36px;top:44px;"><span></span></div><div class="mini_seat" style="left:40px;top:44px;"><span></span></div><div class="mini_seat" style="left:44px;top:44px;"><span></span></div><div class="mini_seat" style="left:48px;top:44px;"><span></span></div><div class="mini_seat" style="left:52px;top:44px;"><span></span></div><div class="mini_seat sweet" style="left:60px;top:44px;"><span></span></div><div class="mini_seat sweet" style="left:64px;top:44px;"><span></span></div><div class="mini_seat sweet" style="left:8px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:12px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:16px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:20px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:24px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:28px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:32px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:36px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:40px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:44px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:48px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:52px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:60px;top:48px;"><span></span></div><div class="mini_seat sweet" style="left:64px;top:48px;"><span></span></div></div>
										<div class="mini_exits"><div class="mini_exit tr"></div></div>
									</div>
									<div class="mini_region" style="height: 96px; width: 98px; top: 25px; left: 5px;"><span></span></div>
								</div>
								<div class="legend" style="width: 110px;">
									

									<div class="seat-icon-desc">
										<span class="icon selected"><span class="icon"></span>선택</span>
										<span class="icon reserved"><span class="icon"></span>예매완료</span>
										<span class="icon notavail"><span class="icon"></span>선택불가</span>
									</div>
									<div class="seat-type"><span class="radiobutton type-rating_economy" title="Economy 석" style="">Economy Zone<span class="icon"></span></span><span class="radiobutton type-rating_comfort" title="Standard 석" style="display: none;">Standard Zone<span class="icon"></span></span><span class="radiobutton type-rating_prime" title="Prime 석" style="display: none;">Prime Zone<span class="icon"></span></span>
										
										<span class="radiobutton type-normal" style="display: block;"><span class="icon"></span>일반석</span>
										<span class="radiobutton type-couple" title="연인, 가족, 친구를 위한 둘만의 좌석" style="display: none;"><span class="icon"></span>커플석</span>
										<span class="radiobutton type-handicap" style="display: block;"><span class="icon"></span>장애인석</span>
										<span class="radiobutton type-sweetbox" title="국내 최대 넓이의 프리미엄 커플좌석" style="display: block;"><span class="icon"></span>SWEETBOX</span>
										<span class="radiobutton type-veatbox" title="음향 진동 시스템이 적용된 특별좌석" style="display: none;"><span class="icon"></span>VEATBOX</span>
										<span class="radiobutton type-4d" title="바람, 진동 등 오감으로 영화 관람, 4DX" style="display: none;"><span class="icon"></span>4DX</span>
										<span class="radiobutton type-widebox" title="일반석보다 더 넓고 편안한 좌석" style="display: none;"><span class="icon"></span>WIDEBOX</span>
										<span class="radiobutton type-cinekids last" title="365일 어린이 전용 상영관" style="display: none;"><span class="icon"></span>CINEKIDS</span>
									<span class="radiobutton type-eggbox" title="EGG BOX" style="display: none;">EGG BOX<span class="icon"></span></span><span class="radiobutton type-recliner" title="Recliner" style="display: none;">Recliner<span class="icon"></span></span><span class="radiobutton type-cabana" title="카바나 석" style="display: none;">카바나석<span class="icon"></span></span><span class="radiobutton type-beanbag" title="빈백 석" style="display: none;">빈백석<span class="icon"></span></span><span class="radiobutton type-mat" title="매트 석" style="display: none;">매트석<span class="icon"></span></span><span class="radiobutton type-premium" title="프리미엄 석" style="display: none;">프리미엄석<span class="icon"></span></span><span class="radiobutton type-relax" title="릴렉스 석" style="display: none;">릴렉스석<span class="icon"></span></span><span class="radiobutton type-comport" title="컴포트 석" style="display: none;">컴포트석<span class="icon"></span></span><span class="radiobutton type-mybox" title="My box 석" style="display: none;">MYBOX<span class="icon"></span></span><span class="radiobutton type-cdcSofa" title="쇼파 석" style="display: none;">소파<span class="icon"></span></span><span class="radiobutton type-cdcRecliner" title="리클라이너 석" style="display: none;">리클라이너<span class="icon"></span></span><span class="radiobutton type-coupleSofa" title="Couple 쇼파 석" style="display: none;">커플소파<span class="icon"></span></span><span class="radiobutton type-vibration" title="진동 석" style="display: none;">진동석<span class="icon"></span></span></div>
								</div>
								<div class="mouse_block"></div>
							</div>
						</div>
					</div>
					
					<!-- 시간표 변경 -->
					<div class="section_time_popup" id="section_time_popup">
						<div class="canvas">
							<div class="sprite">
								<div class="time-option">
									<span class="morning">조조</span><span class="night">심야</span>
								</div>
								<div class="time-list nano has-scrollbar" id="time_popup_list">
									<div class="content scroll-y" tabindex="-1" style="right: -17px;"></div>
								<div class="pane pane-y" style="display: none; opacity: 1; visibility: visible;"><div class="slider slider-y" style="height: 50px;"></div></div><div class="pane pane-x" style="display: none; opacity: 1; visibility: visible;"><div class="slider slider-x" style="width: 50px;"></div></div></div>
							</div>
							<div class="buttons">
								<a href="#" onclick="return false;" class="btn_ok"><span>확인</span></a>
								<a href="#" onclick="return false;" class="btn_cancel"><span>취소</span></a>
								<a href="#" onclick="return false;" class="sreader" onfocus="ticketStep2TimeSelectPopupHide();">시간표 변경 팝업 닫기</a>
							</div>
						</div>
						<div class="corner"></div>
					</div>
					<!-- 시간표 변경 -->
				</div>
					<!-- //step2 -->
					
					<!-- step3-->
					<div class="step step3" style="display: none;">
						<div class="reservResult">
							<table class="resultReserv">
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>
								<tr><td>예매번호</td><td></td><td>예약자</td><td></td></tr>							
							</table>
						</div>
					</div>
			
				</div><!-- end main content -->
				
				
			</div>
			<!-- //빠른예매 -->
		</div>
		<!-- //컨텐츠 -->

		<!-- 클릭한 예매정보 저장??? -->
		<div id="ticket_tnb" class="tnb_container ">
		<div class="tnb step1">
			<!-- btn-left -->
			<a class="btn-left" href="#" onclick="OnTnbLeftClick(); return false;" title="영화선택">이전단계로 이동</a>
			<div class="info movie">
				<span class="movie_poster"><img src="" alt="영화 포스터" style="display: none;"></span>
				<div class="row movie_title colspan2" style="display: none;">
					<span class="data letter-spacing-min ellipsis-line2"><a href="#" target="_blank" onmousedown="javascript:logClick('SUMMARY/영화상세보기');">영화정보 상세보기</a></span>
				</div>
				<div class="row movie_type" style="display: none;">
					<span class="data ellipsis-line1"></span>
				</div>
				<div class="row movie_rating" style="display: none;">
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="영화선택"></div>
			</div>
			<div class="info theater">
				<div class="row name" style="display: none;">
					<span class="header">극장</span>
					<span class="data letter-spacing-min ellipsis-line1"><a href="#" target="_blank" onmousedown="javascript:logClick('SUMMARY/극장상세보기');"><span class="sreader">극장정보 상세보기</span></a></span>
				</div>
				<div class="row date" style="display: none;">
					<span class="header">일시</span>
					<span class="data"></span>
				</div>
				<div class="row screen" style="display: none;">
					<span class="header">상영관</span>
					<span class="data"></span>
				</div>
				<div class="row number" style="display: none;">
					<span class="header">인원</span>
					<span class="data"></span>
				</div>
				<div class="placeholder" title="극장선택"></div>
			</div>
			<div class="info seat">
				<div class="row seat_name">
					<span class="header">좌석명</span>
					<span class="data">일반석</span>
				</div>
				<div class="row seat_no colspan3">
					<span class="header">좌석번호</span>
					<span class="data ellipsis-line3"></span>
				</div>
				<div class="placeholder" title="좌석선택"></div>
			</div>
			<div class="info payment-ticket">
				<div class="row payment-millitary">
					<span class="header">군인</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-adult">
					<span class="header">일반</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-youth">
					<span class="header">청소년</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-child">
					<span class="header">어린이</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>						
				<div class="row payment-special">
					<span class="header">우대</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-final">
					<span class="header">총금액</span>
					<span class="data"><span class="price">0</span><span class="won">원</span></span>
				</div>
			</div>
			<div class="info path">
				<div class="row colspan4">
					<span class="path-step2" title="좌석선택">&nbsp;</span>
					<span class="path-step3" title="결제">&nbsp;</span>
				</div>
			</div>
			<!-- btn-right -->
			<div class="tnb_step_btn_right_before" id="tnb_step_btn_right_before"></div>
			<a class="btn-right" id="tnb_step_btn_right" href="#" onclick="OnTnbRightClick(); return false;" title="좌석선택">다음단계로 이동 - 레이어로 서비스 되기 때문에 가상커서를 해지(Ctrl+Shift+F12)한 후 사용합니다.</a>
		</div>
	</div>
		<!-- end 예매한 영화정보저장??? -->

		<!-- bottom banner -->
		<div class="banner" id="ticket_bottom_banner"
			style="padding-top: 0px;">
			<a target="_blank" title="새창"
				href="http://ad.cgv.co.kr/click/CGV/CGV_201401/RIA@B_ticketing?ads_id=44087&amp;creative_id=62166&amp;click_id=82006&amp;event="
				style="background-color: rgb(255, 255, 255);"><span style="">?援</span><img
				src="http://adimg.cgv.co.kr/images/202010/Collectors/1030_996x140.jpg"
				alt="?援" onload="ticketNeedResize();"
				style="width: 996px; height: 140px"></a>
		</div>

		
	</div>



	<div class="blackscreen" style="display: none;" id="blackscreen"></div>
	<!-- loading -->
	<div class="loading" id="ticket_loading" style="display: none;">
		<div class="dimm"></div>
		<p class="loadWrap">
			<img
				src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/common/ajax-loader-w.gif"
				alt="로딩 애니메이션">
		</p>
	</div>
	<!-- iframe -->
	<iframe id="proxy_iframe" src="http://www.cgv.co.kr/Ticket/Proxy.html"
		scrolling="no" frameborder="0" width="0" height="0"
		style="display: none;" title="데이터 연동 숨김 프레임"></iframe>
	<iframe src="/CGV2011/RIA/RR999.aspx" name="rsvDataframe"
		id="rsvDataframe" scrolling="no" frameborder="0" width="0" height="0"
		style="display: none;" title="데이터 연동 프레임"></iframe>
	<!-- javascript 상위프레임에 있는 스크립트를 사용-->
	<!--<script type="text/javascript" src="http://img.cgv.co.kr/common/js/insightIS.js"></script>-->

</body>
</html> 