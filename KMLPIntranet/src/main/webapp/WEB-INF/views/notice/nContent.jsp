<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	//수정버튼 이벤트
	function check_modify(){
		if(confirm("수정페이지로 이동하시겠습니까?")) {
			location.replace("${path}/notice/nModify.do?n_num=${dto.n_num}");
		}
	}				


// 	function check_update(){
// 		if(confirm("수정 하시겠습니까?")) {
// 			document.form.action ="${path}/notice/nModify.do";
// 			document.form.submit();
// 		}
// 	}
	
	//취소버튼 이벤트
	function check_cancel(){
		if(confirm("취소 하시겠습니까?")){
			history.back();
		}
	}
	
</script>

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
<h3>공지사항&nbsp;내용</h3>
<hr>
<sf:form action="${path}/notice/nModify.do" name="form" method="post">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="15%">일련번호</th>
		<td><input name="n_num" value="${dto.n_num}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>사&emsp;번</th>
		<td><input name="n_id" value="${dto.n_id}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th>제&emsp;목</th>
		<td><input name="n_title" value="${dto.n_title}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th height="300px">내&emsp;용</th>
		<td><textarea id="textarea" name="n_content" readonly="readonly">${dto.n_content}</textarea></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td><input name="n_file" value="${dto.n_file}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

</table>
<sec:authorize access="hasRole('ADMIN')">
<div class="w3-center">
	<div class="btn-group">
		<button type="button" id="button"  onclick="check_modify();">수&nbsp;정</button>
		<button type="button" id="button"  onclick="check_cancel();">취&nbsp;소</button>
	</div>
	<br><br><div style="color: red;">${message}</div>
</div>
</sec:authorize>
</sf:form>
</div>
</body>
</html>