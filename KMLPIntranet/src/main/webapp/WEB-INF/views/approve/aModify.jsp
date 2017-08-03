<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/docRegit.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {

			if (confirm("수정하시겠습니까?")) {

				document.form.submit();
			}
		});

	});

	$(document)
			.ready(
					function() {
						$("#btnDelete")
								.click(
										function() {

											if (confirm("삭제하시겠습니까?")) {
												document.form.action = "${path}/approve/aDelete.do?d_num=${dto.d_num}";
												document.form.submit();
											}
										});

					});

	//취소버튼 이벤트
	function check_cancel() {
		if (confirm("취소 하시겠습니까?")) {
			history.back();
		}
	}
</script>
</head>

<body>
	<div id="regit">
		<h3>결재문서 수정</h3>
		<hr>
		<sf:form name="form" method="post">

			<!-- 시작 : 결재문서 -->
			<div align="center">
				<!-- 결재란 start -->
				<div id='sign_div'
					style="width: 580px; height: 124px; margin: 10px;">
					<table align="left" id="sign_table">
						<!-- 도장이미지 가져오기 테스트 -->
						<thead>
							<c:forEach var='imgListVO' items='${signImgList}'>
								<th style="width: 100px; height: 34px; background-color: beige;">${imgListVO.ms_id}</th>
							</c:forEach>
						</thead>
						<tbody>
							<c:forEach var='imgListVO' items='${signImgList}'>
								<td style="height: 90px"><img
									src="${path}/resources/img/${imgListVO.ms_img}" id="img"
									width="50px" height="50px"></td>

							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 결재란 end -->

				<!-- 문서 start -->
				<div id='approve_div' style="width: 600px; margin-top: 10px;">
					<table align="center" id="approve_table">
						<tr colsapn="4" style="height: 20px;">
						</tr>
						<tr>
							<th colspan="4" style="font-size: 2em; height: 100px;">일일 업무
								일지</th>
						</tr>

						<tr>
							<th style="width: 110px; height: 40px; background-color: beige;">문서번호</th>
							<td style="width: 180px">${dto.d_num}</td>
							<th style="width: 110px; background-color: beige;">작성일자</th>
							<td style="width: 180px">${dto.d_date}</td>
						</tr>
						<tr>
							<th style="height: 40px; background-color: beige;">부 서 명</th>
							<td style="width: 180px">${ dto.d_dept }</td>
							<th style="background-color: beige;">작성자(사번)</th>
							<td style="width: 180px">${ dto.d_id }</td>
						</tr>
						<tr>
							<th style="height: 40px; background-color: beige;">제&emsp;목</th>
							<td colspan="3"><input name="d_title" value="${dto.d_title}" style="width: 100%; height: 40px; text-align: center"></td>
						</tr>
						<tr>
							<th style="height: 250px; background-color: beige;">금 일<br>
								<br>업무내용
							</th>
							<td colspan="3"><textarea name="d_content" id="d_content"
									style="resize: none; padding: 1em !important">${dto.d_content}</textarea></td>
						</tr>
						<tr colsapn="4" style="height: 20px;">
						</tr>



					</table>
				</div>
			</div>
			<!-- 끝: 결재문서 -->

			<!-- 시작: 결재 단계 표시 테이블 -->
			<table border="1" width="580px" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<th style="width: 110px; height: 40px; background-color: beige;">최종승인여부</th>
					<td><input value="${dto.d_final_condition}" readonly="readonly" style="text-align: center"></td>
				</tr>

				<tr>
					<th style="width: 110px; height: 40px; background-color: beige;">총 결재단계</th>
					<td><input name="d_final_cnt" value="${dto.d_final_cnt}" readonly="readonly" style="text-align: center"></td>
				</tr>

				<tr>
					<th style="width: 110px; height: 40px; background-color: beige;">현재 결재단계</th>
					<td><input name="d_now_cnt" value="${dto.d_now_cnt}" readonly="readonly" style="text-align: center"></td>
				</tr>
			</table><br>
			<!-- 끝: 결재 단계 표시 테이블 -->

			<!-- 버튼 그룹 -->
			<div class="w3-center">
				<div class="btn-group">
					<button type="button" id="btnUpdate" class="btn btn-primary"
						onclick="check_update();">수&nbsp;정</button>
					<button type="button" id="btnDelete" class="btn btn-primary"
						onclick="check_delete();">삭&nbsp;제</button>
					<button type="button" id="button_doc" class="btn btn-primary"
						onclick="check_cancel();">취&nbsp;소</button>
				</div>
				<br> <br>
				<div style="color: red;">${message}</div>
			</div>

		</sf:form>
	</div>
</body>
</html>