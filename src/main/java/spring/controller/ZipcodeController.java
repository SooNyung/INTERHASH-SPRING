package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mybatis.ZipcodeDAO;

@Controller
public class ZipcodeController {
	@Autowired
	ZipcodeDAO dao;

	public void setDao(ZipcodeDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("/Zipcode.do")
	private String zipcode(@RequestParam("area4") String area4, Model mo) {
		if (area4 == null || area4.equals("")) {
			return "view/Zipcode";
		} else {
			mo.addAttribute("zipcodelist", dao.selectInfo(area4));
			return "view/Zipcode";
		}
	}

}
