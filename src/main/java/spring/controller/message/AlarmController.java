package spring.controller.message;

import java.sql.Array;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MessageDAO;

@Controller
public class AlarmController {
	
	@Autowired
	MessageDAO dao;
	
	
	public void setDao(MessageDAO dao) {
		this.dao = dao;
	}


	@RequestMapping("/Alarm.hash")
	public ModelAndView form(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/Alarm");
		System.out.println("�����?");
		String email = (String) session.getAttribute("memId");
		int count = dao.selectCount(email);
		System.out.println("�α����� �̸��� �˸����� : " + count);
		Array connum = dao.selectNum(email);
		System.out.println("�Խñ� ��ȣ�� :: " + connum);
		
/*		List nick = dao.selectNick(comnum);*/
/*		System.out.println("��۴� nick��::" + nick);*/
		mv.addObject("count", count);
		
		return mv;
		
	}

}
