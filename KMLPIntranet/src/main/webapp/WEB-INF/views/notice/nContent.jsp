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
<title>공지사항 상세보기</title>

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
					document.form.action = "${path}/notice/nDelete.do";
					document.form.submit();
				}
				
				
			
		});
		
	});
	
</script>

</head>
<body>



<h2>공지사항</h2>
<sf:form action="${path}/notice/nContent.do" name="form" method="post">

<table border="1" width="70%">
	<tr>
		<td>일련번호</td>
		<td><input name="n_num" value="${dto.n_num}" readonly="readonly"></td>
	</tr>
	
	
	<tr>
		<td>사번</td>
		<td><input  name="n_id"  value="${dto.n_id}" ></td>
	</tr>

	<tr>
		<td>제목</td>
		<td><input name="n_title"  value="${dto.n_title}"></td>
	</tr>


	<tr>
		<td>내용</td>
		<td><input name="n_content" value="${dto.n_content}"></td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><input name="n_file" value="${dto.n_file}"></td>
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