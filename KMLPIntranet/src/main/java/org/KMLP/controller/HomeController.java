package org.KMLP.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.KMLP.domain.MemberVO;
import org.KMLP.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	MemberService memberSerive;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("main PAGE...............");

		
		return "login";
	}
	
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home PAGE...............");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginGET(Model model) {

		logger.info("loginGET PAGE...............");

		return "login";
	}
	
	@RequestMapping(value = "/accessDenied.do", method = RequestMethod.GET)
	public String accessDeniedGET(Locale locale, Model model) {
		logger.info("accessDeniedGET PAGE...............");
		
		return "accessDenied";
	}
	
	
	/*
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(Model model, RedirectAttributes rttr) throws Exception {

		logger.info("loginPOST post ...........");

		return "redirect:/notice/nList";
	}*/
	
	@RequestMapping(value = "/myModify.do", method = RequestMethod.GET)
	public String myModifyGET(Model model) {

		logger.info("myModifyGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();
		MemberVO vo = memberSerive.selectContent(m_id);
		model.addAttribute("dto", vo );
		
		return "myModify";
	}

	@RequestMapping(value = "/myModify.do", method = RequestMethod.POST)
	public String myModifyPOST(Model model) throws Exception {

		logger.info("myModifyPOST post ...........");

		return "redirect:/notice/nList.do";
	}
	
	@RequestMapping("newFile.do")
	public String NewFile(){
		return "NewFile";
	}
	
}
