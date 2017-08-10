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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/list.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	.nav-tabs li a {
	    color: #777;
	}

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
<h3>전자결재&nbsp;리스트</h3>
<hr>
<sf:form action="register">

<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">발신문서</a></li>
    <li><a data-toggle="tab" href="#menu1">수신문서</a></li>
</ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active"><br>
    <p><b>자신이 작성한 결재문서 리스트</b></p>
	<table border="1" width="100%">
		<tr>
			<th width="10%">문서번호</th>
			<th width="10%">사&emsp;번</th>
			<th width="25%">제&emsp;목</th>
			<th width="20%">작 성 일 자</th>
			<th>최종승인여부</th>	
			<th>결재횟수</th>
		</tr>
		
		<c:forEach var="row" items="${sentList}">
		<tr>
			<td><a href="${path}/document/dContent?d_num=${row.d_num}">${row.d_num}</a></td>
			<td>${row.d_id}</td>
			<td><a href="${path}/document/dContent?d_num=${row.d_num}">${row.d_title}</a></td>
			<td>${row.d_date}</td>
			<td>${row.d_final_condition}</td>
			<td>${row.d_final_cnt}</td>
		</tr>
		</c:forEach>
	</table>
    </div>
    
    <div id="menu1" class="tab-pane fade"><br>
    <p><b>자신이 수신한 결재문서 리스트</b></p>
	<table border="1" width="100%">
		<tr>
			<th width="10%">문서번호</th>
			<th width="10%">작성자(id)</th>
			<th width="25%">제&emsp;목</th>
			<th width="20%">작 성 일 자</th>
			<th>최종승인여부</th>	
			<th>결재횟수</th>
		</tr>
		
		<c:forEach var="row" items="${receiveList}">
		<tr>
			<!--회원정보 상세조회를 위해 a태그 추가  -->
			<td><a href="${path}/document/dContent?d_num=${row.d_num}">${row.d_num}</a></td>
			<td>${row.d_id}</td>
			<td><a href="${path}/approve/aApprove?d_num=${row.d_num}">${row.d_title}</a></td>
			<td>${row.d_date}</td>
			<td>${row.d_final_condition}</td>
			<td>${row.d_final_cnt}</td>
		</tr>
		</c:forEach>
	</table>
    </div>
  </div>

	<div class="w3-center">
		<input type="button" id="button"  value="문서&nbsp;등록" onclick="location.href='${path}/approve/aRegist.do'">
	</div>
	</sf:form>
</div>
</body>
</html>