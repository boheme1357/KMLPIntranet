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
   
    /* 네온KMLP */
  .footer {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 7%;
  display: table;
}

@font-face {
  font-family: neon;
 
}

.container1 {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}

.flux {
  font-family: neon;
  color: #426DFB;
  font-size: 35px;
  line-height: 45px;
  text-shadow: 0 0 3vw #2356FF; 
}

.flux {
  animation: flux 2s linear infinite;
  -moz-animation: flux 2s linear infinite;
  -webkit-animation: flux 2s linear infinite;
  -o-animation: flux 2s linear infinite;
}

@keyframes flux {
  0%,
  100% {
    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .0vw .0vw .0vw #147280;
    color: #28D7FE;
  }
  50% {
    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, 0vw .0vw .0vw #0A3940;
    color: #146C80;
  }
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
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    // add a zero in front of numbers<10
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById("txt").innerHTML = h + ":" + m + ":" + s;
    var t = setTimeout(function(){ startTime() }, 500);
}

function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}
</script>
</head>
<body onload="startTime()">
<div class="w3-sidebar w3-card-2 w3-center w3-bar-block w3-border-right">
   <a href="${path}/login.do"><img class="w3-image" src="${path}/resources/img/kmlp_logo1.png" width="200" title="로그인 페이지로"></a>
   <a href="${path}/notice/nList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf274; 공지사항" style="margin-top: 20px"></a>
   
   <input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf0ea; 전자결재" onclick="ApprFunc()">
   <div id="ApprList" class="w3-hide w3-light-grey">
      <a href="${path}/approve/aRegist.do" id="apprlist" class="w3-bar-item w3-button" style="border-top: 1px solid grey;">결재문서작성</a>
      <a href="${path}/approve/aApproving.do" id="apprlist" class="w3-bar-item w3-button">미 결 재 함</a>
      <a href="${path}/approve/aApproved.do" id="apprlist" class="w3-bar-item w3-button">결재완료함</a>
      <a href="${path}/approve/aReturn.do" id="apprlist" class="w3-bar-item w3-button" style="margin-bottom: 20px;">결재반려함</a>   
   </div>
   
   <a href="${path}/chat/chatting.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1e8; 채&emsp;&emsp;팅"></a>
   <a href=""><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf1d7; 커뮤니티"></a>
   <a href="${path}/member/mList.do"><input type="button" id="input" class="w3-btn w3-round-large w3-blue-grey" value="&#xf2bc; 사원관리"></a>

<!-- 네온시계구현 -->
<span class="footer">
<div class="container1">
  <div id="txt" class="flux"> </div>
</div>
</span>

</div>

</body>

</html>