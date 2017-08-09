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
<style>
th {
	font-size: 0.9em;
}

th, td {
	padding: 5px;
}

h1 {
	font-style: italic;
	font-family: 'Luckiest Guy', cursive;
	font-size: 5em;
}

#submit {
	width: 100px;
	height: 74px;
	font-size: 1.1em;
	font-weight: bold;
	background-color: khaki;
	border: 1px solid goldenrod;
}

#logout {
	width: 120px;
	height: 50px;
	font-size: 1.1em;
	font-weight: bold;
	background-color: khaki;
	border: 1px solid goldenrod;
}

#find, #join {
	width: 190px;
	font-size: 0.9em;
	border: 1px solid goldenrod;
}
</style>


<script type="text/javascript">

//홈페이지 로드 시 로그인박스로 자동커서
function setFocus(){
	if(document.find)document.find.m_id.focus();
}

//필수 입력정보인 사원번호, 비밀번호가 입력되었는지 확인하는 함수
function checkValue() {
	if (!document.find.m_id.value) {
		alert("사원번호를 입력하세요.");
		m_id.focus();
		return false;
	}

	if (!document.find.mail.value) {
		alert("이메일주소를 입력하세요.");
		m_mail.focus();
		return false;
	}
	
	if(document.find.m_id.value && document.find.mail.value){
		
		var mail=document.getElementById("mail").value;
		var find=mail.indexOf("@");
		var length=mail.length;
		
		document.getElementById("m_email_id").value=mail.substr(0,find);
		document.getElementById("m_email_do").value=mail.substr(find+1, length);
		
		
		
			
			alert("임시비밀번호가 이메일로 전송되었습니다. 로그인페이지로 이동합니다.");
			
		
		
	}
	
	
}	






</script>

</head>
<body onLoad="setFocus()">
	<div id="wapper">
		<h3>비밀번호찾기</h3>
		<hr>
		<sf:form    action="${path}/mailSending.do"  name="find"  method="post">

			<table align="center">
				<tr>
					<th>사원번호</th>
					<td><input type="text" id="m_id" name="m_id" style="width: 200px; height: 32px" tabindex="1"></td>
					<td rowspan="2"><input type="submit" id="submit" class="w3-btn" value="비밀번호찾기"  onclick="checkValue();" style="width: 200px;"  tabindex="3"></td>
				</tr>
				<tr>
					<th>이메일주소</th>
					<td><input type="text" id="mail" name="mail" style="width: 200px; height: 32px" tabindex="2"></td>
				</tr>
			</table>

		<div style="color: red;">${message}</div>
		   <input type="hidden" name=m_email_id id="m_email_id">   
		   
   		<input type="hidden" name="m_email_do" id="m_email_do">
		
		

		</sf:form>
	</div>
</body>
</html>