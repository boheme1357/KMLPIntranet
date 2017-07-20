package org.KMLP.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 기본 컨트롤러
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home PAGE...............");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model) {

		logger.info("loginGET PAGE...............");

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(Model model, RedirectAttributes rttr) throws Exception {

		logger.info("loginPOST post ...........");

		return "redirect:/notice/notice_list";
	}
	
	@RequestMapping(value = "/mypage_modify", method = RequestMethod.GET)
	public String mypageGET(Model model) {

		logger.info("mypageGET PAGE...............");

		return "mypage_modify";
	}

	@RequestMapping(value = "/mypage_modify", method = RequestMethod.POST)
	public String mypagePOST(Model model) throws Exception {

		logger.info("mypagePOST post ...........");

		return "redirect:/notice/notice_list";
	}
	
}
