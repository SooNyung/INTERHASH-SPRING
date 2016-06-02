package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogOutController {
	@RequestMapping("/LogOut.do")
	private ModelAndView logout(HttpSession session){
		ModelAndView mv = new ModelAndView("view/TEST");
		session.setAttribute("memId", null);
		return mv;
	}
}
