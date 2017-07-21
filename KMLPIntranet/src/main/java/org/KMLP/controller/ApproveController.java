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
	
	@RequestMapping(value = "/approve_list", method = RequestMethod.GET)
	public String approve_ListGET(Model model) {

		logger.info("approve_ListGET PAGE...............");

		return "/approve/approve_list";
	}

	@RequestMapping(value = "/approve_list", method = RequestMethod.POST)
	public String approve_ListPOST(Model model) throws Exception {

		logger.info("approve_ListPOST post ...........");

		return "/approve/approve_list";
	}
	
	@RequestMapping(value = "/approve_content", method = RequestMethod.GET)
	public String approve_ContentGET(Model model) {

		logger.info("approve_ContentGET PAGE...............");

		return "/approve/approve_content";
	}

	@RequestMapping(value = "/approve_content", method = RequestMethod.POST)
	public String approve_ContentPOST(Model model) throws Exception {

		logger.info("approve_ContentPOST post ...........");

		return "/approve/approve_content";
	}
	
	@RequestMapping(value = "/approve_modify", method = RequestMethod.GET)
	public String approve_ModifyGET(Model model) {

		logger.info("approve_ModifyGET PAGE...............");

		return "/approve/approve_modify";
	}

	@RequestMapping(value = "/approve_modify", method = RequestMethod.POST)
	public String approve_ModifyPOST(Model model) throws Exception {

		logger.info("approve_ModifyPOST post ...........");

		return "/approve/approve_modify";
	}
	
	@RequestMapping(value = "/approve_regist", method = RequestMethod.GET)
	public String approve_RegistGET(Model model) {

		logger.info("approve_RegistGET PAGE...............");

		return "/approve/approve_regist";
	}

	@RequestMapping(value = "/approve_regist", method = RequestMethod.POST)
	public String approve_RegistPOST(Model model) throws Exception {

		logger.info("approve_RegistPOST post ...........");

		return "/approve/approve_regist";
	}
}
