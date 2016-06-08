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

	// �α�����
	@RequestMapping("/LoginForm.do")
	private String login() {
		return "login/LoginForm";
	}

	
	// �α��ε���
	@RequestMapping(value = "/LoginPro.do", method = RequestMethod.POST)
	private String login(@ModelAttribute("logininfo") MemberCommand info, HttpSession session) {
		ModelAndView mv = new ModelAndView("login/LoginMain");
		// result�� 1�̸� �α��� ���� 0�̸� ����

		System.out.println("login :: info.getEmail() :: " + info.getEmail());

		// System.out.println("info.equals(session.getAttribute('email')) :: " +
		// info.equals(session.getAttribute("email")));

		//int result = dao.login(info);
		int result = 0;
		if (result == 1) {
			session.setAttribute("memId", info.getEmail());
			session.setAttribute("password", info.getPasswd());

			return "login/LoginMain";
		} else {
			session.setAttribute("memId", null);

			return "login/LoginFail";
		}
	}

	// ��â���� �α��� ����?
	@RequestMapping(value = "/LoginPro.do", method = RequestMethod.GET)
	private String login1(MemberCommand info, HttpSession session) {

		return "login/LoginMain";

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

	// �α��ν���
	@RequestMapping("LoginFail.do")
	private String intpu() {
		return "login/LoginFail";
	}

	// �α��� ��â����
	@RequestMapping("LoginNew.do")
	private String input() {
		return "login/LoginNew";
	}

	// �α׾ƿ�
	@RequestMapping("/LogOut.do")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("MAIN"); // ("TEST");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		return mv;
	}

	// �н����� ã��
	@RequestMapping("/FindPasswordForm.do")
	private String find() {
		return "login/FindPasswordForm";
	}

	@RequestMapping("/FindPasswordPro.do")
	private ModelAndView find(@ModelAttribute("userinfo") MemberCommand info) {
		ModelAndView mv = new ModelAndView("login/FindPasswordForm");

		String email = info.getEmail();
		System.out.println("info.getEmail() :: " + info.getEmail());

		String password = (String) dao.findPassword(info);

		mv.addObject("password", password);
		mv.addObject("email", email);

		return mv;
	}
}
