package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.UserInfoDAO;

@Controller
public class UserWithdrawalController {
	
	@Autowired
	UserInfoDAO dao;
	
	public void setDao(UserInfoDAO dao){
		this.dao=dao;
	}
	
	
	@RequestMapping("/Withdrawal.do")
	private String withdrawal(HttpSession session){
		String email = (String)session.getAttribute("memId");
		
		dao.withdrawal(email);
		
		session.setAttribute("memId", null);
		
		return "view/TEST";
	}

}
