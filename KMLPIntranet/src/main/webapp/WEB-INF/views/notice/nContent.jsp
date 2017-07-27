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
<%-- <link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>공지사항 상세보기</title>

<script type="text/javascript">
	//수정버튼 이벤트
	function check_update(){
		if(confirm("수정 하시겠습니까?")) {
			document.form.submit();
		}
	}

	//취소버튼 이벤트
	function check_cancel(){
		if(confirm("취소 하시겠습니까?")){
			history.back();
		}
	}
	
</script>

</head>
<div id="wapper">
<body>
<h3>공지사항&nbsp;내용</h3>
<hr>
<sf:form action="${path}/notice/nContent.do" name="form" method="post">

<table border="1" width="100%">
	<tr>
		<th>일련번호</th>
		<td><input name="n_num" value="${dto.n_num}" readonly="readonly"></td>
	</tr>
	
	<tr>
		<th>사번</th>
		<td><input  name="n_id"  value="${dto.n_id}" ></td>
	</tr>

	<tr>
		<th>제목</th>
		<td><input name="n_title"  value="${dto.n_title}"></td>
	</tr>

	<tr>
		<th>내용</th>
		<td><input name="n_content" value="${dto.n_content}"></td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td><input name="n_file" value="${dto.n_file}"></td>
	</tr>

	<tr>
		<td colspan="2" align="center">
			<input type="button" id="button" class="w3-btn w3-round-large" value="수정" onclick="check_update();">
			<input type="button" id="button" class="w3-btn w3-round-large" value="취소" onclick="check_cancel();">
			<div style="color: red;">${message}</div></td>
	</tr>
</table>
</sf:form>
</body>
</div>
</html>