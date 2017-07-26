package org.KMLP.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.KMLP.domain.MemberVO;
import org.KMLP.service.MemberSerive;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberSerive memberSerive;
	
	@Resource(name = "uploadPath")
	String uploadPath;
	

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//01. 사원전체목록
	@RequestMapping(value = "/mList.do", method = RequestMethod.GET)
	public String mListGET(Model model) {
		logger.info("mListGET PAGE...............");

		// 멤버리스트 가져오기
		List<MemberVO> list = memberSerive.selectAll();
		model.addAttribute("list", list);

		return "mList";
	}

	@RequestMapping(value = "/mList.do", method = RequestMethod.POST)
	public String mListPOST(Model model) throws Exception {

		logger.info("mListPOST post ...........");

		return "mList";
	}
	

	//02_01. 사원등록화면
	@RequestMapping(value = "/mRegist.do", method = RequestMethod.GET)
	public String mRegistGET(Model model) {

		logger.info("mRegistGET PAGE...............");

		return "mRegist";
	}

	//02_02. 사원데이터 삽입
	@RequestMapping(value = "/mRegist.do", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	public String mRegistPOST(MemberVO vo) throws Exception {
		logger.info("mRegistPOST post ...........");
		
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+file.getOriginalFilename());
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+vo.getM_id());
		
		//System.out.println(vo.getM_id());
		//System.out.println(vo.getFile().toString());
		
		String savedName = vo.getFile().getOriginalFilename();
        File target = new File(uploadPath, savedName);
        FileCopyUtils.copy(vo.getFile().getBytes(), target); // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사,  FileCopyUtils.copy(바이트배열, 파일객체)
        
        vo.setSavedName(savedName);
        memberSerive.insert(vo);
		return "redirect:/member/mList.do";
	}
	
	//03. 사원개인정보조회
	@RequestMapping(value = "/mContent.do", method = RequestMethod.GET)
	public String mContentGET(@RequestParam("m_id") String m_id, Model model) {
		logger.info("mContentGET PAGE...............");
		
		model.addAttribute("dto", memberSerive.selectContent(m_id));

		return "mContent";
	}

	@RequestMapping(value = "/mContent.do", method = RequestMethod.POST)
	public String mContentPOST(Model model) throws Exception {

		logger.info("mContentPOST post ...........");

		return "mContent";
	}
	
	@RequestMapping(value = "/mModify.do", method = RequestMethod.GET)
	public String mModifyGET(Model model) {

		logger.info("mModifyGET PAGE...............");

		return "mModify";
	}

	//04. 사원데이터수정
	@RequestMapping(value = "/mModify.do", method = RequestMethod.POST)
	public String mModifyPOST(@ModelAttribute MemberVO vo, Model model) throws Exception {
		logger.info("mModifyPOST post ...........");
		
		boolean result=memberSerive.checkPw(vo.getM_id(), vo.getM_pwd());

		if(result){
			memberSerive.update(vo);
			return "redirect:/member/mList.do";
		}else {
			model.addAttribute("dto", vo);
			model.addAttribute("message", "비밀번호 불일치");
			return "mContent";
		}

		
	}
	
	
	//05. 사원데이터삭제
		@RequestMapping("member/mDelete.do")
		public String delete(String m_id){
			memberSerive.delete(m_id);
			return "redirect:/member/mList.do";
		}
}
