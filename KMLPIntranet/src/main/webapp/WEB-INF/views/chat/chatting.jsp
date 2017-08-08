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
				"http://localhost:8181/KMLPIntranet/chat.do");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		if (confirm("채팅을 종료 하시겠습니까?")) {
			wsocket.close();	
		} else{
			false;
		}
		
	}
	function onOpen(evt) {
		appendMessage("${m_id} 님이 입장하였습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
		window.close();
	}
	
	function send() {
		var nickname ="${m_id}";
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
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
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>
<style>
#chatArea {
	width: 500px; height: 300px; overflow-y: auto; border: 1px solid black; padding: 0.5em;
	border: 1px solid lightblue;
}

#message {
	width: 445px;
	height: 35px;
	border: 1px solid lightblue;
}

#sendBtn {
	border: 0px;
	width: 52px;
	height: 35px;
	font-weight: bold;
	background-color: lightblue;
}

#exitBtn {
	border: 0px;
	width: 70px;
	height: 35px;
	font-weight: bold;
	background-color: lightblue;
}

header {
	background-color: lightblue;
}

</style>
</head>
<body>
	<header class="w3-container w3-card-2">
		<h3>대화 영역</h3>
	</header>
    
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    
	<input type="text" id="message" class="w3-left">
	<button type="button" id="sendBtn" class="w3-left">전 송</button>
	
	<br><br><br>
	<div align="center">
		<button type="button" id="exitBtn" class="w3-round">나가기</button>
	</div>
</body>
</html>