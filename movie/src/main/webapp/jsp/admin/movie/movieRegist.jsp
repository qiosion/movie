<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var serviceKey = "0b20e5176c77db3f706f2e8a0783dec3";

	$(function() {
		$("#export").click(function() {
			console.log("export");
			var chk = $("input[type='checkbox']:checked");
			if (chk) {
				$("#mvTitle").val(chk.parent().children('#mvTitle').text());
				$("#mvDir").val(chk.parent().children('#mvDir').text());
				$("#mvCont").val(chk.parent().children('#mvCont').text());
				$("#mvAge").val(chk.parent().children('#mvAge').text());
				$("#mvType").val(chk.parent().children('#mvType').text());
				$("#mvCha").val(chk.parent().children('#mvCha').text());
				
				var strdate = chk.parent().children('#strdate').text();
				console.log("?? " + strdate);
				var yyyy = strdate.substring(0, 4);
				var mm = strdate.substring(4, 6);
				var dd = strdate.substring(6, 8);
				console.log(">>> " + yyyy + "-" + mm + "-" + dd);
				$("#strdate").val(yyyy + "-" + mm + "-" + dd);
				$("#searchPopup").modal("hide"); //닫기 
				//$("#strdate").val(chk.parent().children('#strdate').text());
			}
		});

		movieInsert();
	});

	function clearSearch() {
		$("#keyword").val("");
	}

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
		var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key="
				+ serviceKey + "&movieNm=" + $("#keyword").val();

		$.ajax({
			url : url,
			type : "GET",
			dataType : "xml",
			success : function(mydata) {
				var str = "";

				if ($(mydata).find("movie").text() == "") {
					$("#list").append("조회된 영화가 없습니다.");
					return;
				}
				$(mydata).find("movie").each(function() {
					//str += $(this).find("movieCd").text() + "<br>번";
					//str = $(this).find("movieNm").text();
					//$("#list").append($(this).find("movieNm").text());
					movie($(this).find("movieCd").text());
				});
			},
			error : function() {
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
		var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key="
				+ serviceKey + "&movieCd=" + movieCd;
		$
				.ajax({
					url : url,
					type : "GET",
					dataType : "xml",
					success : function(movie_data) {
						console.log(movie_data);
						var str = "";
						//      str = str + "<img src='" + $(movie_data).find("imgSrc").text() + "'>";
						str = str
								+ "<div><input type='checkbox' name='selMV' id='selMV' onclick='chkBox(this)'><h2 name='mvTitle' id='mvTitle'>"
								+ $(movie_data).find("movieNm").text() + "(";
						str = str + $(movie_data).find("movieNmEn").text()
								+ ")</h2>";
						str = str + "<p name='mvCont' id='mvCont'>"
								+ $(movie_data).find("nationNm").text()
								+ ", 상영 시간 : "
								+ $(movie_data).find("showTm").text() + "분</p>";
						str = str + "<p name='strdate' id='strdate'>"
								+ $(movie_data).find("openDt").text() + "</p>";

						//str = str + "<ul>";
						/* $(movie_data).find("actor").each(function () {
						    str = str + "<li>" + $(this).find("peopleNm").text() + "</li>";
						}); */
						$(movie_data).find("director").each(
								function() {
									str = str + "<p name='mvDir' id='mvDir'>"
											+ $(this).find("peopleNm").text()
											+ "</p>";
								});
						var audit = $(movie_data).find("audit");
						for (var i = 0; i < 1; i++) {
							str = str + "<p name='mvAge' id='mvAge'>"
									+ audit.find("watchGradeNm").text() + "</p>";
						}
						
						var actor = $(movie_data).find("actor");
						for(var i = 0;i<5; i++) {
							str = str + "<p name='mvCha' id='mvCha'>"
							+ audit.find("peopleNm").text() + "</p>";
						}

						$(movie_data).find("genre").each(
								function() {
									str = str + "<p name='mvType' id='mvType'>"
											+ $(this).find("genreNm").text()
											+ "</p>";
								});
						str = str + "</div>";
						$("#result").append(str);
					},
					error : function() {
						alert("영화 정보 불러오기 에러");
					}
				});
	}

	function movieInsert() {
		$("#regiBtn").on("click", function() {
			// multipart
			var form = $("#frm")[0];
			var data = new FormData(form);

			// 빈칸 체크

			console.log("movieInsert");

			$.ajax({
				url : "ajax/mvRegist.do",
				dataType : "json",
				method : "post",
				processData : false,
				contentType : false,
				//data : $("#frm").serialize(),
				data : data,
				success : function(response) {
					// 목록으로 이동
					alert("등록 성공");
					location.href = "mvList.do";
				},
				error : function(xhr, status, message) {
					alert("status : " + status + " error : " + message);
				}
			});
		});
	}
</script>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="movieTitle"> <i
						class="fas fa-square"></i>영화 등록
					</span>
					<button type="button" id="searchBtn" data-toggle="modal"
						data-target="#searchPopup">검색</button>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr style="line-height: 32px;">
									<td>제목&nbsp;<span style="color: red;">*</span></td>
									<td><input type="text" name="mvTitle" id="mvTitle"
										class="form-control" value=""></td>
									<td>감독&nbsp;<span style="color: red;">*</span></td>
									<td><input type="text" name="mvDir" id="mvDir"
										class="form-control" value=""></td>
								</tr>
								<tr>
									<td>개봉일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="strdate" id="strdate"
										class="form-control" value=""></td>
									<td>상영 종료일&nbsp;<span style="color: red;">*</span></td>
									<td><input type="date" name="findate" id="findate"
										class="form-control" value=""></td>
								</tr>
								<tr>
									<td>장르</td>
									<td><input type="text" name="mvType" id="mvType"
										class="form-control" value=""></td>
									<td>관람 연령</td>
									<td><input type="text" name="mvAge" id="mvAge"
										class="form-control" value=""></td>
								</tr>
								<tr>
									<td>등장인물</td>
									<td colspan="3"><input type="text" name="mvCha" id="mvCha"
										class="form-control mb-3" value=""></td>
								</tr>
								<tr>
									<td>줄거리</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvSum"
											id="mvSum"></textarea></td>
								</tr>
								<tr>
									<td>설명</td>
									<td colspan="3"><textarea rows="3" cols="60" name="mvCont"
											id="mvCont"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="pt-3"></div>
			<div class="card">
				<div class="card-header">
					<i class="fas fa-square"></i> 티저 / 스틸컷 등록
				</div>
				<div class="card-body">
					<table class="table">
						<tbody>
							<tr style="line-height: 32px; text-align: center;">
								<td style="width: 50px;">포스터 이미지&nbsp;<span
									style="color: red;">*</span></td>
								<td style="margin-right: 5px; width: 50px;"><input
									type="file" id="mvPost" name="mvPost" style="width: 50px;"></td>
								<td style="width: 50px;">스틸컷</td>
								<td style="width: 50px;"><input type="file" id="mvImg"
									name="mvImg" style="width: 50px;"></td>
							</tr>
							<tr style="float: center; text-align: center;">
								<td>티저 영상</td>

								<td><input type="file" id="mvTeaser" name="mvTeaser"
									style="width: 50px;"></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</form>
	<div class="text-center mt-3">
		<button type="button" id="regiBtn" style="margin-right: 30px;"
			class="btn btn-success">등록</button>
		<button type="button" class="btn btn-danger"
			onclick="location.href='mvList.do'">취소</button>
	</div>

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
					<button type="button" name="export" id="export"
						class="btn btn-success">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="clearSearch()">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>