package spring.controller.content;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import spring.model.CommentCommand;
import spring.model.ContentCommand;

@Controller
public class ContentViewAction {

	@RequestMapping("/Main.hash")
	private String mainview() {
		return "main";
	}

	@Autowired
	private ContentDAO contentdao;

	@Autowired
	private CommentDAO commentdao;
	
	public void setContentdao(ContentDAO contentdao) {
		this.contentdao = contentdao;
	}

	public void setCommentdao(CommentDAO commentdao) {
		this.commentdao = commentdao;
	}

	@ModelAttribute("contentdto")
	public ContentCommand content() {
		return new ContentCommand();
	}

	@ModelAttribute("commentdto")
	public CommentCommand comment() {
		return new CommentCommand();
	}

	@RequestMapping("/ContentView.hash")
	public ModelAndView contentView(@ModelAttribute("contentdao") ContentCommand content,
			@ModelAttribute("commentdto") CommentCommand comment, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("content/ContentView");
		/*int connum = Integer.parseInt(request.getParameter("connum"));*/
		int connum = 82;
		
		request.getSession().setAttribute("memId", "test");
		request.getSession().setAttribute("nickName", "testnick");


		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		content = contentdao.getContent(connum);
		String conhash = content.getConhash();
		conhash = conhash.replaceAll(",", "");
		content.setConhash(conhash);
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		int count = commentdao.commentcount(connum);
		
	
		mav.addObject("content", content);
		mav.addObject("sdf", sdf);
		mav.addObject("comment", array);
		mav.addObject("conhash", conhash);
		mav.addObject("count", count);

		return mav;
	}
	
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}

}
