package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.UserInfoDAO;
import spring.model.UserInfoCommand;

@Controller
public class UserModifyController {
	@Autowired
	UserInfoDAO dao;
	
	
	public void setDao(UserInfoDAO dao) {
		this.dao = dao;
	}



	@RequestMapping("/UserModifyForm.do")
	private ModelAndView modify(HttpSession session){
		String memId = (String)session.getAttribute("memId");
		ModelAndView mv = new ModelAndView("view/UserModifyForm");
		if(memId == null){
			return mv;
		}else{
			UserInfoCommand info = dao.getUserInfo(memId);
			mv.addObject("memInfo", info);
			return mv;
		}
		
	}
	@RequestMapping("/UserModifyPro.do")
	private String modify(@ModelAttribute("userinfo") UserInfoCommand info, HttpSession session){
		dao.modyfyUserInfo(info);
		
		return "view/TEST";
	}
}
