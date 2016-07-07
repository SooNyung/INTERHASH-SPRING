package spring.controller.content;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import spring.model.CommentCommand;
import spring.model.ContentCommand;

@Controller
public class ContentModify {
	
	@Autowired
	private ContentDAO contentdao;

	@Autowired
	private CommentDAO commentdao;
	
	@ModelAttribute
	public CommentCommand commentdto(){
		return new CommentCommand();
	}
	
	@ModelAttribute
	public ContentCommand contentdto(){
		return new ContentCommand();
	}
	

	@RequestMapping("/ContentUpdate.hash")
	public ModelAndView UpdateForm(
			ContentCommand contentdto,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("content/UpdateContent");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		
		contentdto = contentdao.getContent(connum);
		String conhash = contentdto.getConhash();
		conhash = conhash.replaceAll(",", "");
		contentdto.setConhash(conhash);
		
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		
		int count = commentdao.commentcount(connum);
		
		mav.addObject("content", contentdto);
		mav.addObject("sdf", sdf);
		mav.addObject("comment", array);
		mav.addObject("conhash", conhash);
		mav.addObject("count", count);
		
		return mav;
	}
	
	@RequestMapping("/UpdateTagCheck.hash")
	private String tag_check(@RequestParam("check") String check,Model model){
		model.addAttribute("check","y");
		return "userpage/TagCheckUpdate";
	}
	
	@RequestMapping("/ContentUpdatePro.hash")
	public ModelAndView UpdatePro(
			ContentCommand contentdto,
			HttpServletRequest request
			){
		ModelAndView mav = new ModelAndView("content/ContentView");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		String updatetag = request.getParameter("updatetag");
		
		contentdto.setConhash(updatetag);
		//글 수정을 위한 메서드
		contentdao.modifyContent(contentdto);
		
		contentdto = contentdao.getContent(connum);
		String conhash = contentdto.getConhash();
		conhash = conhash.replaceAll(",", "");
		contentdto.setConhash(conhash);
		
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		
		int count = commentdao.commentcount(connum);
			
		mav.addObject("content", contentdto);
		mav.addObject("sdf", sdf);
		mav.addObject("comment", array);
		mav.addObject("conhash", conhash);
		mav.addObject("count", count);
		return mav;
	}


	
	
	
}
