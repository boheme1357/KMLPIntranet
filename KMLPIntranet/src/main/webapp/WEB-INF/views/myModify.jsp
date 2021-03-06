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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			
			if (!document.form.m_pwd.value) {

				alert("비밀번호를 입력하시오.")
				m_pwd.focus();

			} else {

				if (confirm("수정하시겠습니까?")) {
					document.form.submit();
				} else{return false;}
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
#pwd_check {
	border: 0px;
	height: 30px;
	color: dimgrey;
	font-weight: bold;
	background-color: lightblue;
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

<c:if test="${message != null}">
<script type="text/javascript">alert("${message}")</script>
</c:if>


	<div id="wapper">
		<h3>사원개인정보</h3>
		<hr>
		<sf:form action="${path}/myModify.do?${_csrf.parameterName}=${_csrf.token}" name="form" method="post" enctype="multipart/form-data">

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

	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" class="w3-left" name="m_pwd_check" id="m_pwd_check" style="width: 50%; height: 30px;">
		<button type="button" id="pwd_check" class="w3-left" onclick="check_pwd();">확인</button></td>
	</tr>
	
	<tr>
		<th>부 서 명</th>
		<td><input name="m_dept" value="${dto.m_dept}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>

	<tr>
		<th>직&emsp;급</th>
		<td><input name="m_posit" value="${dto.m_posit}" readonly="readonly" style="width: 100%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이메일 아이디</th>
		<td><input name="m_email_id" id="m_email_id" class="w3-animate-input w3-left" value="${dto.m_email_id}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이메일 도메인</th>
		<td><input name="m_email_do" class="w3-animate-input w3-left" value="${dto.m_email_do}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>연 락 처</th>
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
	
	<c:if test='${!empty dto.ms_img}'>
						<th>등록된 결재 이미지</th>
						<td><img src="${path}/resources/img/${dto.ms_img}" id="img"
							width="50px" height="50px"></td>
					</c:if>
	
	
	<tr>
		<th>결재 이미지 수정</th>
		<td><input type="file" name="file"></td>
	</tr>
</table>

<div class="w3-center">
	<div class="btn-group">
		<button type="button" id="btnUpdate" >수&nbsp;정</button>
		<button type="button" id="btnDelete"  onclick="check_cancel();">취&nbsp;소</button>
	</div>
	<br><br>
</div>
</sf:form>
</div>
</body>
</html>