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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<h3>사원&nbsp;리스트</h3>
<hr>
<sf:form action="register">
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th>사&emsp;번</th>
		<th>이&emsp;름</th>
		<th>부 서 명</th>
		<th>직&emsp;급</th>
		<th>연 락 처</th>
		<th>이 메 일</th>		
		<th>입사일자</th>
		<th>퇴사일자</th>
	</tr>
	
	<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.m_id}</td>
		<!--회원정보 상세조회를 위해 a태그 추가  -->
		<td><a href="${path}/member/mContent.do?m_id=${row.m_id}">${row.m_name}</a></td>
		<td>${row.m_dept}</td>
		<td>${row.m_posit}</td>
		<td>${row.m_cell}</td>
		<td>${row.m_email_id}@${row.m_email_do}</td>
		<td>${row.m_com_date}</td>
		<td>${row.m_quit_date}</td>
	</tr>
	</c:forEach>
</table>
<div class="w3-center">
	<input type="button" id="button" class="btn btn-primary" value="회원등록" onclick="location.href='${path}/member/mRegist.do'">
</div>
</sf:form>
</div>
</body>
</html>