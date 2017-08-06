package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat/*")
public class ChattingController {

	
	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);
	
	
	// 02_01. 일일업무일지 등록화면
		@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
		public ModelAndView chatGET(ModelAndView mv) {

			logger.info("chatGET PAGE...............");
			
			mv.setViewName("chat/chatting");
			
			// 사용자 정보 출력(세션)
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			System.out.println("user name : "+user.getUsername());
			
			System.out.println("normal chat page");
			
			mv.addObject("userid", user.getUsername());			

			return mv;
		}
}
