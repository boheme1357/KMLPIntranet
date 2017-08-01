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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">

<script type="text/javascript">
	//수정버튼 이벤트
	function check_modify(){
		if(confirm("수정페이지로 이동하시겠습니까?")) {
			location.replace("${path}/notice/nModify.do");
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
		<td><input name="n_title" class="w3-animate-input w3-left" value="${dto.n_title}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th height="400px">내&emsp;용</th>
		<td><textarea name="n_content" readonly="readonly">${dto.n_content}</textarea></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td><input name="n_file" value="${dto.n_file}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

</table>
<div class="w3-center">
	<input type="button" id="button" class="w3-btn w3-round-large" value="수&nbsp;정" onclick="check_modify();">
	&emsp;&emsp;&emsp;&emsp;
	<input type="button" id="button" class="w3-btn w3-round-large" value="취&nbsp;소" onclick="check_cancel();">
	<br><br><div style="color: red;">${message}</div>
</div>
</sf:form>
</div>
</body>
</html>