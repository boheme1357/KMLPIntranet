<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 시큐리티 태그lib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Luckiest+Guy" rel="stylesheet">

<style>
#h4 {
	font-style: italic;
	font-family: 'Luckiest Guy', cursive;
	font-size: 1.4em;
	color: white;
	margin-left: 20px;
}

#submit {
	font-family: FontAwesome;
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
	<div class="w3-bar w3-card-2 w3-left-align" style="background-color: #404040">
		<a href="${pageContext.request.contextPath}/notice/nList.do"><h4 class="w3-left" id="h4" title="홈으로" style="color: white">K.M.L.P Intranet</h4></a>

		<sec:authorize access="isAuthenticated()">
			<sf:form action="${pageContext.request.contextPath}/logout"
				method="POST">
				<input type="submit" id="submit" value="&#xf08b; 로그아웃" class="w3-bar-item w3-button w3-padding-large w3-hover-none w3-right" style="color: white"/>
			</sf:form>
		</sec:authorize>
		
		<a href="${pageContext.request.contextPath}/myModify.do" class="w3-bar-item w3-button w3-padding-large w3-right w3-hover-none" style="color: white">
		<i class="fa fa-user"></i> 마이페이지</a>
		
		<label class="w3-bar-item w3-padding-large w3-right" style="color: white"><sec:authentication property="principal.username"/>님 환영합니다!</label>
	</div>
</body>
</html>