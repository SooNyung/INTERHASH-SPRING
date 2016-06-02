package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.UserInfoDAO;
import spring.model.UserInfoCommand;

@Controller
public class UserInsertController {
	@Autowired
	UserInfoDAO dao;

	public void setDao(UserInfoDAO dao) {
		this.dao = dao;
	}
	@RequestMapping("/UserInsertForm.do")
	private String input(){
		return "view/UserInsertForm";
	}
	@RequestMapping("/UserInsertPro.do")
	private ModelAndView input(@ModelAttribute("userinfo") UserInfoCommand info){
		ModelAndView mv = new ModelAndView("view/TEST");
		System.out.println(info.getEmail());
		//result가 1이어야 성공 한 것임
		int result = dao.insertUserInfo(info);
		if(result==1){
			System.out.println("인서트 쿼리 동작(회원가입)");
		}else{
			System.out.println("인서트 쿼리 동작 실패(회원가입)");
		}
		return mv;
	}
}
