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
<h3>공지사항&nbsp;리스트</h3>
<hr>
<sf:form action="register">

<table border="1" width="100%">
   <tr>
      <th width="15%">일련번호</th>
      <th width="15%">사&emsp;번</th>
      <th width="30%">제&emsp;목</th>
      <th width="15%">첨부파일</th> 
      <th width="25%">작 성 일 자</th>        
   </tr>
   
   <c:forEach var="row" items="${list}">
   <tr>
      <!--공지사항 상세조회를 위해 a태그 추가  -->
      <td><a href="${path}/notice/nContent.do?n_num=${row.n_num}">${row.n_num}</a></td>
      <td>${row.n_id}</td>
      <td>${row.n_title}</td>
      <td>${row.n_file}</td> 
      <td>${row.n_wdate}</td>           
   </tr>
   </c:forEach>
</table>
<div class="w3-center">
	<input type="button" id="button" class="w3-btn w3-round-large" value="공지사항 등록" onclick="location.href='${path}/notice/nRegist.do'">
</div>
</sf:form>
</body>
</div>
</html>