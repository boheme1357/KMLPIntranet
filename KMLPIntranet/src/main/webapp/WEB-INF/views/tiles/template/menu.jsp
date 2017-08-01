<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--jstl 코어 태크  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--context경로  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

	#input {
        width: 150px; 
        font-size: 1em;
        border: 1px solid dimgray;
        font-family: FontAwesome;
        margin-bottom: 20px;
    }
    
    #apprlist{
    	border-bottom: 1px solid grey;
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

<script>
function ApprFunc() {
    var x = document.getElementById("ApprList");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
</script>
</head>
<body>
<div class="w3-sidebar w3-card-2 w3-center w3-bar-block w3-border-right">
	<a href="${path}/login.do"><img class="w3-image" src="${path}/resources/img/kmlp_logo.png" width="140"></a>
	<a href="${path}/notice/nList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf274; 공지사항" style="margin-top: 20px"></a>
	
	<input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf0ea; 전자결재" onclick="ApprFunc()">
	<div id="ApprList" class="w3-hide w3-light-grey">
		<a href="${path}/approve/aRegist.do" id="apprlist" class="w3-bar-item w3-button" style="border-top: 1px solid grey;">결재문서작성</a>
		<a href="${path}/approve/aApproving.do" id="apprlist" class="w3-bar-item w3-button">미 결 재 함</a>
		<a href="${path}/approve/aApproved.do" id="apprlist" class="w3-bar-item w3-button">결재완료함</a>
		<a href="${path}/approve/aList.do" id="apprlist" class="w3-bar-item w3-button" style="margin-bottom: 20px;">수신결재요청함</a>	
	</div>
	
	<a href=""><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1e8; 쪽&emsp;&emsp;지"></a>
	<a href=""><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1d7; 커뮤니티"></a>
	<a href="${path}/member/mList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf2bc; 사원관리"></a>
</div>
</body>
</html>