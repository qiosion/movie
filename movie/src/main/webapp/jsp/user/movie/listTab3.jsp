<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
#ok {
	margin-left: 10px;
	background-color: #F6D578;
	padding: 8px;
	border-radius: 5px;
	color: black;
}

#title {
	margin: 10px;
}

#list{
	padding: 10px;
	font-size: 20px;
}
</style>
</head>
<body>
<script>
var serviceKey = "0b20e5176c77db3f706f2e8a0783dec3";

$(function () {
    document.getElementById("today").valueAsDate = new Date();

    $("#ok").click(function () {
        $("#list").empty();

        listOffice("select");
    });
    
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
            	$("#list").empty();
                $("#list").append("자료가 없습니다.");
                return;
            }
            $(mydata).find("dailyBoxOffice").each(function () {
                str = str + "<span style=\'color:orange; display:inline-block; width:47px; margin-right:10px; text-align:right;\'>"+$(this).find("rank").text() + "위 </span>"

                str = str + $(this).find("movieNm").text();

                str = str + " (<span style=\'color:red;\'>전일대비</span> ";
                rankInten = eval($(this).find("rankInten").text());
                if (rankInten > 0) {
                    str = str + "+" + rankInten + ", "
                } else if (rankInten < 0) {
                    str = str + "-" + Math.abs(rankInten) + ", "
                } else {
                    str = str + rankInten + ", "
                }

                str = str + "<span style=\'color:navy;\'>누적관객수</span> " + $(this).find("audiAcc").text() + "명)<br>";
            });
            $("#list").append(str);
        },
        error: function () {
            $("#list").append("Error ...");
        }
    });
}
</script>
	<div class="movietop">
		<ul class="tabs">
			<li class="tab-link" data-tab="tab-1"><a href="movieListForm.do">전체 영화</a></li>
			<li class="tab-link" data-tab="tab-2"><a
				href="movieExpectList.do">상영 예정작</a></li>
			<li class="tab-link current" data-tab="tab-3"><a
				href="movieChartList.do">일별 박스오피스</a></li>
		</ul>
	</div>
	<div id="tab-3" class="tab-content current">
		<div id="choice" style="margin: 10px;">
			<input type="date" id="today" style="height: 30px; border-radius: 5px;">
			<button id="ok">확인</button>
		</div>
		
		<div class="tit-heading-wrap tit-evt" id="title">
		</div>
		<hr>
		<div id="list"></div>
	</div>
</body>
</html>