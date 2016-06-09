package spring.controller.comment;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import spring.model.CommentCommand;



@Controller
public class CommentController {
	
	private CommentDAO dao;

	public void setDao(CommentDAO dao) {
		this.dao = dao;
	}
	
	@ModelAttribute("dto")
	public CommentCommand dto(){
		return new CommentCommand();
	}
	
	@RequestMapping("/Comment/insertComment.hash")
	public ModelAndView InsertComment(@ModelAttribute("dto") CommentCommand dto,HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView("ContentView");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		SimpleDateFormat sdf1 = new SimpleDateFormat("YY-MM-dd HH:mm");
		String comnick = (String) request.getSession().getAttribute("nickname");
		String comcontent = request.getParameter("comcontent");
		Timestamp comcreateddate; 
		Timestamp commodifieddate;
		String comip = request.getRemoteAddr();
		String email = (String) request.getSession().getAttribute("memId");
		
		dao.insertComment(dto);
		
		ArrayList<CommentCommand> array = (ArrayList<CommentCommand>) dao.getComments(connum);
		String comsdf = sdf1.format(dto.getCommodifieddate());
		
		mav.addObject("comment",array);
		mav.addObject("comsdf",comsdf);

		return mav;
	}
	
	@RequestMapping("/Comment/deleteComment.hash")
	public ModelAndView DeleteComment(@ModelAttribute("dto") CommentCommand dto,HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("ContentView");
		
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		int connum = Integer.parseInt(request.getParameter("connum"));
		int check = dao.deleteComment(comnum);
		
		//게시글을 가져오기 위한 변수 
		//ContentDataBean content = dbpro.getContent(connum);
		
		mav.addObject("check",check);
		mav.addObject("connum",connum);
		
		return mav;
	}
	
	@RequestMapping("/Comment/updateCommentForm.hash")
	public ModelAndView UpdateCommentForm(@ModelAttribute("dto") CommentCommand dto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("Comment/updateComment");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		
		CommentCommand article = dao.selectComment(comnum);
		
		mav.addObject("article",article);
		mav.addObject("connum",connum);
		
		return mav;
	}
	
	@RequestMapping("/Comment/updateCommentPro.hash")
	public ModelAndView UpdateCommentPro(@ModelAttribute("dto") CommentCommand dto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("Comment/updateCommentPro");
		
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		int connum = Integer.parseInt(request.getParameter("connum"));
		Timestamp commodifieddate;
		
		int check = dao.updateComment(comnum);
		
		request.setAttribute("connum", connum);
		request.setAttribute("check", check);

		return mav;
	}
}
