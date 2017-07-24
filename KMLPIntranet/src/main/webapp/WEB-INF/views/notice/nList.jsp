<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
</head>
<body>

<h2> 공지사항 </h2>

<form action="register">
<input type="button" value="공지사항등록" onclick="location.href='${path}/notice/nRegist.do'">
<table border="1" width="70%">
	<tr>
		<th>일련번호</th>
		<th>작성일자</th>
		<th>사번</th>
		<th>제목</th>
		<th>내용</th>
		<th>첨부파일</th>			
	</tr>
	
	<c:forEach var="row" items="${list}">
	<tr>
		
		<!--공지사항 상세조회를 위해 a태그 추가  -->
		<td><a href="${path}/notice/nContent.do?n_num=${row.n_num}">${row.n_num}</a></td>
		<td>${row.n_wdate}</td>
		<td>${row.n_id}</td>
		<td>${row.n_title}</td>
		<td>${row.n_content}</td>
		<td>${row.n_file}</td>				
	</tr>
	
	</c:forEach>
</table>
</form>
</body>
</html>