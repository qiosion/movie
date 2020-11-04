<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var serviceKey = "0b20e5176c77db3f706f2e8a0783dec3";
	
	$(function(){
		$("#export").click(function() {
			console.log("export");
			// todo : 키워드 null 체크 안됨
	    	if ($("#keyword").val() == null || $("#keyword").val() == ""){
	    		console.log("영화 제목을 입력하세요");
	    	} else {
		    	var chk = $("input[type='checkbox']:checked");
		    	if(chk) {
		    		$("#result").html(chk.parent().children().nextUntil("input[type='checkbox']"));
		    	} 	
	    	}
		});
	});
	
	function formCheck() {
		if (keyword.value == "") {
			alert("검색어를 입력해주세요.");
			return;
		} else {
			showMvList();
		}
	}

	function showMvList() {
		console.log("영화목록");
        var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=" + serviceKey + "&movieNm="+$("#keyword").val();
    	
        $.ajax({
            url: url,
            type: "GET",
            dataType: "xml",
            success: function (mydata) {
                var str = "";

                if ($(mydata).find("movie").text() == "") {
                    $("#list").append("조회된 영화가 없습니다.");
                    return;
                }
                $(mydata).find("movie").each(function () {
					//str += $(this).find("movieCd").text() + "<br>번";
                    //str = $(this).find("movieNm").text();
                    //$("#list").append($(this).find("movieNm").text());
					movie($(this).find("movieCd").text());
                });
            },
            error: function () {
                $("#list").append("영화 조회 에러");
            }
        });
	}
	
	function chkBox(a) {
		var obj = document.getElementsByName("selMV");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != a) {
				obj[i].checked = false;
			}
		}
	}
	
	function movie(movieCd) {
		console.log("movie : " + movieCd);
	    $("#result").empty();
	    var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=" + serviceKey + "&movieCd="+ movieCd;
	    $.ajax({
	        url: url,
	        type: "GET",
	        dataType: "xml",
	        success: function (movie_data) {
	            console.log(movie_data);
	            var str = "";
	      //      str = str + "<img src='" + $(movie_data).find("imgSrc").text() + "'>";
	            str = str + "<div id='mvDiv' name='mvDiv'><input type='checkbox' name='selMV' id='selMV' onclick='chkBox(this)'><h2 name='mvTitle' id='mvTitle'>" + $(movie_data).find("movieNm").text() + "(";
	            str = str + $(movie_data).find("movieNmEn").text() + ")</h2>";
	            str = str + "<p name='mvCont' id='mvCont'>" + $(movie_data).find("nationNm").text() + ", 개봉일 : " + $(movie_data).find("openDt").text() + ", 상영 시간 : " + $(movie_data).find("showTm").text() + "분</p>";
	
	            //str = str + "<ul>";
	            /* $(movie_data).find("actor").each(function () {
	                str = str + "<li>" + $(this).find("peopleNm").text() + "</li>";
	            }); */
	            $(movie_data).find("audit").each(function () {
	                str = str + "<p name='mvAge' id='mvAge'>" + $(this).find("watchGradeNm").text() + "</p>";
	            });
	            str = str + "</div>";
	            $("#result").append(str);
	        },
	        error: function () {
	            alert("영화 정보 불러오기 에러");
	        }
	    });
	}
</script>
</head>
<body>
	<h2>영화 등록 화면</h2>
	<button type="button" id="searchBtn" data-toggle="modal"
		data-target="#searchPopup">검색</button>
	<form id="frm" name="frm" action="mvRegist.do" method="post">
		<table border="1" id="mvReg">
			<tr>
				<th width="150">제목</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="제목 입력"></td>
			</tr>
			<tr>
				<th width="150">감독</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="감독 입력"></td>
			</tr>
			<tr>
				<th width="150">배급사</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="배급사 입력"></td>
			</tr>
			<tr>
				<th width="150">등장인물</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="등장인물 입력"></td>
			</tr>
			<tr>
				<th width="150">개봉일</th>
				<td width="500" align="center"><input type="date"></td>
			</tr>
			<tr>
				<th width="150">종료일</th>
				<td width="500" align="center"><input type="date"></td>
			</tr>
			<tr>
				<th width="150">줄거리</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="줄거리 입력"></td>
			</tr>
			<tr>
				<th width="150">장르</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id" placeholder="장르 입력"></td>
			</tr>
			<tr>
				<th width="150">포스터 이미지</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
			<tr>
				<th width="150">썸네일</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
			<tr>
				<th width="150">티저영상</th>
				<td width="500" align="center"><input type="text" id="id"
					name="id"></td>
			</tr>
		</table>
	</form>

	<!-- 팝업창 -->
	<div class="modal" id="searchPopup">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">영화 검색</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="search">
						<input type="text" name="keyword" id="keyword"
							placeholder="영화 제목을 입력하세요">
						<button id="searchButton" type="button"
							onclick="return formCheck()">검색</button>
					</div>
					<div id="list"></div>
					<div id="result"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" name="export" id="export" class="btn btn-success">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>