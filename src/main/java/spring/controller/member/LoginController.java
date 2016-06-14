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

<<<<<<< HEAD
	@RequestMapping("/Board.hash")
	private String mainPage(){
		return "pixpage/boardDiv";
	}

=======
>>>>>>> 9f455746f60b869202b560802ca2ccec59da2aa6
	//로그인
	@RequestMapping("/LoginPro.hash")
	private ModelAndView login(@ModelAttribute("userinput")MemberCommand info,  HttpSession session) {
		ModelAndView mv = new ModelAndView("fixpage/boardDiv");
		// result가 1이면 로그인 성공 0이면 실패

		System.out.println("passwd :: "+ info.getPasswd()+" email "+info.getEmail());

		int result = dao.login(info);

		String nick = dao.nick(info) ;

		System.out.println("dao.nick(info) ::: " + nick);

		System.out.println("dao.login(info) :: " + result);

		//if(result != null && result.equals(info.getPasswd()) )
		if(result == 1)
		{
			session.setAttribute("memId", info.getEmail());
			session.setAttribute("nickName", nick);

			System.out.println("요기 들어오나~");	
			return mv;		
		} 
		else
		{
			session.setAttribute("memId", null);
			//	session.setAttribute("passwd", null);

			System.out.println("로그인 실패");

			//mv.setViewName("userpage/LoginFail");
			mv.setViewName("redirect:LoginFailPro.hash");

			return mv;
		}
	}
			

	// 새창에서 로그인 동작?
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

	// 로그인실패
	@RequestMapping("LoginFailPro.hash")
	private String intpu() {
		return "main";
	}

	// 로그인 새창띄우기
	@RequestMapping("LoginNew.hash")
	private String input() {
		return "userpage/LoginNew";
	}

	// 로그아웃
	@RequestMapping("/LogOut.hash")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("main"); // ("TEST");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		session.setAttribute("nickName",null);
		return mv;
	}

	// 패스워드 찾기
	@RequestMapping("/FindPasswordForm.hash")
	private String find() {
		return "userpage/FindPasswordForm";
	}

	@RequestMapping("/FindPasswordPro.hash")
	private ModelAndView find(@ModelAttribute("useremail") MemberCommand info) {
		ModelAndView mv = new ModelAndView("userpage/FindPasswordForm");

		String email = info.getEmail();
		System.out.println("info.getEmail() :: " + info.getEmail());

		String password = (String) dao.findPassword(info);

		mv.addObject("password", password);
		mv.addObject("email", email);

		return mv;
	}
}
