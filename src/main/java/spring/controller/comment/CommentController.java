package spring.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONObject;
import spring.model.CommentCommand;
import spring.model.ContentCommand;



@Controller
public class CommentController {
	@Autowired
	private CommentDAO commentdao;

	@Autowired
	private ContentDAO contentdao;

	
	public void setDao(CommentDAO commentdao) {
		this.commentdao = commentdao;
	}
	
	public void setContentdao(ContentDAO contentdao) {
		this.contentdao = contentdao;
	}
	
	@ModelAttribute("commentdto")
	public CommentCommand commentdto(){
		return new CommentCommand();
	}
	
	@ModelAttribute("contentdto")
	public ContentCommand contentdto(){
		return new ContentCommand();
	}
	
	
	//ajax insert
	@RequestMapping(value="/InsertComment.hash", method=RequestMethod.POST)
	public void interC(@RequestParam("connum") int connum,
			CommentCommand commentdto,
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception{
	SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
	
	String comnick = (String) request.getSession().getAttribute("nickName");
	String comcontent = request.getParameter("comcontent");
	String comip = request.getRemoteAddr();
	String email = (String) request.getSession().getAttribute("memId");
	
	commentdto.setComnick(comnick);
	commentdto.setComcontent(comcontent);
	commentdto.setEmail(email);
	commentdto.setComip(comip);
	
	
	int result = commentdao.insertComment(commentdto);
	
	JSONObject jso = new JSONObject();
	
	PrintWriter out = resp.getWriter();
		
	ArrayList array = (ArrayList) commentdao.getComments(connum);
	
	
	jso.put("data", array);
	
	out.print(jso.toString());
	
	System.out.println("array:::::::::::::::::::"+jso.toString());
	

	}

	
	
	
	@RequestMapping("/deleteComment.hash")
	public ModelAndView DeleteComment(@ModelAttribute("commentdto") CommentCommand commentdto,
			@ModelAttribute("contentdto") ContentCommand contentdto,
			HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("content/ContentView");
		
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		int connum = Integer.parseInt(request.getParameter("connum"));
		int check = commentdao.deleteComment(comnum);
		SimpleDateFormat sdf1 = new SimpleDateFormat("YY-MM-dd HH:mm");
	
		//게시글을 가져오기 위한 변수 
		contentdto = contentdao.getContent(connum);
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		
		int count = commentdao.commentcount(connum);
		mav.addObject("count", count);
		
		mav.addObject("comment", array);
		mav.addObject("content",contentdto);
		mav.addObject("check",check);
		mav.addObject("connum",connum);
		mav.addObject("sdf",sdf1);
		
		
		return mav;
	}
	
	
	@RequestMapping("/updateCommentForm.hash")
	public ModelAndView UpdateCommentForm(@ModelAttribute("dto") CommentCommand commentdto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("content/UpdateComment");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		
		CommentCommand article = commentdao.selectComment(comnum);
		
		article.getComcreateddate();
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		
		mav.addObject("sdf",sdf);
		mav.addObject("article",article);
		mav.addObject("connum",connum);
		
		return mav;
	}

	@RequestMapping("/updateCommentPro.hash")
	public ModelAndView UpdateCommentPro(@ModelAttribute("commentdto") CommentCommand commentdto,
			@ModelAttribute("contentdto") ContentCommand contentdto,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("content/UpdateCommentPro");
		
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		int connum = Integer.parseInt(request.getParameter("connum"));
		
		Timestamp commodifieddate;
		
		
		int check = commentdao.updateComment(commentdto);
		
		contentdto = contentdao.getContent(connum);
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		mav.addObject("comment", array);
		mav.addObject("content",contentdto);
		
		request.setAttribute("connum", connum);
		request.setAttribute("check", check);
		
		return mav;
	}
}
