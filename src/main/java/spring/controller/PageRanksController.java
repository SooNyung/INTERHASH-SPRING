package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.UserInfoDAO;
import spring.model.UserInfoCommand;

@Controller
public class PageRanksController {
	@Autowired
	UserInfoDAO dao;
	
	public void setDao(UserInfoDAO dao){
		this.dao = dao;
	}
	
	@RequestMapping("/pageRanks")
	public ModelAndView handleRequestInternal() {
		List<UserInfoCommand> pageRanks = dao.selectAllUserInfo();
		
		return new ModelAndView("pageRanks", "pageRanks", pageRanks);
	}

}