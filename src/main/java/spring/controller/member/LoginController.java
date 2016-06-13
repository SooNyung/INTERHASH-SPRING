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
	@RequestMapping("/LoginForm.hash")
	private String login() {
		return "userpage/LoginForm";
	}

	
	// �α��ε���
<<<<<<< HEAD
	@RequestMapping(value = "/LoginPro.hash", method = RequestMethod.POST)
	private String login(@ModelAttribute("logininfo") MemberCommand info, HttpSession session) {

		ModelAndView mv = new ModelAndView("userpage/LoginMain");

		// result�� 1�̸� �α��� ���� 0�̸� ����

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
=======
		@RequestMapping("/LoginPro.hash")
		private ModelAndView login(@ModelAttribute("userinput")MemberCommand info,  HttpSession session) {
			ModelAndView mv = new ModelAndView("userpage/Board");
			// result�� 1�̸� �α��� ���� 0�̸� ����
			
			//MemberCommand info = new MemberCommand();
			
			System.out.println("passwd :: "+ info.getPasswd()+info.getEmail());
			
			String result = dao.login(info);
			
			System.out.println("dao.login('info') :: " + result);
			// int result = 1;
			
			if (result.equals(info.getPasswd())) {
				session.setAttribute("memId", info);
				
				System.out.println("��� ������~");	
				return mv;
			} 
			else
			{
				session.setAttribute("memId", null);
			//	session.setAttribute("passwd", null);
				
				mv.setViewName("main");
				
				return mv;
			}
>>>>>>> 5d630cbde1fc1458f020d3eb65ec30d0e7bff908
		}

	// ��â���� �α��� ����?
	@RequestMapping(value = "/LoginPro.hash", method = RequestMethod.GET)
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

	// �α��ν���
	@RequestMapping("LoginFail.hash")
	private String intpu() {
		return "main";
	}

	// �α��� ��â����
	@RequestMapping("LoginNew.hash")
	private String input() {
		return "userpage/LoginNew";
	}

	// �α׾ƿ�
	@RequestMapping("/LogOut.hash")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("main"); // ("TEST");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		return mv;
	}

	// �н����� ã��
	@RequestMapping("/FindPasswordForm.hash")
	private String find() {
		return "userpage/FindPasswordForm";
	}

	@RequestMapping("/FindPasswordPro.hash")
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
