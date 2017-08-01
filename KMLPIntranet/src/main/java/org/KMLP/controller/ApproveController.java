package org.KMLP.controller;

import java.util.HashMap;

import java.util.List;

import javax.inject.Inject;

import org.KMLP.service.ApproveService;
import org.KMLP.service.DocumentService;
import org.KMLP.domain.ApproveVO;
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
	public String aRegistPOST(@ModelAttribute DocumentVO vo, @RequestParam("a_id_arr[]") String[] a_id_arr, Model model)
			throws Exception {

		logger.info("aRegistPOST PAGE ...........");

		ApproveVO avo = new ApproveVO();
		avo.setA_id_arr(a_id_arr);

		// for(String i : avo.getA_id_arr())
		// System.out.println("--------------------------------"+i);

		documentSerive.insert(vo, avo);

		// a_num set 해주는 부분 추가해야함

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

	@RequestMapping(value = "/aApproved.do", method = RequestMethod.GET)
	public String aApprovedGET(Model model) {

		logger.info("aApprovedGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();

		// 1. 자신이 작성한 결재문서 리스트
		List<DocumentVO> sentList = documentSerive.selectSendListAll_end(m_id);
		model.addAttribute("sentList", sentList);

		// 2. 자신이 수신한 결재문서 리스트
		List<DocumentVO> receiveList = documentSerive.selectReceiveListAll_end(m_id);
		model.addAttribute("receiveList", receiveList);

		return "aApproved";
	}

	@RequestMapping(value = "/aApproved.do", method = RequestMethod.POST)
	public String aApprovedPOST(Model model) throws Exception {

		logger.info("aApprovedPOST post ...........");

		return "aApproved";
	}

	@RequestMapping(value = "/aApproving.do", method = RequestMethod.GET)
	public String aApprovingGET(Model model) {

		logger.info("aApprovingGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();

		// 1. 자신이 작성한 결재문서 리스트
		List<DocumentVO> sentList = documentSerive.selectSendListAll_ing(m_id);
		model.addAttribute("sentList", sentList);

		// 2. 자신이 수신한 결재문서 리스트
		List<DocumentVO> receiveList = documentSerive.selectReceiveListAll_ing(m_id);
		model.addAttribute("receiveList", receiveList);

		return "aApproving";
	}

	@RequestMapping(value = "/aApproving.do", method = RequestMethod.POST)
	public String aApprovingPOST(Model model) throws Exception {

		logger.info("aApprovingPOST post ...........");

		return "aApproving";
	}

	@RequestMapping(value = "/aReturn.do", method = RequestMethod.GET)
	public String aReturnGET(Model model) {

		logger.info("aReturnGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();

		// 1. 자신이 작성한 결재문서 리스트
		List<DocumentVO> sentList = documentSerive.selectSendListAll_return(m_id);
		model.addAttribute("sentList", sentList);

		return "aReturn";
	}

	@RequestMapping(value = "/aReturn.do", method = RequestMethod.POST)
	public String aReturnPOST(Model model) throws Exception {

		logger.info("aReturnPOST post ...........");
		
		// 3. 미결된 결재문서 넘버, 상태
		//		HashMap<String, Boolean> unapprDocMap = documentSerive.selectUnapproveDoc(m_id);
		//		model.addAttribute("unapprDocMap", unapprDocMap);

		return "aReturn";
	}

}
