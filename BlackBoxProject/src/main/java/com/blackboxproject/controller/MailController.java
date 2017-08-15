package com.blackboxproject.controller;

import java.util.Random;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blackboxproject.domain.UserVO;
import com.blackboxproject.service.MailService;
import com.blackboxproject.service.UserService;

@Controller
@RequestMapping("/mail")
public class MailController {

	private static Logger logger = LoggerFactory.getLogger(MailController.class);

	@Inject
	private UserService userService;
	@Inject
	private MailService mailService;

	// 비밀번호 찾기 페이지 보여주기
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public void find_PwGET(Model model) throws Exception {
		logger.info("user_find_pw get ...........");
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String find_PwPOST(RedirectAttributes rttr, @ModelAttribute("user_id") String user_id,
			@ModelAttribute("user_email") String user_email) throws Exception {
		UserVO user = userService.find_pw_user(user_id, user_email);
		if (user != null) {
			int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
			String user_pw = String.valueOf(ran);
			userService.updateRanPw(user_id, user_pw); // 해당 유저의 DB정보 변경
			String subject = "[BBP]임시 비밀번호 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("안녕하세요 :) BBP에서 임시 비밀번호 발급 안내 메일을 보내드립니다.");
			sb.append("귀하의 임시 비밀번호는 " + user_pw + " 입니다.");
			sb.append("로그인 후 안전한 비밀번호로 변경해 주세요^^");
			mailService.send(subject, sb.toString(), "dudwnsdn30@gmail.com", user_email, null);
			rttr.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
		} else {
			rttr.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
		}
		return "redirect:/mail/find_pw";
	}
}
