<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 일일업무보고서 </h2>

<sf:form action="register">
<input type="button" value="문서등록" onclick="location.href='${path}/approve/aRegist.do'">
<table border="1" width="70%">
	<tr>
		<th>문서번호</th>
		<th>작성일자</th>
		<th>작성자(id)</th>
		<th>제목</th>
		<th>내용</th>
		<th>최종승인여부</th>		
		<th>결재횟수</th>
		
	</tr>
	
	<c:forEach var="row" items="${list}">
	<tr>
		
		<!--회원정보 상세조회를 위해 a태그 추가  -->
		<td><a href="${path}/document/dContent?d_num=${row.d_num}">${row.d_num}</a></td>
		<td>${row.d_date}</td>
		<td>${row.d_id}</td>
		<td>${row.d_title}</td>
		<td>${row.d_content}</td>
		<td>${row.d_final_check}</td>
		<td>${row.d_appr_cnt}</td>
		
	</tr>
	
	</c:forEach>
</table>
</sf:form>




</body>
</html>