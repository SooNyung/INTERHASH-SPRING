package spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.BoardDAO;
import spring.model.BoardCommand;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAO dao;
	
	public void setDao(BoardDAO dao){
		this.dao = dao;
	}
	
	@RequestMapping(value="/Board.do", method=RequestMethod.GET)
	private ModelAndView board(){
		ModelAndView mv = new ModelAndView("view/Board");
		
		List<BoardCommand> list = (List<BoardCommand>)dao.selectAll();
		
		mv.addObject("list", list);
		
		
		return mv;
	}
	@RequestMapping(value="/ViewBoard.do",method=RequestMethod.GET)
	private ModelAndView viewBoard(@RequestParam("num") int num){
		ModelAndView mv = new ModelAndView("view/ViewBoard");
		mv.addObject("content",dao.selectOne(num));
		
		return mv;
	}
	@RequestMapping(value="/InsertBoard.do", method=RequestMethod.GET)
	private String insert(){
		return "view/InsertBoard";
	}
	@RequestMapping(value="/InsertBoard.do", method=RequestMethod.POST)
	private ModelAndView insertBoard(@ModelAttribute("insertBoard") BoardCommand board,
			HttpSession session){
		ModelAndView mv=new ModelAndView("Board.do");
		
		board.setEmail((String)session.getAttribute("memId"));
		int result = dao.insert_Content(board);
		
		if(result ==1){
			System.out.println("게시판 입력 성공");
		}else{
			System.out.println("게시판 입력 실패");
		}
		
		return mv;
	}

}
