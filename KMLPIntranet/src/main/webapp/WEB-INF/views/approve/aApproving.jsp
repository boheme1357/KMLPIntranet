<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/apprList.css">
</head>

<body>
<div id="wapper">
<h3>결재 완료&nbsp;리스트</h3>
<hr>
<sf:form action="register">

<div class="w3-container w3-cell">
자신이 작성한 결재문서 리스트
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th>문서번호</th>
		<th>작성자(사번)</th>
		<th>제&emsp;목</th>
		<th>작 성 일 자</th>
		<th>총 결재 단계</th>
		<th>현재 결재 단계</th>
	</tr>
	
	<c:forEach var="row" items="${sentList}">
	<tr>
		<!--회원정보 상세조회를 위해 a태그 추가  -->
		<td>${row.d_num}</td>
		<td>${row.d_id}</td>
		<td><a href="${path}/approve/aContent.do?d_num=${row.d_num}">${row.d_title}</a></td>
		<td>${row.d_date}</td>
		<td>${row.d_final_cnt}</td>
		<td>${row.d_now_cnt}</td>

	</tr>
	</c:forEach>
</table>
</div>

<div class="w3-container w3-cell">
자신이 수신한 결재문서 리스트
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th>문서번호</th>
		<th>작성자(사번)</th>
		<th>제&emsp;목</th>
		<th>작 성 일 자</th>
		<th>총 결재 단계</th>	
		<th>현재 결재 단계</th>
	</tr>
	
	<c:forEach var="row" items="${receiveList}">
	<tr>
		<!--회원정보 상세조회를 위해 a태그 추가  -->
		<td><a href="${path}/document/dContent?d_num=${row.d_num}">${row.d_num}</a></td>
		<td>${row.d_id}</td>
		<td>${row.d_title}</td>
		<td>${row.d_date}</td>
		<td>${row.d_final_cnt}</td>
		<td>${row.d_now_cnt}</td>
	</tr>
	</c:forEach>
</table>
</div>

<div class="w3-center">
	<input type="button" id="button" class="w3-btn w3-round-large" value="문서&nbsp;등록" onclick="location.href='${path}/approve/aRegist.do'">
</div>
</sf:form>
</div>
</body>
</html>