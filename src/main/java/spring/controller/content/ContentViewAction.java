package spring.controller.content;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONObject;
import spring.model.CommentCommand;
import spring.model.ContentCommand;

@Controller
public class ContentViewAction {

	@RequestMapping("/Main.hash")
	private String mainview(HttpSession session) {
		/*Properties prop = System.getProperties();
		Set set = prop.keySet();
		Iterator iter = set.iterator();
		while(iter.hasNext()){
			String key=(String)iter.next();
			System.out.println(key + " :: "+prop.getProperty(key));
			
		}*/
		session.invalidate();
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
			@ModelAttribute("commentdto") CommentCommand comment, HttpServletRequest request,HttpServletResponse resp,
			@RequestParam("connum")int connum) throws Exception {
		ModelAndView mav = new ModelAndView("content/ContentView");
		
	
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		content = contentdao.getContent(connum);
		String conhash = content.getConhash();
		String email = content.getEmail();
		conhash = conhash.replaceAll(",", "");
		content.setConhash(conhash);

	
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		
		int count = commentdao.commentcount(connum);
		
		
		int size = array.size();
		
		mav.addObject("size",size);
		mav.addObject("content", content);
		mav.addObject("sdf", sdf);
		mav.addObject("comment", array);
		mav.addObject("conhash", conhash);
		mav.addObject("count", count);

		return mav;
	}
	
	
	@RequestMapping("/mapopen.hash")
	public ModelAndView mapOpen(@RequestParam("latitude") String latitude,
			@RequestParam("longtitude") String longtitude,@RequestParam("maptitle") String maptitle,
			HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("adminpage/mapopen");
		/*int connum = Integer.parseInt(request.getParameter("connum"));*/

		mav.addObject("latitude", latitude);
		mav.addObject("longtitude", longtitude);
		mav.addObject("maptitle", maptitle);
		
		return mav;
	}
	
	// °Ô½Ã±Û refresh
	@RequestMapping("/refresh.hash")
	public void refresh(
			HttpServletResponse resp,
			@RequestParam("connum") int connum
			) throws IOException{
		
		ContentCommand c = new ContentCommand();
		
		c = contentdao.getContent(connum);
		
		JSONObject jso = new JSONObject();
		
		jso.put("data",c);
		
		PrintWriter out = resp.getWriter();
		
		out.print(jso.toString());
		
		System.out.println("jso.toString():::::"+jso.toString());
		
	}

}
