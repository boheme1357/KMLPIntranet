package org.KMLP.util;

import java.util.ArrayList;
import java.util.List;

import org.KMLP.controller.ApproveController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{

	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);
	// 방법 2 : 전채 채팅
	// 웹 소캣 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	// 클라이언트와 연결된 후 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 맵을 쓸 때 방법
		// sessions.put(session.getId(), session);
		// List 쓸 때 방법
		sessionList.add(session);
		// 세션값을 불러온 0번째 중괄호에 session.getId() 을 넣으라는 뜻
		logger.info("{} 연결됨", session.getId());
		
		//Session값을 가지고 데이터베이스등의 작업을 하면 채팅 참여 사용자 정보 리스트를 구현할 수 있음
		System.out.println("채팅방 입장: " + session.getPrincipal().getName());
	}
	
	// 웹 소켓 서버로 데이터를 전송했을 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)  throws Exception {
		// 0번째 session.getId() 1번째에 message.getPayload() 넣음
		logger.info("{} 로부터 {} 받음", session.getId(), message.getPayload());
		// logger.info("{} 로부터 {} 받음", new String[]{session.getId(), message.getPayload()});
		
		// 연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		// getPrincipal() 이용해서 세션에 물려있는 유저의 정보를 불러옴. 세션의 정보는 User 를 이용한 것과 동일
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName() + "|" + message.getPayload() ));
		}
	}
	
	
	// 클라이언트와 연결이 끊어진 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		// List 삭제
		sessionList.remove(session);
		
		logger.info("{} 연결 끊김.", session.getId());
		
		System.out.println("채팅방 퇴장 : "+session.getPrincipal().getName());
		
	}
	
}
