<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>채팅</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
	var wsocket;

	function connect() {
		wsocket = new SockJS("http://192.168.0.6:8080/KMLPIntranet/chat.do");

		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		if (confirm("채팅을 종료 하시겠습니까?")) {
			send(" :  : ", "${m_id} 님이 퇴장하였습니다.  :  :  : ");
			wsocket.close();
		} else {
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
		$("#chatMessageArea").append(msg + "<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		connect();

		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
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
	width: 400px;
	height: 300px; overflow-y : auto;
	border: 1px solid black;
	overflow-y: auto;
}
</style>
</head>
<body>



	<h1>KMLP Intranet : ${chatRoom_Title} </h1>
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br />
	<input type="text" id="message">
	<input type="button" id="sendBtn" value="전송">
	<input type="button" id="exitBtn" value="나가기">
</body>
</html>