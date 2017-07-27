<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>사원 등록</title>

<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			
			if (!document.form1.m_pwd.value) {

				alert("비밀번호입력")

			} else {

				if (confirm("수정하시겠습니까?")) {
					document.form.action = "${path}/member/mUpdate";
					document.form.submit();
				}
			}
		});
	});

	$(document).ready(function() {
		$("#btnDelete").click(function() {
			if(!document.form1.m_pwd.value){
				alert("비밀번호입력")
			} else{
				
				if (confirm("삭제하시겠습니까?")) {
					document.form.action = "${path}/member/MDelete";
					document.form.submit();
				}
				
			}
			
			
		});
	});
</script>

</head>
<body>



<h2>사원개인정보</h2>
<form action="${path}/member/mInsert" name="form" method="post">

<table border="1" width="70%">
	<tr>
		<td>사번</td>
		<td><input name="m_id" value="${dto.m_id}"></td>
	</tr>
	
	
	<tr>
		<td>이름</td>
		<td><input name="m_name" value="${dto.m_name}"></td>
	</tr>
	
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="m_pwd"></td>
	</tr>

	<tr>
		<td>부서명</td>
		<td><input name="m_dept"  value="${dto.m_dept}"></td>
	</tr>


	<tr>
		<td>직급</td>
		<td><input name="m_posit" value="${dto.m_posit}"></td>
	</tr>
	
	<tr>
		<td>이메일아이디</td>
		<td><input name="m_email_id" value="${dto.m_email_id}"></td>
	</tr>
	
	<tr>
		<td>이메일도메인</td>
		<td><input name="m_email_do" value="${dto.m_email_do}"></td>
	</tr>
	
	<tr>
		<td>연락처</td>
		<td><input name="m_cell" value="${dto.m_cell}"></td>
	</tr>
	
	<tr>
		<td>입사일자</td>
		<td><input name="m_com_date" value="${dto.m_com_date}"></td>
	</tr>
	
	<tr>
		<td>퇴사일자</td>
		<td><input name="m_com_date" value="${dto.m_quit_date}"></td>
	</tr>
	
	<tr>
		<td>권한설정</td>
		<td><input type="radio" name="ADMIN" value="ADMIN"> Admin
  			<input type="radio" name="USER" value="USER" checked> User</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		 <input type="button" value="수정"  id="btnUpdate">
		 <input type="button" value="삭제"  id="btnDelete">
		 <div style="color: red;">${message}</div></td>
	</tr>
	
	
</table>

</form>








</body>
</html>