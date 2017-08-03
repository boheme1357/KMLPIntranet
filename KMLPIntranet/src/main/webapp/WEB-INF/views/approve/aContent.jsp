<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- jstl functions 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
																	document.form.submit();
																} else {
																	return false;
																}
															});

											$("#return_div")
											.append("<textarea name='ar_text' id='return_textarea' placeholder='반려 사유를 입력하세요' required></textarea><br>");
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
									$(this).siblings("button").removeClass("hide");
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
	<div id="wapper">
		<h3>결재문서 : ${dto.d_num} 상세보기</h3>
		<hr>
		
		<sf:form action="${path}/approve/aModify.do" name="form" method="post">
			<table border="1" width="100%" cellpadding="0" cellspacing="0">

				<tr>
					<th width="15%">문서번호</th>
					<td>${dto.d_num}</td>
				</tr>

				<tr>
					<th>작성일자</th>
					<td>${dto.d_date}</td>
				</tr>

				<tr>
					<th>작성자(사번)</th>
					<td>${dto.d_id}</td>
				</tr>

				<tr>
					<th>제&emsp;목</th>
					<td>${dto.d_title}</td>
				</tr>

				<tr>
					<th height="300px">내&emsp;용</th>
					<td>${dto.d_content}</td>
				</tr>

				<tr>
					<th>최종승인여부</th>
					<td>${dto.d_final_condition}</td>
				</tr>

				<tr>
					<th>결재단계</th>
					<td>${dto.d_now_cnt}/${dto.d_final_cnt}</td>
				</tr>

			</table>

			<!-- 시작 : 승인 반려 버튼 조건문 -->
			<c:if test="${m_id == dto.d_id}">
				<center>
					<input type="submit" class="btn btn-primary" value="수&nbsp;정" id="btn_update">
				</center>
			</c:if>

			<c:if test="${m_id != dto.d_id}">
				<center>
					

					<!--버튼 그룹-->
					<div id="btn_group">
						<button id="btn_approve" class="btn btn-primary">승&nbsp;인</button>
						<!--처음 보여지는 버튼-->
						<button id="btn_return_1" class="animation_test btn btn-primary">반&nbsp;려</button>
						<!--다음 보여지는 버튼-->
						<button id="btn_cancel" class="animation_test hide btn btn-primary">취&nbsp;소</button><br>
						<!--Hide Checkbox-->
						<input type="checkbox" class="hide" />
					</div>
				</center><br>
				<center>
					<div id='return_div'></div>
				</center>
			</c:if>

			<!-- 끝 : 승인 반려 버튼 조건문 -->
			
			
			<!-- 시작 : 반려 메시지 리스트 -->
			<c:if test="${!empty returnContentList || fn:length(returnContentList) > 0}">
			<h1>반려 메시지 리스트</h1>
				
					<table border="1" width="100%" cellpadding="0" cellspacing="0" >
						<tr>
							<th>작성자</th>
							<th>작성일자</th>
							<th>결재단계</th>
							<th>반려횟수</th>
							<th>반려사유</th>
						</tr>
				<c:forEach var='row' items='${returnContentList}'>
						<tr>
							<td>${ row.ar_id }</td>
							<td>${ row.ar_date }</td>
							<td>${ row.ar_cnt }</td>
							<td>${ row.ar_return_cnt }</td>
							<td>${ row.ar_text }</td>
						</tr>
				</c:forEach>
					</table>				
			</c:if>
			<!-- 끝 : 반려 메시지 리스트 -->
			
			
			<input type='hidden' name='d_num' value='${dto.d_num}'><br>
		</sf:form>
	</div>
</body>
</html>