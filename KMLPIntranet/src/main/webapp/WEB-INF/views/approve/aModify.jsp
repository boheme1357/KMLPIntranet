<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/content.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {

			if (confirm("수정하시겠습니까?")) {
				
				document.form.submit();
			}
		});

	});

	$(document).ready(function() {
		$("#btnDelete").click(function() {

			if (confirm("삭제하시겠습니까?")) {
				document.form.action = "${path}/approve/aDelete.do?d_num=${dto.d_num}";
				document.form.submit();
			}
		});

	});
</script>
</head>

<body>
	<div id="wapper">
		<h2>일일업무보고</h2>
		<sf:form  name="form"
			method="post">
			<table border="1" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<th width="15%">문서번호</th>
					<td>${dto.d_num}</td>
				</tr>

				<tr>
					<th>작성일자</th>
					<td>${dto.d_date}</td>
				</tr>

				<tr>
					<th>작성자(사번)</th>
					<td>${dto.d_id}</td>
				</tr>

				<tr>
					<th>제&emsp;목</th>
					<td><input name="d_title" value="${dto.d_title}"></td>
				</tr>

				<tr>
					<th>내&emsp;용</th>
					<td><input name="d_content" value="${dto.d_content}"></td>
				</tr>

				<tr>
					<th>최종승인여부</th>
					<td>${dto.d_final_condition}</td>
				</tr>

				<tr>
					<th>총 결재단계</th>
					<td><input name="d_final_cnt" value="${dto.d_final_cnt}"></td>
				</tr>

				<tr>
					<th>현재 결재단계</th>
					<td><input name="d_now_cnt" value="${dto.d_now_cnt}"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="button" value="수정"
						id="btnUpdate"> <input type="button" value="삭제"
						id="btnDelete">
						<div style="color: red;">${message}</div></td>
				</tr>
			</table>
		</sf:form>
	</div>
</body>
</html>