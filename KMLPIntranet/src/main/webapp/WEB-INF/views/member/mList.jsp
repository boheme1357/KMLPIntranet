<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/list.css">
</head>
<div id="wapper">
<body>
<h3>사원&nbsp;리스트</h3>
<hr>
<sf:form action="register">
<table border="1" width="100%">
	<tr>
		<th>사&emsp;번</th>
		<th>이&emsp;름</th>
		<th>부서명</th>
		<th>직&emsp;급</th>
		<th>연락처</th>
		<th>이메일</th>		
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
	<input type="button" id="button" class="w3-btn w3-round-large" value="회원등록" onclick="location.href='${path}/member/mRegist.do'">
</div>
</sf:form>
</body>
</div>
</html>