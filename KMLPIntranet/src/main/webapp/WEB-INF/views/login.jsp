<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>KMLP Intranet Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Luckiest+Guy"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	// 필수 입력정보인 사원번호, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.login.m_id.value) {
			alert("사원번호를 입력하세요.");
			m_id.focus();
			return false;
		}

		if (!document.login.m_pwd.value) {
			alert("비밀번호를 입력하세요.");
			m_pwd.focus();
			return false;
		}
		return true;
	}
</script>

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

#find, #join {
	width: 190px;
	font-size: 0.9em;
	border: 1px solid goldenrod;
}
</style>
</head>
<body>
	<div class="w3-center">
		<!-- CompName start -->
		<div class="w3-border- w3-border-light-grey" style="margin-top: 100px">
			<img class="w3-image"
				src="${pageContext.request.contextPath}/resources/img/kmlp_logo.png"
				width="250"><br>
			<h1>K.M.L.P Intranet</h1>
		</div>
		<!-- CompName end -->

		<!-- body start -->
		<div class="container" style="margin-top: 120px">

			<c:url value="/login" var="loginUrl" />

			<sec:authorize access="isAnonymous()">
				<sf:form id="login" name="login" method="post"
					action="${loginUrl}" onsubmit="return checkValue()">
					<table align="center">
						<tr>
							<th>사원번호</th>
							<td><input type="text" id="m_id" name="m_id"
								style="width: 200px; height: 32px"></td>
							<td rowspan="2"><input type="submit" id="submit"
								class="w3-btn" value="로그인" onclick="submit_click();"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="m_pwd" name="m_pwd"
								style="width: 200px; height: 32px"></td>
						</tr>
					</table>


					<!-- 시작 : 아이디 및 비번 틀렸을 때 처리하는 화면 -->
					<c:if test="${param.error != null}">
						<p>아이디 또는 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<c:if test="${param.logout != null}">
						<p>로그아웃 하였습니다.</p>
					</c:if>
					<!-- 끝 : 아이디 및 비번 틀렸을 때 처리하는 화면 -->


				</sf:form>

				<div style="margin-top: 20px">
					<a href=""><input type="button" id="find" name="find"
						class="w3-btn w3-white w3-round-xlarge" value="비밀번호 찾기"></a>
				</div>


			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sf:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<input type="submit" value="로그아웃" />
				</sf:form>
			</sec:authorize>


		</div>
		<!-- body end -->
	</div>
</body>
</html>