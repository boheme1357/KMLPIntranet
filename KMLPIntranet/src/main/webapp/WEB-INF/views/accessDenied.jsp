<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
    	h1{
    		color: firebrick;
    		font-weight: bold;
    		font-size: 8em;
    	}
    	
    	#button{
    		width: 200px;
    		height: 60px;
			font-size: 1.4em;
			font-weight: bold;
			background-color: orange;
			border: 1px solid darkorange;
			font-family: FontAwesome;
    	}
    </style>
    
    <title>Access Denied</title>
</head>

<body>
	<div class="w3-center" style="margin-top: 120px;">
		<img class="w3-image" src="${pageContext.request.contextPath}/resources/img/warning.png" width="150">
		<h1>Access Denied!</h1>
		
		<div class="container" style="margin-top: 80px;">
			<a href="<c:url value="/home.do" />"><input type="button" id="button" class="w3-btn w3-orange" value="&#xf015; 홈으로 가기"></a>
		</div>
	</div>
</body>
</html>
