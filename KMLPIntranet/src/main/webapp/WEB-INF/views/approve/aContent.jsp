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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>

<script>
$(document).ready(function() {
	$("#btnUpdate").click(function() {
		
		
			if (confirm("수정하시겠습니까?")) {
				document.form.action = "${path}/approve/nModify.do";
				document.form.submit();
			}
		
	});

});
$(document).ready(function() {
	$("#btnDelete").click(function() {
		
			if (confirm("삭제하시겠습니까?")) {
				document.form.action = "${path}/approve/aDelete";
				document.form.submit();
			}
			
			
		
	});
	
});
</script>

</head>
<body>



<h2>일일업무보고</h2>
<sf:form action="${path}/approve/aResister.do" name="form" method="post">

<table border="1" width="70%">
	<tr>
		<td>문서번호</td>
		<td><input name="d_num" value="${dto.d_num}" readonly="readonly"></td>
	</tr>
	
	
	<tr>
		<td>작성일자</td>
		<td><input name="d_date" value="${dto.d_date}"></td>
	</tr>
	
	
	<tr>
		<td>사번</td>
		<td><input name="d_id" value="${dto.d_id}"></td>
	</tr>

	<tr>
		<td>제목</td>
		<td><input name="d_title"  value="${dto.d_title}"></td>
	</tr>


	<tr>
		<td>내용</td>
		<td><input name="d_content" value="${dto.d_content}"></td>
	</tr>
	
	<tr>
		<td>최종승인여부</td>
		<td><input name="d_final_check" value="${dto.d_final_check}"></td>
	</tr>
	
	<tr>
		<td>결재횟수</td>
		<td><input name="d_appr_cnt" value="${dto.d_appr_cnt}"></td>
	</tr>
	

	
	
	
	<tr>
		<td colspan="2" align="center">
		 <input type="button" value="수정"  id="btnUpdate">
		 <input type="button" value="삭제"  id="btnDelete">
		 <div style="color: red;">${message}</div></td>
	</tr>
	
	
</table>

</sf:form>








</body>
</html>