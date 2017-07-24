<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 목록</title>
</head>
<body>

<h2> 사원목록 </h2>

<form action="register">
<input type="button" value="회원등록" onclick="location.href='${path}/member/mRegist.do'">
<table border="1" width="70%">
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>부서명</th>
		<th>직급</th>
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
</form>




</body>
</html>