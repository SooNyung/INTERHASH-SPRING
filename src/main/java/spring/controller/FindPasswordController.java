package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.UserInfoDAO;
import spring.model.UserInfoCommand;

@Controller
public class FindPasswordController {

	@Autowired
	UserInfoDAO dao;
	
	public void setDao(UserInfoDAO dao){
		this.dao = dao;
	}
	
	@RequestMapping("/FindPasswordForm.do")
	private String find(){
		return "view/FindPasswordForm";
	}
	
	@RequestMapping("/FindPasswordPro.do")
	private ModelAndView find(@ModelAttribute("userinfo") UserInfoCommand info){
		ModelAndView mv = new ModelAndView("view/FindPasswordForm");
		
		String password = (String)dao.findPassword(info);
		
		mv.addObject("password",password);
		
		return mv;
	}
}
