package org.KMLP.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.KMLP.service.DocumentService;
import org.KMLP.util.ChatWebSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	/*@Inject
	ChatWebSocketHandler chatWebSocketHandler;*/
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public String chat_chattingGET(@RequestParam String chatRoom_Title, Model model) {
		logger.info("chat_chattingGET PAGE...............");

		ChatWebSocketHandler.chatRoom_Title = chatRoom_Title;
		
		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();
				
		System.out.println("------채팅방 이름------"+chatRoom_Title);
		
		model.addAttribute("m_id", m_id);

		return "/chat/chatting";
	}

	@RequestMapping(value = "/chatting.do", method = RequestMethod.POST)
	public String chat_chattingPOST(Model model) {
		logger.info("chat_chattingPOST PAGE...............");

		return "/chat/chatting.do";
	}

	@RequestMapping(value = "/lobby.do", method = RequestMethod.GET)
	public String chat_lobbyGET(Model model) {
		logger.info("chat_lobbyGET PAGE...............");
		
		List<String> chatRoomList = ChatWebSocketHandler.chatRoom_Title_List;
		Map<String, Integer> chatUserCntMap = new ConcurrentHashMap <String, Integer>(); //참여인원
		
		
		 Iterator<String> iterator = ChatWebSocketHandler.titleAndSessions.keySet().iterator();
		    while (iterator.hasNext()) { 
		    	
		        String key = (String) iterator.next();
		        int size = ChatWebSocketHandler.titleAndSessions.get(key).size(); // 방 세션 개수  = 참여인원
		        
		        chatUserCntMap.put(key, size);
		        System.out.println(chatUserCntMap.get(key));
		        
		    }

		       
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("chatUserCntMap", chatUserCntMap);

		return "lobby";
	}

	@RequestMapping(value = "/lobby.do", method = RequestMethod.POST)
	public String chat_lobbyPOST(Model model) {
		logger.info("chat_lobbyPOST PAGE...............");

		return "lobby";
	}

	/*
	 * @RequestMapping(value = "/chat.do/info", method = RequestMethod.GET) public
	 * void chat_info(@RequestParam String T, Model model) {
	 * 
	 * logger.info("chat_info PAGE..............."+T);
	 * 
	 * 
	 * }
	 */

}
