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
	
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public String mListGET(Model model) {

		logger.info("mListGET PAGE...............");

		return "/member/mList";
	}

	@RequestMapping(value = "/mList", method = RequestMethod.POST)
	public String mListPOST(Model model) throws Exception {

		logger.info("mListPOST post ...........");

		return "/member/mList";
	}
	
	@RequestMapping(value = "/mContent", method = RequestMethod.GET)
	public String mContentGET(Model model) {

		logger.info("mContentGET PAGE...............");

		return "/member/mContent";
	}

	@RequestMapping(value = "/mContent", method = RequestMethod.POST)
	public String mContentPOST(Model model) throws Exception {

		logger.info("mContentPOST post ...........");

		return "/member/mContent";
	}
	
	@RequestMapping(value = "/mModify", method = RequestMethod.GET)
	public String mModifyGET(Model model) {

		logger.info("mModifyGET PAGE...............");

		return "/member/mModify";
	}

	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public String mModifyPOST(Model model) throws Exception {

		logger.info("mModifyPOST post ...........");

		return "/member/mModify";
	}
	
	@RequestMapping(value = "/mRegist", method = RequestMethod.GET)
	public String mRegistGET(Model model) {

		logger.info("mRegistGET PAGE...............");

		return "/member/mRegist";
	}

	@RequestMapping(value = "/mRegist", method = RequestMethod.POST)
	public String mRegistPOST(Model model) throws Exception {

		logger.info("mRegistPOST post ...........");

		return "/member/mRegist";
	}
}
