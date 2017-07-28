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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">

<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			
			if (!document.form.m_pwd.value) {

				alert("비밀번호를 입력하시오.")

			} else {

				if (confirm("수정하시겠습니까?")) {
					document.form.action = "${path}/member/mUpdate";
					document.form.submit();
				}
			}
		});
	});

	//취소버튼 이벤트
	function check_cancel(){
		if(confirm("취소 하시겠습니까?")){
			history.back();
		}
	}
	function check_delete(){
		if(!document.form.m_pwd.value){
			alert("비밀번호를 입력하시오.")
		} else {
			if (confirm("삭제하시겠습니까?")) {
				document.form.action = "${path}/member/mDelete.do";
				document.form.submit();
			}
		}
	}
	//비밀번호 동일여부 확인버튼 이벤트
	function check_pwd(){
		if(!document.form.m_pwd.value){
			alert("비밀번호를 입력하시오.")
		} else {
			if(document.form.m_pwd.value != document.form.m_pwd_check.value){
				alert("비밀번호를 동일하게 입력하세요.");
				m_pwd_check.focus();
				return false;
			} else {
				alert("비밀번호가 일치합니다.");
				m_email_id.focus();
				return true;
			}
		}
	}		
</script>

<style>
	#pwd_check{
		border: 0px;
		height: 30px;
		color: dimgrey;
		font-weight: bold;
		background-color: lightblue;
	}
</style>

</head>
<div id="wapper">
<body>
<h3>사원개인정보</h3>
<hr>
<sf:form action="${path}/member/insert" name="form" method="post">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="15%">사&emsp;번</th>
		<td><input name="m_id" value="${dto.m_id}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이&emsp;름</th>
		<td><input name="m_name" value="${dto.m_name}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" class="w3-animate-input w3-left" name="m_pwd" id="m_pwd" style="width: 50%; height: 30px;"></td>
	</tr>
.
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" class="w3-left" name="m_pwd_check" id="m_pwd_check" style="width: 50%; height: 30px;">
		<input type="button" class="w3-left" id="pwd_check" value="확인" onclick="check_pwd();"></td>
	</tr>
	
	<tr>
		<th>부서명</th>
		<td><input name="m_dept" value="${dto.m_dept}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th>직&emsp;급</th>
		<td><input name="m_posit" value="${dto.m_posit}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이메일아이디</th>
		<td><input name="m_email_id" id="m_email_id" class="w3-animate-input w3-left" value="${dto.m_email_id}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이메일도메인</th>
		<td><input name="m_email_do" class="w3-animate-input w3-left" value="${dto.m_email_do}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>연락처</th>
		<td><input name="m_cell" class="w3-animate-input w3-left" value="${dto.m_cell}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>입사일자</th>
		<td><input name="m_com_date" value="${dto.m_com_date}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>퇴사일자</th>
		<td><input name="m_com_date" value="${dto.m_quit_date}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
</table>
<div class="w3-center">
	<input type="button" id="button" class="w3-btn w3-round-large" value="수&nbsp;정" id="btnUpdate">
	&emsp;&emsp;&emsp;
	<input type="button" id="button" class="w3-btn w3-round-large" value="취&nbsp;소" id="btnDelete" onclick="check_cancel();">
	<div style="color: red;">${message}</div>
</div>
</sf:form>
</body>
</div>
</html>