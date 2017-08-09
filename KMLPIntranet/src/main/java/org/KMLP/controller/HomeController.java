package org.KMLP.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.KMLP.domain.MemberVO;
import org.KMLP.service.MemberService;
import org.KMLP.util.ShaEncoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	MemberService memberSerive;

	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;

	@Resource(name = "uploadPath")
	String uploadPath;

	
	//이메일관련
	@Autowired
	 private JavaMailSender mailSender;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("main PAGE...............");

		return "login";
	}

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home PAGE...............");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginGET(Model model) {

		logger.info("loginGET PAGE...............");

		return "login";
	}

	@RequestMapping(value = "/accessDenied.do", method = RequestMethod.GET)
	public String accessDeniedGET(Locale locale, Model model) {
		logger.info("accessDeniedGET PAGE...............");

		return "accessDenied";
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public
	 * String loginPOST(Model model, RedirectAttributes rttr) throws Exception {
	 * 
	 * logger.info("loginPOST post ...........");
	 * 
	 * return "redirect:/notice/nList"; }
	 */

	@RequestMapping(value = "/myModify.do", method = RequestMethod.GET)
	public String myModifyGET(Model model) {

		logger.info("myModifyGET PAGE...............");

		// 시큐리티에서 로그인한 유저 id 받아오는 코드
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String m_id = user.getUsername();
		MemberVO vo = memberSerive.selectContent(m_id);
		model.addAttribute("dto", vo);

		return "myModify";
	}

	@RequestMapping(value = "/myModify.do", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	public String myModifyPOST(MemberVO vo, Model model, RedirectAttributes redirectAttributes) throws Exception {

		logger.info("myModifyPOST post ...........");

		// 비번 암호화
		String tmpPW = encoder.encoding(vo.getM_pwd());
		vo.setM_pwd(tmpPW);

		String ms_img = vo.getFile().getOriginalFilename();

		if (ms_img.equals(""))
			logger.info("도장 이미지 미등록 ...........");
		else {
			File target = new File(uploadPath, ms_img);
			FileCopyUtils.copy(vo.getFile().getBytes(), target); // 임시디렉토리에 저장된
																	// 업로드된 파일을
																	// 지정된 디렉토리로
																	// 복사,
																	// FileCopyUtils.copy(바이트배열,
																	// 파일객체)
			vo.setMs_img(ms_img);
		}

		memberSerive.update(vo);

		model.addAttribute("dto", vo);
		redirectAttributes.addFlashAttribute("message", "수정되었습니다.");

		return "redirect:/myModify.do";
	}

	
	
	
	
	
	
	
	/* 비밀번호찾기_임시번호메일로 보내기 시작 */

	// 비밀번호찾기post
	@RequestMapping(value = "/find.do", method = RequestMethod.POST)
	public String findPOST() {
		logger.info("findpost  POST...........");

		return "find";
	}

	// 비밀번호찾기 get
	@RequestMapping(value = "/find.do", method = RequestMethod.GET)
	public String findGET() {
		logger.info("findGET  get...........");

		return "find";
	}

	@RequestMapping(value = "mailSending.do", method = RequestMethod.POST)

	public String mailSending(String m_id, String m_email_id, String m_email_do, Model model) {
		logger.info("mailSendingPOST post ...........");

		String email;

		MemberVO vo = memberSerive.selectFindPw(m_id, m_email_id, m_email_do);

		if (vo == null) {
			model.addAttribute("message", "비밀번호 불일치");
			return "find";
		} else {

			int tempPw = new Random().nextInt(100000) + 10000; // 10000 ~ 99999

			String pw = Integer.toString(tempPw);

			String text = "귀하의 임시번호입니다\n" + "임시번호 : " + pw + "\n 로그인 후 반드시 비밀번호를 수정하세요";
			memberSerive.updateTempPw(m_id, pw);

			System.out.println(vo.getM_email_id());

			email = vo.getM_email_id() + "@" + vo.getM_email_do();

			String setfrom = "boheme1357@gmail.com";      // 이메일을 보내는 사람의 이메일주소
			String tomail = email; // 받는 사람 이메일
			String title = "임시비밀번호입니다"; // 제목
			String content = text; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);

			} catch (Exception e) {
				System.out.println(e);
			}

			return "login"; // 로그인페이지로 이동예정

		}
	}

	/* 비밀번호찾기_임시번호메일로 보내기 끝 */









}
