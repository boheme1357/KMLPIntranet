package org.KMLP.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.KMLP.service.DocumentService;
import org.KMLP.domain.DocumentVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/approve/*")
public class ApproveController {

	@Inject
	DocumentService documentSerive;

	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);

	// 01. 일일업무일지 전체목록
	@RequestMapping(value = "/aList.do", method = RequestMethod.GET)
	public String aListGET(Model model) {

		logger.info("aListGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();
		System.out.println("---------------------------------------------------------" + m_id);

		List<DocumentVO> list = documentSerive.selectReceiveListAll(m_id);
		model.addAttribute("list", list);

		// 1. 자신이 작성한 결재문서 리스트
		List<DocumentVO> sentList = documentSerive.selectSentListAll(m_id);
		model.addAttribute("sentList", list);

		// 2. 자신이 수신한 결재문서 리스트
		List<DocumentVO> receiveList = documentSerive.selectReceiveListAll(m_id);
		model.addAttribute("receiveList", list);

		// 3. 미결된 결재문서 넘버, 상태
		HashMap<String, Boolean> unapprDocMap = documentSerive.selectUnapproveDoc(m_id);
		model.addAttribute("unapprDocMap", unapprDocMap);

		/*
		 * 맵 데이터 확인 로그 Iterator<String> iterator = unapprDocMap.keySet().iterator();
		 * while (iterator.hasNext()) { String key = (String) iterator.next(); // 키 얻기
		 * System.out.println("--------------------------------key=" + key + " / value="
		 * + unapprDocMap.get(key)); // 출력 }
		 */

		return "aList";
	}

	@RequestMapping(value = "/aList.do", method = RequestMethod.POST)
	public String aListPOST(Model model) throws Exception {

		logger.info("aListPOST post ...........");

		return "aList";
	}

	// 02_01. 일일업무일지 등록화면
	@RequestMapping(value = "/aRegist.do", method = RequestMethod.GET)
	public String aRegistGET(Model model) {

		logger.info("aRegistGET PAGE...............");
		
		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("m_id", user.getUsername());
		
		return "aRegist";
	}

	// 02_02. 일일업무일지 데이터 삽입
	@RequestMapping(value = "/aRegist.do", method = RequestMethod.POST)
	public String aRegistPOST(@ModelAttribute DocumentVO vo, Model model) throws Exception {

		logger.info("aRegistPOST PAGE ...........");

		documentSerive.insert(vo);

		return "redirect:/approve/aList.do";
	}

	// 03. 일일업무일지 내용조회
	@RequestMapping(value = "/aContent.do", method = RequestMethod.GET)
	public String aContentGET(@RequestParam("d_num") String d_num, Model model) {

		logger.info("aContentGET PAGE...............");

		model.addAttribute("dto", documentSerive.selectContent(d_num));

		return "aContent";
	}

	// 04. 일일업무일지 데이터수정
	@RequestMapping(value = "/aContent.do", method = RequestMethod.POST)
	public String aContentPOST(@ModelAttribute DocumentVO vo, Model model) throws Exception {

		logger.info("aContentPOST post ...........");

		documentSerive.update(vo);

		return "redirect:/approve/aList.do";
	}

	@RequestMapping(value = "/aModify.do", method = RequestMethod.GET)
	public String aModifyGET(Model model) {

		logger.info("aModifyGET PAGE...............");

		return "aModify";
	}

	@RequestMapping(value = "/aModify.do", method = RequestMethod.POST)
	public String aModifyPOST(Model model) throws Exception {

		logger.info("aModifyGET post ...........");

		return "aModify";
	}

	// 05. 일일업무일지 데이터삭제
	@RequestMapping("document/aDelete.do")
	public String delete(@RequestParam("d_num") String d_num) {
		logger.info("delete post ...........");
		documentSerive.delete(d_num);
		return "redirect:/document/aList.do";
	}

}
