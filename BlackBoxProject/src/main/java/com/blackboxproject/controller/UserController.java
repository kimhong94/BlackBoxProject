package com.blackboxproject.controller;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.blackboxproject.domain.AuthVO;
import com.blackboxproject.domain.UserVO;
import com.blackboxproject.dto.LoginDTO;
import com.blackboxproject.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService service;

	private UserVO vo;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		vo = service.login(dto);

		if (vo == null) {
			return; // /loginPost로 리턴해서 self.location
		}

		model.addAttribute("userVO", vo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getUser_id(), session.getId(), sessionLimit);
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		logger.info("logout.................................1");

		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserVO vo = (UserVO) obj;
			logger.info("logout.................................2");
			session.removeAttribute("login");
			session.invalidate();
			logger.info("logout.................................3");
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				logger.info("logout.................................4");
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUser_id(), session.getId(), new Date());
			}
		}
		return "redirect:/user/login";
	}

	// 회원 종류 선택 페이지 보여주기
	@RequestMapping(value = "/user_auth", method = RequestMethod.GET)
	public void authGET(UserVO vo, Model model) throws Exception {

		logger.info("auth get ...........");

	}

	// 회원 가입 페이지 보여주기
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(UserVO vo, Model model) throws Exception {

		logger.info("regist get ...........");
	}

	// 회원 가입 등록
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO vo, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		logger.info("regist user ...........");
		logger.info(vo.toString());

		service.addUser(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/login";

	}

	// 로그인 후 첫 페이지
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public void checkGET(Model model) throws Exception {
		model.addAttribute("userVO", vo);
		System.out.println(vo);
		logger.info("regist get ...........");

	}

	// 학교 인증 페이지 보여주기
	@RequestMapping(value = "/course_auth", method = RequestMethod.GET)
	public void courseGET(Model model) throws Exception {

		model.addAttribute("userVO", vo);
		System.out.println(vo);
		logger.info("course get ...........");
	}

	// 받아온 학번과 비밀번호를 토대로 인증하는 과정
	// 1. 학번과 비밀번호를 -> 파이썬 파일로 보내주기 (String으로 보내줄 예정)
	// 2. 파이썬파일에서 스크레이핑 과정을 통해서 교과목과 분반 가져오기
	// 3. 파이썬에서 데이터 처리 후 -> jSon 파일로 다시 건내 받음
	// 4. 받아온 목록을 토대로 회원 jnu_course 테이블의 교과목 번호를 조회
	// 5. 받아온 교과목 번호를 jnu_user_course 테이블에 넣기
	@RequestMapping(value = "/course_auth", method = RequestMethod.POST)
	public String coursePOST(@ModelAttribute("user_serial") String user_serial,
			@ModelAttribute("user_serial_pw") String user_serial_pw, Model model) throws Exception {
		logger.info("course post ...........");

		System.out.println(user_serial + " " + user_serial_pw);

		AuthVO avo = new AuthVO();
		avo.setUser_serial(user_serial);
		avo.setUser_serial_pw(user_serial_pw);
		System.out.println(avo);
		RestTemplate restTemplate = new RestTemplate(); // 내부적으로 새로운 서버에 REST API 요청을 하기 위한 Rest Template 도구
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

		String url = "http://192.168.0.14:5002/student"; // 새로운 서버의 URL 변경
		Object courseObj = restTemplate.postForObject(url, avo, AuthVO.class); // 새로운 서버의 JSON 결과를 POJO로 매핑
		model.addAttribute("course", courseObj); // View 업데이트를 위한 Model에 POJO 객체 저장

		System.out.println(courseObj);
		return "redirect:/user/check";
	}

	// Ajax를 이용한 아이디 중복 확인
	@RequestMapping(value = "/checkId")
	public void checkId(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		PrintWriter out = res.getWriter();
		try {

			// 넘어온 ID를 받는다.
			String paramId = (req.getParameter("prmId") == null) ? "" : String.valueOf(req.getParameter("prmId"));

			UserVO vo = new UserVO();
			vo.setUser_id(paramId.trim());
			int chkPoint = service.checkId(vo);

			out.print(chkPoint);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}

	// Ajax를 이용한 닉네임 중복 확인
	@RequestMapping(value = "/checkNick")
	public void checkNick(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		PrintWriter out = res.getWriter();
		try {

			// 넘어온 ID를 받는다.
			String paramId = (req.getParameter("prmId") == null) ? "" : String.valueOf(req.getParameter("prmId"));

			UserVO vo = new UserVO();
			vo.setUser_nick(paramId.trim());
			int chkPoint = service.checkNick(vo);

			out.print(chkPoint);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}

	// mypage 보여주기
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageGET(Model model) throws Exception {
		model.addAttribute("userVO", vo);
		System.out.println(vo);
		logger.info("mypage get ...........");
	}

	// 계정 수정 페이지 보여주기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(Model model) throws Exception {
		model.addAttribute("userVO", vo);
		System.out.println(vo);
		logger.info("user_modify get ...........");
	}

	// 계정 수정 과정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(RedirectAttributes rttr, UserVO vo, HttpServletResponse response) throws Exception {
		logger.info("user_modify post ...........");
		System.out.println(vo);
		service.updateUser(vo);
		rttr.addFlashAttribute("modifyMsg", "처리 되었습니다. 재 로그인 해주세요.");
		return "redirect:/user/login";
	}

	// 계정 삭제 페이지 보여주기
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteGET(Model model) throws Exception {
		model.addAttribute("userVO", vo);
		System.out.println(vo);
		logger.info("user_delete get ...........");
	}

	// 계정 삭제 과정
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(RedirectAttributes rttr, @ModelAttribute("user_id") String user_id) throws Exception {
		logger.info("user_delete post ...........");

		service.deleteUser(user_id);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/login";
	}

	// 아이디 찾기 페이지 보여주기
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public void find_IdGET(Model model) throws Exception {
		logger.info("user_find_id get ...........");
	}

	// 아이디 찾기 과정 보여주기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String find_IdPOST(Model model, RedirectAttributes rttr, @ModelAttribute("user_nick") String user_nick,
			@ModelAttribute("user_email") String user_email) throws Exception {
		logger.info("user_find_id post ...........");

		UserVO vo = service.find_id_user(user_nick, user_email);
		model.addAttribute("userVO", vo);
		if (vo == null) {
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/user/find_id";
		}
		return "/user/find_id_result";

	}

	// 아이디 찾기 결과 페이지 보여주기
	@RequestMapping(value = "/find_id_result", method = RequestMethod.GET)
	public void find_Id_resultGET(Model model, @ModelAttribute("user_id") String user_id) throws Exception {
		model.addAttribute("user_id", user_id);
		logger.info("user_find_id_result get ...........");
	}

}
