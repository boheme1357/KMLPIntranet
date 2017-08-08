package org.KMLP.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	public static String chatRoom_Title;
	public static List<String> chatRoom_Title_List = new ArrayList<String>();
	// 유저 입장정보 : 세션 아이디, 방제
	public static  Map<String, String> titleAndUser = new ConcurrentHashMap<String, String>(); 
	// 방제 , 참가자 세션 리스트 
	public static  Map<String, List<WebSocketSession>> titleAndSessions = new ConcurrentHashMap<String, List<WebSocketSession>>(); 
	private List<WebSocketSession> sessionList;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String sessionID = session.getId();
		log(sessionID + "연결 됨" + session +chatRoom_Title);

		// 신규 채팅방 개설
		if (!titleAndSessions.containsKey(chatRoom_Title)) {
			sessionList = new ArrayList<WebSocketSession>();
			sessionList.add(session);
			chatRoom_Title_List.add(chatRoom_Title); // 방제 리스트 추가
			titleAndSessions.put(chatRoom_Title, sessionList); // 채팅방 생성 + 세션 추가
			titleAndUser.put(sessionID, chatRoom_Title); // 유저 입장정보 추가
			System.out.println("----------새로운 채팅방 생성--" + chatRoom_Title + " : " + sessionID);

		} else { // 기존 채팅방 참여
			titleAndSessions.get(chatRoom_Title).add(session);
			titleAndUser.put(sessionID, chatRoom_Title);
			System.out.println("----------채팅방 인원 추가--" + chatRoom_Title + sessionID);
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String sessionID = session.getId();
		String chatRoom_Title_tmp = titleAndUser.get(sessionID);
		
		log(sessionID + " afterConnectionClosed 연결 종료됨");
		
		
		if (titleAndSessions.get(chatRoom_Title_tmp).size() == 1) { // 방에 남은 마지막 유저이면
			
				System.out.println("--------채팅방 삭제 : "+chatRoom_Title_tmp+" 방장 퇴장 : "+sessionID);
				titleAndSessions.remove(chatRoom_Title_tmp); // 채팅방 삭제
				titleAndUser.remove(sessionID); // 유저 입장정보 삭제
				for(int i=0; i<chatRoom_Title_List.size(); i++) { // 채팅방 리스트에서 삭제
					if(chatRoom_Title_List.get(i).equals(chatRoom_Title_tmp)) {
						chatRoom_Title_List.remove(i);
					}
				}
			
		} else {
			System.out.println("--------참가 유저 삭제 : "+chatRoom_Title_tmp+" 에서 "+sessionID+"퇴장.");
			titleAndSessions.get(chatRoom_Title_tmp).remove(session);// 채팅방 참가자만 삭제
			titleAndUser.remove(sessionID); // 유저 입장정보 삭제
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로부터 메시지 수신 handleTextMessage: " + message.getPayload());
		
		String sessionID = session.getId();
		String chatRoom_Title_tmp = titleAndUser.get(sessionID);
		
		for (WebSocketSession s : titleAndSessions.get(chatRoom_Title_tmp)) {
			s.sendMessage(message);
			log(s.getId() + "에 메시지 발송 handleTextMessage: " + message.getPayload());
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생 handleTransportError: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println("--------" + logmsg);
	}


}
