package org.KMLP.controller;

import java.util.List;

import javax.inject.Inject;

import org.KMLP.service.NoticeSerive;
import org.KMLP.domain.NoticeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	NoticeSerive noticeSerive;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	// 01. 공지사항전체목록
	@RequestMapping(value = "/nList.do", method = RequestMethod.GET)
	public String nListGET(Model model) {
		logger.info("nListGET PAGE...............");

		List<NoticeVO> list = noticeSerive.selectAll();
		model.addAttribute("list", list);

		return "nList";
	}

	@RequestMapping(value = "/nList.do", method = RequestMethod.POST)
	public String nListPOST(Model model) throws Exception {

		logger.info("nListPOST post ...........");

		return "nList";
	}

	// 02_01. 공지사항등록화면
	@RequestMapping(value = "/nRegist.do", method = RequestMethod.GET)
	public String nRegistGET(Model model) {

		logger.info("nRegistGET PAGE...............");

		return "nRegist";
	}

	// 02_02. 공지사항데이터 삽입
	@RequestMapping(value = "/nRegist.do", method = RequestMethod.POST)
	public String nRegistPOST(@ModelAttribute NoticeVO vo, Model model) throws Exception {
		logger.info("nRegistPOST post ...........");

		noticeSerive.insert(vo);

		return "redirect:/notice/nList.do";
	}

	// 03. 공지사항내용조회
	@RequestMapping(value = "/nContent.do", method = RequestMethod.GET)
	public String nContentGET(@RequestParam("n_num") String n_num, Model model) {
		logger.info("nContentGET PAGE...............");

		model.addAttribute("dto", noticeSerive.selectContent(n_num));

		return "nContent";
	}

	@RequestMapping(value = "/nContent.do", method = RequestMethod.POST)
	public String nContentPOST(@ModelAttribute NoticeVO vo, Model model) throws Exception {
		logger.info("nContentPOST post ...........");
		
		noticeSerive.update(vo);

		return "redirect:/notice/nList";
	}

	@RequestMapping(value = "/nModify.do", method = RequestMethod.GET)
	public String nModifyGET(Model model) {

		logger.info("nModifyGET PAGE...............");

		return "nModify";
	}

	// 04. 공지사항데이터수정
	@RequestMapping(value = "/nModify.do", method = RequestMethod.POST)
	public String nModifyPOST(@ModelAttribute NoticeVO vo, Model model) throws Exception {
		logger.info("nModifyPOST post ...........");

		noticeSerive.update(vo);

		return "redirect:/notice/nList";
	}

	// 05. 공지사항데이터삭제
	@RequestMapping("notice/nDelete.do")
	public String delete(String n_num) {
		System.out.println("삭제");
		noticeSerive.delete(n_num);
		return "redirect:/notice/nList";
	}

}
