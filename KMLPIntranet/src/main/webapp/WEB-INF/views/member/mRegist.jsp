<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="${path}/resources/css/content.css">
<script type="text/javascript">
//초기화버튼 이벤트
function check_reset(){
	if(confirm("초기화 하시겠습니까?")){
		document.form.reset();
	}
}

//취소버튼 이벤트
function check_cancel(){
	if(confirm("취소 하시겠습니까?")){
		history.back();
	}
}

//등록버튼 이벤트
function check_regist(){
	if(confirm("등록 하시겠습니까?")){
		document.form.submit();
	}
}
</script>

</head>
<div id="wapper">
<body>
<h3>사원개인정보&nbsp;등록</h3>
<hr>
	<%-- <form action="${path}/member/mRegist.do"   method="post"  enctype="multipart/form-data"> --%>

<sf:form name="form" action="${path}/member/mRegist.do?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="15%">사&emsp;번</th>
		<td><input name="m_id" class="w3-animate-input w3-left" value="${dto.m_id}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>직&emsp;급</th>
		<td><input name="m_posit" class="w3-animate-input w3-left" value="${dto.m_posit}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>이메일 아이디</th>
		<td><input name="m_email_id" class="w3-animate-input w3-left" value="${dto.m_email_id}" style="width: 50%; height: 30px;"></td>
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
		<td><input name="m_com_date" class="w3-animate-input w3-left" value="${dto.m_com_date}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>퇴사일자</th>
		<td><input name="m_com_date" class="w3-animate-input w3-left" value="${dto.m_quit_date}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>권한설정</th>
		<td><input type="radio" name="authority" value="ADMIN"> Admin
			&emsp;&emsp;&emsp;&emsp;
  			<input type="radio" name="authority" value="USER" checked> User</td>
	</tr>
</table>

<div class="w3-center">
	<input type="button" id="button" class="w3-btn w3-round-large" value="등&nbsp;록" onclick="check_regist();">
	&emsp;&emsp;
	<input type="button" id="button" class="w3-btn w3-round-large" value="초기화" onclick="check_reset();">
	&emsp;&emsp;
	<input type="button" id="button" class="w3-btn w3-round-large" value="취&nbsp;소" onclick="check_cancel();">
	<br><br><div style="color: red;">${message}</div>
</div>
</sf:form>
</body>
</div>
</html>