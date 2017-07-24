<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>공지사항 등록</title>
</head>
<body>



<h2>공지사항폼</h2>
<sf:form action="${path}/notice/nRegist.do" name="form" method="post">

<table border="1" width="400px">


	<!--  일련번호, 작성일자는  default값으로 자동추가
	<tr>
		<td>일련번호</td>
		<td><input name="n_num"></td>
	</tr>
	
	
	<tr>
		<td>작성일자</td>
		<td><input name="n_wdate"></td>
	</tr> 
	
	-->
	
	
	
	
	
	<tr>
		<td>작성자</td>
		<td><input name="n_id"></td>
	</tr>

	<tr>
		<td>제목</td>
		<td><input name="n_title"></td>
	</tr>


	<tr>
		<td>내용</td>
		<td><input name="n_content"></td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><input name="n_file"></td>
	</tr>
	

	

	
	
	
	<tr>
		<td colspan="2" align="center">
		 <input type="submit" value="확인">
		 <input type="reset" value="취소">
	</tr>
	
	
</table>

</sf:form>












</body>
</html>