<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.tit-heading-wrap {
	margin-top: 5px !important;
}
thead th {
	font-size: 20px;
	text-align: center;
}

#list td {
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
<script type="text/javascript">
var serviceKey = "0b20e5176c77db3f706f2e8a0783dec3";$(function () {
    document.getElementById("today").valueAsDate = new Date();

    listOffice("yesterday");
});

function listOffice(type) {
	var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=" + serviceKey + "&targetDt=";
    date_list = $('#today').val().split('-');
    $("#title").empty();

    if(type == "select") {
        url = url + date_list[0] + date_list[1] + date_list[2];
        $("#title").append(date_list[1]+"월"+(date_list[2])+"일 박스 오피스")
    } else {
        url = url + date_list[0] + date_list[1] + (date_list[2]-1);
        $("#title").append(date_list[1]+"월"+(date_list[2]-1)+"일 박스 오피스")
    }
    
    $.ajax({
        url: url,
        type: "GET",
        dataType: "xml",
        success: function (mydata) {
            var str = "";

            if ($(mydata).find("dailyBoxOffice").text() == "") {
                $("#list").append("자료가 없습니다.");
                return;
            }
            $(mydata).find("dailyBoxOffice").each(function () {
            	str = str + "<tr>";
            	str = str + "<td style=\'color:orange; width: 50px; text-align:right;\'>"+$(this).find("rank").text() + "위 </td>";
            	str = str + "<td>"+$(this).find("movieNm").text()+"</td>";
            	var rank = "";
                rankInten = eval($(this).find("rankInten").text());
                if (rankInten > 0) {
                	rank = rank + "+" + rankInten
                } else if (rankInten < 0) {
                	rank = rank + "-" + Math.abs(rankInten)
                } else {
                	rank = rank + "➖"
                }
            	str = str + "<td style=\'width: 100px;\'>"+rank+"</td>";
            	str = str + "<td style=\'width: 100px; text-align:right;\'>"+$(this).find("audiAcc").text()+"</td>";
            	str = str + "</tr>";
            });
            $("#list").append(str);
        },
        error: function () {
            $("#list").append("Error ...");
        }
    });
}
</script>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" style="height: 400px;">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100" style="height: 400px;"
					src="images/event1.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 400px;"
					src="images/event2.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 400px;"
					src="images/notice2.jpg" alt="Third slide">
			</div>
			<!-- / 슬라이드 쇼 끝 -->
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev"
				onfocus="blur()"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next"
				onfocus="blur()"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>
	<div class="row" style="height: 400px; margin: 20px 10px;">
		<div class="col-sm-12 col-lg-6">
			<div style="display:none;"><input type="date" id="today"></div>
			<div class="tit-heading-wrap tit-evt" id="title"></div>
			<div style="margin-top: 5px;">
				<table>
					<thead style="background-color: #7A8DA0; color: white;">
					<tr>
						<th style="width: 50px;">순위</th>
						<th>제목</th>
						<th style="width: 100px;">전일대비</th>
						<th style="width: 100px;">누적관객수</th>
					</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-12 col-lg-6" id="map" style="width: 100%;"></div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee28883e1eb341f656e2215eb7b6e27e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('대구광역시 중구 국채보상로 537', function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="width:150px; text-align:center; padding:6px 0;">CBOX</div>'
				});
				infowindow.open(map, marker);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>
</body>
</html>