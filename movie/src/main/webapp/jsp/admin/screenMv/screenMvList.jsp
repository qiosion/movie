<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mv"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
select {
	border-radius: 5px;
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

#btnDelete {
	background-color: #D85E48;
	padding: 5px;
	border-radius: 5px;
	color: white;
}
</style>
<script type="text/javascript">
	$(function() {
		init();
		movieList();
		movieInsert();
	});

	function init() {
		$("#initBtn").on("click", function() {
			$("#frm").each(function() {
				this.reset();
			});
		});
	}

	function movieList() {
		$.ajax({
			url : 'ajax/screenMvList.do',
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : movieListResult
		});
	}

	function movieListResult(data) {
		$("tbody[id='listCont']").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.mvTitle)).append(
					$('<td>').html(item.ttScrDate)).append(
					$('<td>').html(item.thName)).append(
					$('<td>').html(item.ttStart)).append(
					$('<td>').html(item.ttEnd)).append(
					$('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append(
							$('<td>').html(
									'<button id=\'btnDelete\'>삭제</button>'))
					.append(
							$('<td>').html(
									'<input type=\'hidden\' id=\'ttNum\'>')
									.val(item.ttNum)).appendTo(
							'tbody[id="listCont"]');
		});
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
					movieList();
					init();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});
	}

	function movieInsertResult(item) {
		$("tbody[id='listCont']").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.mvTitle)).append(
					$('<td>').html(item.ttScrDate)).append(
					$('<td>').html(item.thName)).append(
					$('<td>').html(item.ttStart)).append(
					$('<td>').html(item.ttEnd)).append(
					$('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append(
							$('<td>').html(
									'<button id=\'btnDelete\'>삭제</button>'))
					.append(
							$('<td>').html(
									'<input type=\'hidden\' id=\'ttNum\'>')
									.val(item.ttNum)).appendTo(
							'tbody[id="listCont"]');
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
								<td id="mvList" name="mvList"><c:if test="${!empty mvList}">
										<select id="mvNum" name="mvNum">
											<c:forEach var="sel" items="${mvList}">
												<option value="${sel.mvNum}">${sel.mvTitle}</option>
											</c:forEach>
										</select>
									</c:if></td>
								<td>상영관&nbsp;<span style="color: red;">*</span></td>
								<td id="thList" name="thList"><c:if test="${!empty thList}">
										<select id="thNum" name="thNum">
											<c:forEach var="th" items="${thList}">
												<option value="${th.thNum}">${th.thName}</option>
											</c:forEach>
										</select>
									</c:if></td>
							</tr>
							<tr>
								<td style="width: 25%;">상영 시작&nbsp;<span
									style="color: red;">*</span></td>
								<td><select id="ttStart" name="ttStart">
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
								<td style="width: 25%;"><select id="ttEnd" name="ttEnd">
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
									</c:if></td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-3">
			<button type="button" id="insertBtn" style="margin-right: 30px;"
				data-toggle="modal" data-target="#mvInsertPop"
				class="btn btn-success">등록</button>
			<button type="button" class="btn btn-dark"
				style="margin-right: 30px;" id="udpBtn" data-toggle="modal"
				data-target="#mvUdpPop">수정</button>
			<button type="button" class="btn btn-danger" id="initBtn">초기화</button>
		</div>
	</form>
	<hr />
	<div id="bottomList" style="min-height: 650px;" align="center">
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">제목</th>
					<th class="text-center">상영일</th>
					<th class="text-center">상영관</th>
					<th class="text-center">상영시작</th>
					<th class="text-center">상영종료</th>
					<th></th>
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
						<p style="text-align: center; margin: 10px; font-size: 20px;">${vo.mvTitle}
							을(를) 수정하시겠습니까?</p>
						<div style="text-align: center;">
							<button type="button" style="margin-right: 5px;"
								name="confirmUpt" id="confirmUpt" class="btn btn-success">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>