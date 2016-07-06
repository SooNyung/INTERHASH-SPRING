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
		System.out.println("여기옴?");
		String email = (String) session.getAttribute("memId");
		int count = dao.selectCount(email);
		System.out.println("로그인한 이멜의 알림갯수 : " + count);
		Array connum = dao.selectNum(email);
		System.out.println("게시글 번호들 :: " + connum);
		
/*		List nick = dao.selectNick(comnum);*/
/*		System.out.println("댓글단 nick들::" + nick);*/
		mv.addObject("count", count);
		
		return mv;
		
	}

}
