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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/list.css">

<style>
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
</style>
</head>

<body>
<div id="wapper">
<h3>결재&nbsp;반려&nbsp;리스트</h3>
<hr>
<sf:form action="register">

<p><b>자신이 작성한 결재문서 중 반려된 문서 리스트</b></p>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="10%">문서번호</th>
		<th width="12%">작성자(사번)</th>
		<th width="25%">제&emsp;목</th>
		<th width="20%">작 성 일 자</th>
		<th>최종승인여부</th>	
		<th>결재횟수</th>
	</tr>
	
	<c:forEach var="row" items="${returnList}">
	<tr>
		<!--회원정보 상세조회를 위해 a태그 추가  -->
		<td>${row.d_num}</td>
		<td>${row.d_id}</td>
		<td><a href="${path}/approve/${row.d_num}/aContent.do">${row.d_title}</a></td>
		<td>${row.d_date}</td>
		<td>${row.d_final_condition}</td>
		<td>${row.d_final_cnt}</td>
	</tr>
	</c:forEach>
</table>


</sf:form>
</div>
</body>
</html>