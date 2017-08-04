<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- jstl functions 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/content.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/docRegit.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 반려메시지 입력 창 추가 스크립트 -->
<script>
	$(document)
			.ready(
					function() {

						// 반려 버튼 클릭   
						$("#btn_return_1")
								.click(
										function() {
											var $btn = $(
													"<button id='btn_return_2' class='btn btn-primary'><br>")
													.text("전 송")
													.click(
															function() {
																if (confirm("반려 메시지를 보내시겠습니까?")) {
																	document.form.action = "${path}/approve/${dto.d_num}/${dto.d_now_cnt}/false/aResult.do";
																	document.form
																			.submit();
																} else {
																	return false;
																}
															});

											$("#return_div")
													.append(
															"<textarea name='ar_text' id='return_textarea' placeholder='반려 사유를 입력하세요' required></textarea><br>");
											$("#return_div").append($btn);
											event.preventDefault();

										});

						// 수정 버튼 클릭         
						$("#btn_update").click(function() {
							document.form.method = "get";
							document.form.submit();
						});

						// 승인 버튼 클릭         
						$("#btn_approve")
								.click(
										function() {
											if (confirm("승인하시겠습니까?")) {
												document.form.action = "${path}/approve/${dto.d_num}/${dto.d_now_cnt}/true/aResult.do";
												document.form.submit();
											} else {
												return false;
											}
										});

						// 반려 메시지 보내기 버튼 클릭
						$("#btn_cancel").click(function() {
							if (confirm("취소하시겠습니까?")) {
								$("#return_div").empty();
							} else {
								return false;
							}
							event.preventDefault();

						});

						(function($) {
							$.fn.simpleToggleBtn = function() {

								var btns = $(this).find("button"), // 버튼 그룹 내 버튼들;
								checkBox = $("input:checkbox");

								btns.on("click", function() { // 버튼들 중 클릭한 버튼에 함수;
									$(this).addClass("hide");
									$(this).siblings("button").removeClass(
											"hide");
									// 첫번째 버튼 기준으로 input 요소 체크!
									$(this).first().hasClass("hide") ? checkBox
											.attr("checked", true) : checkBox
											.attr("checked", false);
								});
							}
						}(jQuery));

						// 버튼 토글 실행
						$("#btn_group").simpleToggleBtn();

					});
</script>
</head>

<body>

	<div id="regit">
		<h3>결재문서 : ${dto.d_num} 상세보기</h3>
		<hr>

		<sf:form action="${path}/approve/aModify.do" name="form" method="post">
			<!-- 시작 : 결재문서 -->
			<div align="center">
				<!-- 결재란 start -->
				<div id='sign_div' border: 1px solid black
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
							<td colspan="3">${dto.d_title}</td>
						</tr>
						<tr>
							<th style="height: 250px; background-color: beige;">금 일<br>
								<br>업무내용
							</th>
							<td colspan="3"><textarea name="d_content" id="d_content"
									readonly="readonly" style="resize: none; padding:1em!important">${dto.d_content}</textarea></td>
						</tr>
						<tr colsapn="4" style="height: 20px;">
						</tr>



					</table>
				</div>
			</div>
			<!-- 끝: 결재문서 -->

			<!-- 시작 : 승인 반려 버튼 조건문 -->
			<c:if test="${m_id == dto.d_id}">
				<center>
					<input type="submit" class="btn btn-primary" value="수&nbsp;정"
						id="btn_update">
				</center>
			</c:if>

			<c:if test="${m_id != dto.d_id}">
				<center>


					<!--버튼 그룹-->
					<div id="btn_group">
						<button id="btn_approve" class="btn btn-primary">승&nbsp;인</button>
						<!--처음 보여지는 버튼-->
						<button id="btn_return_1" class="animation_test btn btn-warning">반&nbsp;려</button>
						<!--다음 보여지는 버튼-->
						<button id="btn_cancel"
							class="animation_test hide btn btn-primary">취&nbsp;소</button>
						<br>
						<!--Hide Checkbox-->
						<input type="checkbox" class="hide" />
					</div>
				</center>
				<br>
				<center>
					<div id='return_div'></div>
				</center>
			</c:if>

			<!-- 끝 : 승인 반려 버튼 조건문 -->

			<!-- 시작 : 반려 메시지 리스트 -->
			<br>
			<c:if
				test="${!empty returnContentList || fn:length(returnContentList) > 0}">

				<table border="1" width="800px" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<th colspan="5" style="font-size: 1.5em; height: 70px;">반려 메시지 리스트</th>
					</tr>
					<tr>
						<th style="width: 8%; height: 40px; background-color: beige;">작 성 자</th>
						<th style="width: 20%; height: 40px; background-color: beige;">작성일자</th>
						<th style="width: 8%; height: 40px; background-color: beige;">결재단계</th>
						<th style="width: 8%; height: 40px; background-color: beige;">반려횟수</th>
						<th style="width: 56%; height: 40px; background-color: beige;">반려사유</th>
					</tr>
					<c:forEach var='row' items='${returnContentList}'>
						<tr>
							<td style="height: 40px;">${ row.ar_id }</td>
							<td style="height: 40px;">${ row.ar_date }</td>
							<td style="height: 40px;">${ row.ar_cnt }</td>
							<td style="height: 40px;">${ row.ar_return_cnt }</td>
							<td style="height: 40px;">${ row.ar_text }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<!-- 끝 : 반려 메시지 리스트 -->



			<input type='hidden' name='d_num' value='${dto.d_num}'>
			<br>
		</sf:form>
	</div>
</body>
</html>