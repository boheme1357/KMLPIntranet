package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String notice_ListGET(Model model) {

		logger.info("notice_ListGET PAGE...............");

		return "notice_list";
	}

	@RequestMapping(value = "/notice_list", method = RequestMethod.POST)
	public String notice_ListPOST(Model model) throws Exception {

		logger.info("notice_ListPOST post ...........");

		return "notice_list";
	}
	
	@RequestMapping(value = "/notice_content", method = RequestMethod.GET)
	public String notice_ContentGET(Model model) {

		logger.info("notice_ContentGET PAGE...............");

		return "notice_content";
	}

	@RequestMapping(value = "/notice_content", method = RequestMethod.POST)
	public String notice_ContentPOST(Model model) throws Exception {

		logger.info("notice_ContentPOST post ...........");

		return "notice_content";
	}
	
	@RequestMapping(value = "/notice_modify", method = RequestMethod.GET)
	public String notice_ModifyGET(Model model) {

		logger.info("notice_ModifyGET PAGE...............");

		return "notice_modify";
	}

	@RequestMapping(value = "/notice_modify", method = RequestMethod.POST)
	public String notice_ModifyPOST(Model model) throws Exception {

		logger.info("notice_ModifyPOST post ...........");

		return "notice_modify";
	}
	
	@RequestMapping(value = "/notice_regist", method = RequestMethod.GET)
	public String notice_RegistGET(Model model) {

		logger.info("notice_RegistGET PAGE...............");

		return "notice_regist";
	}

	@RequestMapping(value = "/notice_regist", method = RequestMethod.POST)
	public String notice_RegistPOST(Model model) throws Exception {

		logger.info("notice_RegistPOST post ...........");

		return "notice_regist";
	}
}
