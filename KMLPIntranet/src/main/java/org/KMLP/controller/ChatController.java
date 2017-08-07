package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public String chat_test(Model model) {
		logger.info("chat_test PAGE...............");

		return "chatting";
	}
}
