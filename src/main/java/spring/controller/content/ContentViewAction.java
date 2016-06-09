package spring.controller.content;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@ModelAttribute("contentdao")
	public ContentCommand content() {
		return new ContentCommand();
	}

	@ModelAttribute("commentdao")
	public CommentCommand comment() {
		return new CommentCommand();
	}

	@RequestMapping("/ContentView.hash")
	public ModelAndView contentView(@ModelAttribute("contentdao") ContentCommand content,
			@ModelAttribute("commentdao") CommentCommand comment, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("content/ContentView");
		/*int connum = Integer.parseInt(request.getParameter("connum"));*/
		int connum = 82;
		System.out.println("connum"+connum);
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		content = contentdao.getContent(connum);
		System.out.println("123123123123123123123123");
		String conhash = content.getConhash();
		System.out.println("123123123123123123123123");
		conhash = conhash.replaceAll(",", "");
		content.setConhash(conhash);
		System.out.println("123123123123123123123123");
		ArrayList array = (ArrayList) commentdao.getComments(connum);
		System.out.println("123123123123123123123123");
		int count = commentdao.commentcount(connum);
		System.out.println("123123123123123123123123");
		mav.addObject("content", content);
		mav.addObject("sdf", sdf);

		mav.addObject("comment", array);
		mav.addObject("conhash", conhash);
		mav.addObject("count", count);

		return mav;
	}
}
