package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/approve/*")
public class ApproveController {

	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);
	
	@RequestMapping(value = "/aList", method = RequestMethod.GET)
	public String aListGET(Model model) {

		logger.info("aListGET PAGE...............");

		return "/approve/aList";
	}

	@RequestMapping(value = "/aList", method = RequestMethod.POST)
	public String aListPOST(Model model) throws Exception {

		logger.info("aListPOST post ...........");

		return "/approve/aList";
	}
	
	@RequestMapping(value = "/aContent", method = RequestMethod.GET)
	public String aContentGET(Model model) {

		logger.info("aContentGET PAGE...............");

		return "/approve/aContent";
	}

	@RequestMapping(value = "/aContent", method = RequestMethod.POST)
	public String aContentPOST(Model model) throws Exception {

		logger.info("aContentPOST post ...........");

		return "/approve/aContent";
	}
	
	@RequestMapping(value = "/aModify", method = RequestMethod.GET)
	public String aModifyGET(Model model) {

		logger.info("aModifyGET PAGE...............");

		return "/approve/aModify";
	}

	@RequestMapping(value = "/aModify", method = RequestMethod.POST)
	public String aModifyPOST(Model model) throws Exception {

		logger.info("aModifyGET post ...........");

		return "/approve/aModify";
	}
	
	@RequestMapping(value = "/aRegist", method = RequestMethod.GET)
	public String aRegistGET(Model model) {

		logger.info("aRegistGET PAGE...............");

		return "/approve/aRegist";
	}

	@RequestMapping(value = "/aRegist", method = RequestMethod.POST)
	public String aRegistGETPOST(Model model) throws Exception {

		logger.info("aRegistGET post ...........");

		return "/approve/aRegist";
	}
}
