<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<div class="w3-sidebar w3-card-2 w3-center w3-bar-block w3-border-right">
	<a href="${pageContext.request.contextPath}/login.do"><img class="w3-image" src="${pageContext.request.contextPath}/resources/img/kmlp_logo.png" width="140"></a>
	<a href="${pageContext.request.contextPath}/notice/nList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf274; 공지사항" style="margin-top: 20px"></a>
	<a href="${pageContext.request.contextPath}/approve/aList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf0ea; 전자결재"></a>
	<a href=""><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1e8; 쪽&emsp;&emsp;지"></a>
	<a href=""><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1d7; 커뮤니티"></a>
	<a href="${pageContext.request.contextPath}/member/mList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf2bc; 사원관리"></a>
</div>
</body>
</html>