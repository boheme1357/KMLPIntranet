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
	function check_modify(){
		if(confirm("수정페이지로 이동하시겠습니까?")) {
			location.replace("${path}/member/mModify.do");
		}
	}
	
	//취소버튼 이벤트
	function check_cancel(){
		if(confirm("취소 하시겠습니까?")){
			history.back();
		}
	}

	//삭제버튼 이벤트
// 	function check_delete(){
// 		if(!document.form.m_pwd.value){
// 			alert("비밀번호를 입력하시오.")
// 		} else {
// 			if (confirm("삭제하시겠습니까?")) {
// 				document.form.action = "${path}/member/mDelete.do";
// 				document.form.submit();
// 			}
// 		}
// 	}
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
<h3>사원개인정보</h3>
<hr>
<sf:form action="${path}/member/mModify.do" name="form" method="post">
<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<th width="15%">사&emsp;번</th>
		<td>${dto.m_id}</td>
	</tr>
	
	<tr>
		<th>이&emsp;름</th>
		<td>${dto.m_name}</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td></td>
	</tr>

	<tr>
		<th>부 서 명</th>
		<td>${dto.m_dept}</td>
	</tr>

	<tr>
		<th>직&emsp;급</th>
		<td>${dto.m_posit}</td>
	</tr>
	
	<tr>
		<th>이메일아이디</th>
		<td>${dto.m_email_id}</td>
	</tr>
	
	<tr>
		<th>이메일도메인</th>
		<td>${dto.m_email_do}</td>
	</tr>
	
	<tr>
		<th>연 락 처</th>
		<td>${dto.m_cell}</td>
	</tr>
	
	<tr>
		<th>입사일자</th>
		<td>${dto.m_com_date}</td>
	</tr>
	
	<tr>
		<th>퇴사일자</th>
		<td>${dto.m_quit_date}</td>
	</tr>
</table>

<div class="w3-center">
	<div class="btn-group">
		<button type="button" id="button" class="btn btn-primary" onclick="check_modify();">수&nbsp;정</button>
		<button type="button" id="button" class="btn btn-primary" onclick="check_cancel();">취&nbsp;소</button>
	</div>
	<br><br><div style="color: red;">${message}</div>
</div>

<!-- <div class="w3-center"> -->
<!-- 	<input type="button" id="button" class="w3-btn w3-round-large" value="수&nbsp;정" onclick="check_modify();"> -->
<!-- 	&emsp;&emsp;&emsp;&emsp; -->
<!-- 	<input type="button" id="button" class="w3-btn w3-round-large" value="취&nbsp;소" onclick="check_cancel();"> -->
<%-- 	<br><br><div style="color: red;">${message}</div> --%>
<!-- </div> -->
</sf:form>
</div>
</body>
</html>