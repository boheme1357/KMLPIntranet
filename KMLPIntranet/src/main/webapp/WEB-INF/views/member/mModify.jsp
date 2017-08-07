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

<script type="text/javascript">
	//수정버튼 이벤트
	function check_update(){
		if (!document.form.m_pwd.value) {
			alert("비밀번호를 입력하시오.")
		} else {
			if (confirm("수정하시겠습니까?")) {
				document.form.action = "${path}/member/mUpdate.do";
				document.form.submit();
			}
		}
	}

	//삭제버튼 이벤트
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
	
	//취소버튼 이벤트
	function check_cancel(){
		if(confirm("취소 하시겠습니까?")){
			history.back();
		}
	}
</script>

<style>
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
<div id="wapper">
<h3>사원개인정보&nbsp;수정</h3>
<hr>
<sf:form action="${path}/member/insert" name="form" method="post">

<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="15%">사&emsp;번</th>
		<td><input name="m_id" value="${dto.m_id}" style="width: 100%; height: 30px;" readonly="readonly"></td>
	</tr>
	
	<tr>
		<th>이&emsp;름</th>
		<td><input name="m_name" class="w3-animate-input w3-left" value="${dto.m_name}" style="width: 50%; height: 30px;"></td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" class="w3-animate-input w3-left" name="m_pwd" style="width: 50%; height: 30px;"></td>
	</tr>

	<tr>
		<th>부 서 명</th>
		<td><input name="m_dept" class="w3-animate-input w3-left" value="${dto.m_dept}" style="width: 50%; height: 30px;"></td>
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
		<td><input name="m_com_date" value="${dto.m_com_date}" style="width: 100%; height: 30px;" readonly="readonly"></td>
	</tr>
	
	<tr>
		<th>퇴사일자</th>
		<td><input name="m_com_date" class="w3-animate-input w3-left" value="${dto.m_quit_date}" style="width: 50%; height: 30px;"></td>
	</tr>

</table>

<div class="w3-center">
	<div class="btn-group">
	    <button type="button" id="button" class="btn btn-primary" onclick="check_update();">수&nbsp;정</button>
	    <button type="button" id="button" class="btn btn-primary" onclick="check_delete();">삭&nbsp;제</button>
	    <button type="button" id="button" class="btn btn-primary" onclick="check_cancel();">취&nbsp;소</button>
	</div>
	<br><br><div style="color: red;">${message}</div>
</div>
</sf:form>
</div>
</body>
</html>