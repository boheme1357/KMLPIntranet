package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public String chat_chattingGET(Model model) {
		logger.info("chat_chattingGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();
		
		model.addAttribute("m_id", m_id);

		return "/chat/chatting";
	}

	@RequestMapping(value = "/chatting.do", method = RequestMethod.POST)
	public String chat_chattingPOST(Model model) {
		logger.info("chat_chattingPOST PAGE...............");

		return "redirect:/chat/chatting.do";
	}

	@RequestMapping(value = "/lobby.do", method = RequestMethod.GET)
	public String chat_lobbyGET(Model model) {
		logger.info("chat_lobbyGET PAGE...............");

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
