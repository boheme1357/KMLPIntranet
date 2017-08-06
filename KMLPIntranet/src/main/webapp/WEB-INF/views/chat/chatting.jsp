<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>


<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- SocketJS CDN -->
<script src="<c:url value="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js" />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	
$(document)
.ready(
		function() {
	
		// websocket을 지정한 URL로 연결
		var sock = new SockJS("<c:url value="/echo" />");
		
		// websocket 서버에서 메시지를 보내면 자동으로 실행
		sock.onmessage = onMessage;
		
		// websocket과 연결을 끊고 싶을 때 실행하는 메소드
		sock.onClose = onClose;
		
		$(function(){
			$("#sendBtn").click(function(){
				console.log("send message...");
				sendMessage();
			});
		});
		
		function sendMessage(){
			// websocket으로 메시지를 보냄
			sock.send($("#message").val());
		}
		
		// evt 파라미터는 websocket이 보내준 데이터
		function onMessage(evt){ //변수 안에 function 자체를 넣음
			var data = evt.data;
			var sessionid = null;
			var message = null;
			
			// 문자열을 splite
			var strArray = data.split('|');
			
			for(var i=0; i<strArray.length; i++){
				console.log('str['+i+']: '+ strArray[i]);
			}
			
			// current session id
			var currentuser_session = $('#sessionuserid').val();
			console.log('current session id: ' + currentuser_session);
			
			sessionid = strArray[0]; // 현재 메시지를 보낸 사람의 세션 등록
			message = strArray[1]; // 현재 메시지를 저장
			
			// 나와 상대방이 보낸 메시지를 구분하여 영역 나누기
			if(sessionid == currentuser_session){
				var printHTML = "<div class='well'>";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
				
			} else{
				var printHTML = "<div class='well'>";
				printHTML += "<div class='alert alert-warning'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
			}
			
			console.log('chatting data: '+data);
			
			/* sock.close(); */
			
		}
		
		function onClose(evt){
			$("#data").append("연결 끊김");
		}
		
		});
		
	</script>

</head>


<body>
	<input type='text' id='message'>
	<input type='button' id='sendBtn' value='전송'>
	<div id='chatdata'></div>
</body>


</html>