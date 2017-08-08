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

	function chatRoom_create(chatRoom_title_this) {
		chatRoom_title = chatRoom_title_this;
		confirm(chatRoom_title);
		openChatRoom();
	}
	
	function chatRoom_title_set() {
		chatRoom_title = prompt("채팅방 제목을 입력하세요.", "");
		openChatRoom();
	}

	function openChatRoom() {
		window.open('chatting.do?chatRoom_Title=' + chatRoom_title,
				'window_name',
				'width=500,height=500,location=no,status=no,scrollbars=yes');
	}
</script>
</head>
<body>

	<h1>KMLP 채팅 로비</h1>

	<input type='button' name='chatRoom_title_setBtn' value='채팅방 만들기'
		onClick='chatRoom_title_set()'>

	<div id='chatRoomListDiv'>
		<table border="1" width="800px" cellpadding="0" cellspacing="0"
			align="center">
			<tr>
			<th>방제목</th>
			<th>참가인원</th>
			</tr>
			<c:if test="${!empty chatRoomList}">
			<c:forEach var='row' items='${chatRoomList}'>
				<tr>
					<td><a href='#' onClick='chatRoom_create(${row})' >${row}</a></td>
					<td><c:out value="${chatUserCntMap[row]}" /></td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty chatRoomList}">
				<tr>
					<td>진행중인 채팅방이 없습니다.</td>
					<td></td>
				</tr>
			</c:if>
		</table>
	</div>

	<br />

</body>
</html>