package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/nList", method = RequestMethod.GET)
	public String nListGET(Model model) {

		logger.info("nListGET PAGE...............");

		return "/notice/nList";
	}

	@RequestMapping(value = "/nList", method = RequestMethod.POST)
	public String nListPOST(Model model) throws Exception {

		logger.info("nListPOST post ...........");

		return "/notice/nList";
	}
	
	@RequestMapping(value = "/nContent", method = RequestMethod.GET)
	public String nContentGET(Model model) {

		logger.info("nContentGET PAGE...............");

		return "/notice/nContent";
	}

	@RequestMapping(value = "/nContent", method = RequestMethod.POST)
	public String nContentPOST(Model model) throws Exception {

		logger.info("nContentPOST post ...........");

		return "/notice/nContent";
	}
	
	@RequestMapping(value = "/nModify", method = RequestMethod.GET)
	public String nModifyGET(Model model) {

		logger.info("nModifyGET PAGE...............");

		return "/notice/nModify";
	}

	@RequestMapping(value = "/nModify", method = RequestMethod.POST)
	public String nModifyPOST(Model model) throws Exception {

		logger.info("nModifyPOST post ...........");

		return "/notice/nModify";
	}
	
	@RequestMapping(value = "/nRegist", method = RequestMethod.GET)
	public String nRegistGET(Model model) {

		logger.info("nRegistGET PAGE...............");

		return "/notice/nRegist";
	}

	@RequestMapping(value = "/nRegist", method = RequestMethod.POST)
	public String nRegistPOST(Model model) throws Exception {

		logger.info("nRegistPOST post ...........");

		return "/notice/nRegist";
	}
}
