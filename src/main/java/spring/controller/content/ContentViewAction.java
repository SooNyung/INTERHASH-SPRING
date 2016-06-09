package spring.controller.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentViewAction {

	@RequestMapping("/index.hash")
	private String mainview(){
		return "fixpage/boardDiv";
	}
	@RequestMapping("/ContentView.hash")
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

/*		int connum = Integer.parseInt(request.getParameter("connum"));

		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");

		ContentDBBean dbpro = ContentDBBean.getInstance();
		ContentCommand content = dbpro.getContent(connum);

		
		String conhash = content.getConhash();

		conhash = conhash.replaceAll(",", "");
		content.setConhash(conhash);
		
		request.setAttribute("content", content);
		request.setAttribute("sdf", sdf);

		
		CommentDBBean commentdbpro = CommentDBBean.getInstance();

		ArrayList array = commentdbpro.getComment(connum);

		int count = commentdbpro.commentcount(connum);
		
		request.setAttribute("comment", array);
		request.setAttribute("conhash", conhash);
		request.setAttribute("count", count);
		*/
		return "/userpage/ContentView.jsp";
	}
}
