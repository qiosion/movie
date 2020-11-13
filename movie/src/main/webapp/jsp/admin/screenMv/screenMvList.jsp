<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mv"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
input[type='date'] {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}
select.form-control {
    height: calc(1.5em + .75rem + 2px) !important;
    width: 100% !important;
}

.btn-group input {
	margin: 0 10px !important;
}

#bottomList td {
	text-align: center !important;
	vertical-align: middle !important;
}

#btnSelect {
	background-color: #689E8E;
	padding: 5px;
	border-radius: 5px;
	color: white;
}

/* #btnDelete {
	background-color: #D85E48;
	padding: 5px;
	border-radius: 5px;
	color: white;
} */
#topBtn {
	posotion: fixed;
	float: right;
	bottom: 50px;
	display: none;
	z-index: 999;
	height: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		init();
		movieList();
		movieInsert();
		movieUpdate()
		mvDetail();
		//movieDelete();

		$(window).scroll(function() {
			if ($(this).scrollTop() > 400) {
				$("#topBtn").fadeIn();
			} else {
				$("#topBtn").fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
		
		$("#menuSearchBtn").click(function() {
			searchType = 'title';
			keyword = $("#keyword").val();
			movieList(searchType, keyword);
			$("#keyword").val("");
		});
	});

	function init() {
		$("#initBtn").on("click", function() {
			$("#frm").each(function() {
				this.reset();
			});
			$("#TTNum").val("");
			$('select[name="mvNum"]').attr("disabled", false);
			// 초기화시 onchange? 되서 지금 선택된 영화의 개봉 시작, 종료일 받기... todo
		});
	}

	/* function movieDelete() {
		$("body").on("click", "#btnDelete", function() {
			var ttNum = $(this).closest('tr').find('#ttNum').val();
			var result = confirm(ttNum + "번 상영 영화를 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : 'ajax/screenMvDelete.do',
					data : {
						ttNum : ttNum
					},
					dataType : 'json',
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						movieList();
					}
				});
			}
		});
	} */

	function movieList(searchType, keyword) {
		$.ajax({
			url : 'ajax/screenMvList.do',
			type : 'GET',
			dataType : 'json',
			data : {
				searchType : searchType,
				keyword : keyword
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : movieListResult
		});
	}

	function movieListResult(data) {
		$("tbody[id='listCont']").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.mvTitle))
					.append($('<td>').html(item.ttScrDate))
					.append($('<td>').html(item.thName))
					.append($('<td>').html(item.ttStart))
					.append($('<td>').html(item.ttEnd))
					.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					//.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
					.append($('<td>').html('<input type=\'hidden\' id=\'ttNum\' value=\''+item.ttNum+'\'>'))
					.appendTo('tbody[id="listCont"]');
		});
	}

	function mvDetail() {
		$("body").on("click", "#btnSelect", function() {
			var ttNum = $(this).closest('tr').find('#ttNum').val();

			$.ajax({
				url : 'ajax/screenMvDetail.do',
				data : {
					ttNum : ttNum
				},
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : movieDetailResult
			});
		});
	}

	function movieDetailResult(data) {
		$('select[name="mvNum"]').val(data.mvNum).attr("selected", "selected");
		$('select[name="mvNum"]').attr("disabled", true);
		$('select[name="thNum"]').val(data.thNum).attr("selected", "selected");
		$('select[name="ttStart"]').val(data.ttStart).attr("selected",
				"selected");
		$('select[name="ttEnd"]').val(data.ttEnd).attr("selected", "selected");
		$('input[type="date"]').val(data.ttScrDate);

		// hidden 값
		$('#TTNum').val(data.ttNum);
		$('#strDate').val(data.strdate);
		$('#finDate').val(data.findate);
	}

	function chkInsert() {
		var num = $("#TTNum").val();
		if (num != "") {
			alert("수정 중인 상영 정보입니다. 초기화 후 등록해주세요.");
		} else {
			$(".text-center.mt-3 .btn.btn-success").attr("data-target",
					"#mvInsertPop");
		}
	}

	function movieInsert() {
		$("#confirmInsert").on('click', function() {
			var form = $("#frm")[0];
			var data = new FormData(form);

			if (!$("#ttScrDate").val()) {
				alert("상영일을 선택 해주세요");
				return false;
			}

			$.ajax({
				url : 'ajax/screenMvInsert.do',
				dataType : 'json',
				method : 'post',
				data : $("#frm").serialize(),
				success : function(response) {
					if (response.result) {
						movieList();

						$("#frm").each(function() {
							this.reset();
						});
						alert("등록되었습니다.");
					} else {
						alert("중복된 상영 정보가 있습니다.");
					}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});
	}

	function checkNum() {
		var num = $("#TTNum").val();
		if (num == "") {
			alert("등록 후 수정해 주세요.");
		} else {
			$(".text-center.mt-3 .btn.btn-dark").attr("data-target",
					"#mvUptPop");
		}
	}

	function movieUpdate() {
		$('#confirmUpt').on('click', function() {
			$.ajax({
				url : "ajax/screenMvUpdate.do",
				dataType : 'json',
				data : $("#frm").serialize(),
				success : function(data) {
					movieList();
					$("#frm").each(function() {
						this.reset();
					});
					$("#ttNum").val("");
					$('select[name="mvNum"]').attr("disabled", false);
					alert("수정되었습니다.");
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});
	}
</script>
</head>
<body>
	<form id="frm" name="frm" style="margin-bottom: 10px;">
		<div class="col-sm-12 pt-3">
			<div class="card">
				<div class="card-header card-header-primary">
					<span class="card-title" id="movieTitle"> <i
						class="fas fa-square"></i>상영 영화
					</span>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<tr style="line-height: 32px;">
								<td>제목&nbsp;<span style="color: red;">*</span></td>
								<td id="mvList"><c:if test="${!empty mvList}">
										<select id="mvNum" name="mvNum" class="form-control">
											<c:forEach var="sel" items="${mvList}">
												<option value="${sel.mvNum}">${sel.mvTitle}</option>
											</c:forEach>
										</select>
									</c:if></td>
								<td>상영관&nbsp;<span style="color: red;">*</span></td>
								<td id="thList"><c:if test="${!empty thList}">
										<select id="thNum" name="thNum"  class="form-control">
											<c:forEach var="th" items="${thList}">
												<option value="${th.thNum}">${th.thName}</option>
											</c:forEach>
										</select>
									</c:if></td>
							</tr>
							<tr>
								<td style="width: 25%;">상영 시작&nbsp;<span
									style="color: red;">*</span></td>
								<td><select id="ttStart" name="ttStart" class="form-control">
										<option value="0" disabled>상영시작</option>
										<option value="09:00">09:00</option>
										<option value="09:30">09:30</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
								</select></td>
								<td style="width: 25%;">상영 종료&nbsp;<span
									style="color: red;">*</span></td>
								<td style="width: 25%;"><select id="ttEnd" name="ttEnd" class="form-control">
										<option value="0" disabled>상영종료</option>
										<option value="10:00">10:00</option>
										<option value="10:30">10:30</option>
										<option value="11:00">11:00</option>
										<option value="11:30">11:30</option>
										<option value="12:00">12:00</option>
										<option value="12:30">12:30</option>
										<option value="13:00">13:00</option>
										<option value="13:30">13:30</option>
										<option value="14:00">14:00</option>
										<option value="14:30">14:30</option>
										<option value="15:00">15:00</option>
										<option value="15:30">15:30</option>
										<option value="16:00">16:00</option>
										<option value="16:30">16:30</option>
										<option value="17:00">17:00</option>
										<option value="17:30">17:30</option>
								</select></td>
							</tr>
							<tr>
								<td>상영일&nbsp;<span style="color: red;">*</span></td>
								<td style="width: 25%;"><input type="date" name="ttScrDate"
									id="ttScrDate" class="form-control" value=""></td>
								<td></td>
								<td><c:if test="${!empty thList}">
										<c:forEach var="th" items="${thList}" end="0">
											<input type="hidden" id="thMax" name="thMax"
												value="${th.thMax}">
										</c:forEach>
									</c:if> <c:if test="${!empty mvList}">
										<c:forEach var="mv" items="${mvList}" end="0">
											<input type="hidden" id="strDate" name="strDate"
												value="${mv.strdate}">
											<input type="hidden" id="finDate" name="finDate"
												value="${mv.findate}">
										</c:forEach>
									</c:if> <input type="hidden" id="TTNum" name="TTNum"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="button" id="insertBtn" onclick="chkInsert()"
				style="margin-right: 30px;" data-toggle="modal"
				class="btn btn-success">등록</button>
			<button type="button" class="btn btn-dark"
				style="margin-right: 30px;" id="udpBtn" onclick="checkNum()"
				data-toggle="modal">수정</button>
			<button type="button" class="btn btn-danger" id="initBtn">초기화</button>
		</div>
	</form>
	<div align="right">
		<form name="search" id="search">
			<input type="hidden" name="action" value="list" /> <input
				type="hidden" name="p" value="1" /> <select id="searchType"
				name="searchType">
				<option value="title">제목</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="영화 제목">
			<button type="button" id="menuSearchBtn">검색</button>
		</form>
	</div>
	<div id="bottomList" style="min-height: 650px;" align="center">
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">제목</th>
					<th class="text-center">상영일</th>
					<th class="text-center">상영관</th>
					<th class="text-center">상영시작</th>
					<th class="text-center">상영종료</th>
					<!-- <th></th> -->
					<th></th>
				</tr>
			</thead>
			<tbody id="listCont"></tbody>
		</table>
	</div>

	<div class="modal" id="mvInsertPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">상영 영화 등록</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm">
						<p style="text-align: center; margin: 10px; font-size: 20px;">상영
							영화를 등록 하시겠습니까?</p>
						<div style="text-align: center;">
							<button type="button" style="margin-right: 5px;"
								name="confirmInsert" id="confirmInsert" class="btn btn-success"
								data-dismiss="modal">등록</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="mvUptPop">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title">영화 수정</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="frm" name="frm">
						<p style="text-align: center; margin: 10px; font-size: 20px;">
							상영 시간을 수정하시겠습니까?</p>
						<div style="text-align: center;">
							<button type="button" style="margin-right: 5px;"
								name="confirmUpt" id="confirmUpt" class="btn btn-success"
								data-dismiss="modal">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<img alt="TOP" id="topBtn"
		src="${pageContext.request.contextPath}/images/top.png">
</body>
</html>