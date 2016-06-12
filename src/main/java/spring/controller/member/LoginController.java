package spring.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import spring.model.MemberCommand;

@Controller
public class LoginController {

	@Autowired
	MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	// 로그인폼
	@RequestMapping("/LoginForm.hash")
	private String login() {
		return "userpage/LoginForm";
	}

	
	// 로그인동작
	@RequestMapping(value = "/LoginPro.hash", method = RequestMethod.POST)
	private String login(@ModelAttribute("logininfo") MemberCommand info, HttpSession session) {

		ModelAndView mv = new ModelAndView("userpage/LoginMain");

		// result가 1이면 로그인 성공 0이면 실패

		System.out.println("login :: info.getEmail() :: " + info.getEmail());

		// System.out.println("info.equals(session.getAttribute('email')) :: " +
		// info.equals(session.getAttribute("email")));

		//int result = dao.login(info);
		int result = 0;
		if (result == 1) {
			session.setAttribute("memId", info.getEmail());
			session.setAttribute("password", info.getPasswd());

			return "userpage/LoginMain";
		} else {
			session.setAttribute("memId", null);

			return "userpage/LoginFail";
		}
	}

	// 새창에서 로그인 동작?
	@RequestMapping(value = "/LoginPro.do", method = RequestMethod.GET)
	private String login1(MemberCommand info, HttpSession session) {

		return "userpage/LoginMain";

		/*
		 * System.out.println("login1 :: info.getEmail() :: "+info.getEmail());
		 * 
		 * int result = dao.login(info);
		 * 
		 * if(result==1) { session.setAttribute("memId", info.getEmail());
		 * return "login/LoginMain"; } else { session.setAttribute("memId",
		 * null); return "login/LoginFail"; }
		 */
	}

	// 로그인실패
	@RequestMapping("LoginFail.do")
	private String intpu() {
		return "userpage/LoginFail";
	}

	// 로그인 새창띄우기
	@RequestMapping("LoginNew.do")
	private String input() {
		return "userpage/LoginNew";
	}

	// 로그아웃
	@RequestMapping("/LogOut.do")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("MAIN"); // ("TEST");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		return mv;
	}

	// 패스워드 찾기
	@RequestMapping("/FindPasswordForm.do")
	private String find() {
		return "login/FindPasswordForm";
	}

	@RequestMapping("/FindPasswordPro.do")
	private ModelAndView find(@ModelAttribute("userinfo") MemberCommand info) {
		ModelAndView mv = new ModelAndView("userpage/FindPasswordForm");

		String email = info.getEmail();
		System.out.println("info.getEmail() :: " + info.getEmail());

		String password = (String) dao.findPassword(info);

		mv.addObject("password", password);
		mv.addObject("email", email);

		return mv;
	}
}
