package org.KMLP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public String member_ListGET(Model model) {

		logger.info("member_ListGET PAGE...............");

		return "/member/member_list";
	}

	@RequestMapping(value = "/member_list", method = RequestMethod.POST)
	public String member_ListPOST(Model model) throws Exception {

		logger.info("member_ListPOST post ...........");

		return "/member/member_list";
	}
	
	@RequestMapping(value = "/member_content", method = RequestMethod.GET)
	public String member_ContentGET(Model model) {

		logger.info("member_ContentGET PAGE...............");

		return "/member/member_content";
	}

	@RequestMapping(value = "/member_content", method = RequestMethod.POST)
	public String member_ContentPOST(Model model) throws Exception {

		logger.info("member_ContentPOST post ...........");

		return "/member/member_content";
	}
	
	@RequestMapping(value = "/member_modify", method = RequestMethod.GET)
	public String member_ModifyGET(Model model) {

		logger.info("member_ModifyGET PAGE...............");

		return "/member/member_modify";
	}

	@RequestMapping(value = "/member_modify", method = RequestMethod.POST)
	public String member_ModifyPOST(Model model) throws Exception {

		logger.info("member_ModifyPOST post ...........");

		return "/member/member_modify";
	}
	
	@RequestMapping(value = "/member_regist", method = RequestMethod.GET)
	public String member_RegistGET(Model model) {

		logger.info("member_RegistGET PAGE...............");

		return "/member/member_regist";
	}

	@RequestMapping(value = "/member_regist", method = RequestMethod.POST)
	public String member_RegistPOST(Model model) throws Exception {

		logger.info("member_RegistPOST post ...........");

		return "/member/member_regist";
	}
}
