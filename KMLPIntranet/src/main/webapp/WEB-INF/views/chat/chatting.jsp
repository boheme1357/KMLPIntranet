<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>채팅</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
	var wsocket;
	
	function connect() {
		wsocket = new SockJS(
				"http://175.205.193.249:8080/KMLPIntranet/chat.do");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		if (confirm("채팅을 종료 하시겠습니까?")) {
			send(" :  : ", "${m_id} 님이 퇴장하였습니다.  :  :  : ");
			wsocket.close();	
		} else{
			false;
		}
		
	}
	function onOpen(evt) {
		/* appendMessage("${m_id} 님이 입장하였습니다."); */
		send(" :  : ", "${m_id} 님이 입장하였습니다.  :  :  : ");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		/* appendMessage("연결을 끊었습니다."); */
		window.close();
	}

	function send(nickname, msg) {

		wsocket.send("msg:" + nickname + " : " + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		connect();
		
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send("${m_id}", $("#message").val());
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			send("${m_id}", $("#message").val());
		});

		$('#exitBtn').click(function() {
			disconnect();
		});
	});
</script>
<style>
#chatArea {
	width: 500px; height: 300px; overflow-y: auto; padding: 0.5em;
	border: 0px;
	color: white;
}

#message {
	width: 445px;
	height: 35px;
	border: 1px solid rgba(223,190,106,0.7);
}

#sendBtn {
	width: 52px;
	height: 35px;
	
	
}

#exitBtn {
	width: 70px;
	height: 35px;
	
	
}

header {
	background-color: #404040;
}
/* 채팅방버튼 */
.btn {
  text-align:center;
  display: inline-block;
  background: transparent;
  text-transform: uppercase;
  font-style: normal;
  font-size: 0.5em;
  font-weight: bold;
  letter-spacing: 0.3em;
  color: rgba(223,190,106,0.7);
  border-radius: 0;

  -webkit-transition: all 0.7s ease-out;
  transition: all 0.7s ease-out;
  background: -webkit-linear-gradient(180deg, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background: -webkit-linear-gradient(right, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background: linear-gradient(270deg, rgba(223,190,106,0.8), rgba(146,111,52,0.8), rgba(34,34,34,0), rgba(34,34,34,0));
  background-position: 1% 50%;
  background-size: 300% 300%;
  text-decoration: none;
 
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
  font-family: "Helvetica Neue", Helvetica, Arials, sans;
}

/* 채팅방버튼 끝 */
</style>
</head>
<body style="background-color: #595959">
	<header class="w3-container w3-card-2">
		<h3 style="color: rgba(223,190,106,1)">KMLP Intranet : ${chatRoom_Title} </h3>
	</header>
    
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    
	<input type="text" id="message" class="w3-left">
	<button type="button" id="sendBtn" class=" btn w3-left">전 송</button>
	
	<br><br><br>
	<div align="center">
		<button type="button" id="exitBtn" class="btn">나가기</button>
	</div>
</body>
</html>