<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅 로비</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var chatRoom_title = "";

	function chatRoom_entrance(chatRoom_title_this) {
		chatRoom_title = chatRoom_title_this;
		if(confirm("채팅방"+chatRoom_title+" 에 입장하시겠습니까?")){
			openChatRoom();
		} else{return false;}
		
	}
	
	function chatRoom_title_set() {
		
		
		if(chatRoom_title = prompt("채팅방 제목을 입력하세요.", "")){
			openChatRoom();
		} else{return false;}
	}

	function openChatRoom() {
		window.open('chatting.do?chatRoom_Title=' + chatRoom_title,
				'window_name',
				'width=500,height=500,location=no,status=no,scrollbars=yes');
	}
</script>

<style>
body {
	background-color: #595959;
}

/* 네온제목 */
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	display: table;
}

@font-face {
  font-family: neon;
  
}

.container {
  display: table-cell;
  text-align: left;
  vertical-align: middle;
}

.neon {
  font-family: neon;
  color: #FB4264;
  font-size: 2vw;
  line-height: 5vw;
  text-shadow: 0 0 3vw #F40A35;
}

.neon {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
}

@keyframes neon {
  0%,
  100% {
    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #FED128;
  }
  50% {
    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}
/* 네온제목끝 */

/* 채팅방버튼 */
.btn {
  display: inline-block;
  background: transparent;
  text-transform: uppercase;
  font-weight: normal;
  font-style: normal;
  font-size: 1.2em;
  font-weight: bold;
  letter-spacing: 0.3em;
  color: rgba(223,190,106,0.7);
  border-radius: 0;
  padding: 18px 80px 20px;
  -webkit-transition: all 0.7s ease-out;
  transition: all 0.7s ease-out;
  background: -webkit-linear-gradient(180deg, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background: -webkit-linear-gradient(right, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background: linear-gradient(270deg, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background-position: 1% 50%;
  background-size: 300% 300%;
  text-decoration: none;
  margin: 0.625rem;
  border: none;
  border: 1px solid rgba(223,190,106,0.7);
}
.btn:hover {
  color: #fff;
  border: 1px solid rgba(223,190,106,0);
  color: $white;
  background-position: 99% 50%;
}
body {
  color: #fff;
  font-family: "Helvetica Neue", Helvetica, Arials, sans;
}
article {
  height: 10vh;
}
div.center {
  text-align:left;
  width: auto;
  max-width: 400px;
  float: none;
  display: block;
  margin-right: auto;
  margin-left: auto;
  padding-left: 0;
  padding-right: 0;
  position: relative;
  top: 10%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}
div.center::after {
  content: '';
  display: table;
  clear: both;
}

#chat {
	border: 1px solid rgba(223,190,106,0.7);
	text-align: center;
	height: 45px;
}
/* 채팅방버튼 끝 */
</style>
</head>
<body>
 	<div class="container">
   		<div class="neon" >KMLP 채팅 로비</div>
    </div>

	<article>
	  <div class="center"><input type='button' name='chatRoom_title_setBtn'class="btn" value='채팅방 만들기' onClick='chatRoom_title_set()'></div>
	</article>

	<div id='chatRoomListDiv' class="w3-center">
		<table width="100%" cellpadding="0" cellspacing="0" align="center" id="chat">
			<tr id="chat">
				<th id="chat">방&nbsp;제목</th>
				<th id="chat">참가인원</th>
			</tr>
			<c:if test="${!empty chatRoomList}">
				<c:forEach var='row' items='${chatRoomList}'>
					<tr id="chat">
						<td id="chat"><a href='#' onClick='chatRoom_entrance(${row})'>${row}</a></td>
						<td id="chat"><c:out value="${chatUserCntMap[row]}" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty chatRoomList}">
				<tr id="chat">
					<td id="chat">진행중인 채팅방이 없습니다.</td>
					<td id="chat"></td>
				</tr>
			</c:if>
		</table>
	</div>

	<br />

</body>
</html>