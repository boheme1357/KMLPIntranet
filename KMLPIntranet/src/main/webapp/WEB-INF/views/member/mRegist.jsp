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

<title>Insert title here</title>


</head>
<body>



	<h2>사원개인정보</h2>
	<%-- <form action="${path}/member/mRegist.do"   method="post"  enctype="multipart/form-data"> --%>

	<sf:form
		action="${path}/member/mRegist.do?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data">


		<table border="1" width="70%">
			<tr>
				<td>사번</td>
				<td><input name="m_id"></td>
			</tr>


			<tr>
				<td>이름</td>
				<td><input name="m_name"></td>
			</tr>


			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="m_pwd"></td>
			</tr>

			<tr>
				<td>부서명</td>
				<td><input name="m_dept"></td>
			</tr>


			<tr>
				<td>직급</td>
				<td><input name="m_posit"></td>
			</tr>

			<tr>
				<td>이메일아이디</td>
				<td><input name="m_email_id"></td>
			</tr>

			<tr>
				<td>이메일도메인</td>
				<td><input name="m_email_do"></td>
			</tr>

			<tr>
				<td>연락처</td>
				<td><input name="m_cell"></td>
			</tr>

			<tr>
				<td>입사일자</td>
				<td><input name="m_com_date"></td>
			</tr>

			<tr>
				<td>퇴사일자</td>
				<td><input name="m_quit_date"></td>
			</tr>


			<tr>
				<td>결재도장</td>
				<td><input type="file" name="file" /></td>


			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
					<input type="button" value="삭제">
			</tr>


		</table>

	</sf:form>


</body>
</html>