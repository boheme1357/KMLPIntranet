package org.KMLP.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.KMLP.service.NoticeService;
import org.KMLP.domain.BoardPager;
import org.KMLP.domain.NoticeVO;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	NoticeService noticeSerive;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	/* 페이징관련시작 */

	// 01 전체레코드 수, 별도코드없음

	// 02 한페이지에 표시할 목록, @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	@RequestMapping(value = "/nList.do", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage) throws Exception {

		logger.info("nListGET PAGE...............");

		// 레코드의 갯수 계산
		int count = noticeSerive.selectTotalCnt();

		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<NoticeVO> list = noticeSerive.selectBetween(start, end);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count); // 레코드의 갯수
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("nList"); // 뷰를 list.jsp로 설정

		return mav; // list.jsp로 List가 전달된다.

	}

	// 아래코드에 있음, 삭제예정
	@RequestMapping(value = "/nContent.do", method = RequestMethod.GET)
	public ModelAndView nContentGET(@RequestParam("n_num") int n_num, Model model) {
		// 조회수 증가 처리
		noticeSerive.updateViewCnt(n_num);

		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();

		// 뷰의 이름
		mav.setViewName("/notice/nContent");

		// 뷰에 전달할 데이터
		mav.addObject("dto", noticeSerive.selectContent(n_num));

		return mav;
	}

	/* 페이징관련끝 */


	
	
	@RequestMapping(value = "/nList.do", method = RequestMethod.POST)
	public String nListPOST(Model model) throws Exception {
		logger.info("nListPOST post ...........");
		

		return "nList";
	}

	// 02_01. 공지사항등록화면
	@RequestMapping(value = "/nRegist.do", method = RequestMethod.GET)
	public String nRegistGET(Model model) {

		logger.info("nRegistGET PAGE...............");
		
		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		 model.addAttribute("m_id", user.getUsername());

		return "nRegist";
	}

	// 02_02. 공지사항데이터 삽입
	@RequestMapping(value = "/nRegist.do", method = RequestMethod.POST)
	public String nRegistPOST(@ModelAttribute NoticeVO vo, Model model) throws Exception {
		logger.info("nRegistPOST post ...........");
		
		noticeSerive.insert(vo);

		return "redirect:/notice/nList.do";
	}

/*	// 03. 공지사항내용조회/ 위의  페이징처리 03으로 변경
	@RequestMapping(value = "/nContent.do", method = RequestMethod.GET)
	public String nContentGET(@RequestParam("n_num") String n_num, Model model) {
		logger.info("nContentGET PAGE...............");

		model.addAttribute("dto", noticeSerive.selectContent(n_num));

		return "nContent";
	}
*/
	@RequestMapping(value = "/nContent.do", method = RequestMethod.POST)
	public String nContentPOST(@ModelAttribute NoticeVO vo, Model model) throws Exception {
		logger.info("nContentPOST post ...........");
		
		noticeSerive.update(vo);

		return "redirect:/notice/nList.do";
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

		return "redirect:/notice/nList.do";
	}

	// 05. 공지사항데이터삭제
	@RequestMapping("notice/nDelete.do")
	public String delete(int n_num) {
		System.out.println("삭제");
		noticeSerive.delete(n_num);
		return "redirect:/notice/nList.do";
	}

}
