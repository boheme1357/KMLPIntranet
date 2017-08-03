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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/list.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div id="wapper">
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
      <td>${row.n_num}</td>
      <td>${row.n_id}</td>
      <td><a href="${path}/notice/nContent.do?n_num=${row.n_num}">${row.n_title}</a></td>
      <td>${row.n_file}</td> 
      <td>${row.n_wdate}</td>           
   </tr>
   </c:forEach>
</table>
<div class="w3-center">
	<input type="button" id="button" class="btn btn-primary" value="공지사항 등록" onclick="location.href='${path}/notice/nRegist.do'">
</div>
</sf:form>
</div>
</body>
</html>