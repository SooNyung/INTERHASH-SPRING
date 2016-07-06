package spring.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONArray;
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
	

	
	@RequestMapping("/InsertComment.hash")
	public void interC(@RequestParam("connum") int connum,
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception{

	SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
	String comnick = (String) request.getSession().getAttribute("nickName");
	String comcontent = request.getParameter("comcontent");

	String comip = request.getRemoteAddr();
	String email = (String) request.getSession().getAttribute("memId");

	CommentCommand commentdto1 = new CommentCommand();
	commentdto1.setComnick(comnick);
	commentdto1.setComcontent(comcontent);
	commentdto1.setEmail(email);
	commentdto1.setComip(comip);
	commentdto1.setConnum(connum);

	System.out.println("commentdto::::"+commentdto1);
	
	int result = commentdao.insertComment(commentdto1);
	System.out.println("test2");
	ArrayList array = (ArrayList)commentdao.getComments(connum);

	String test= "";
	for(int i=0; i<array.size(); i++){
		CommentCommand c = (CommentCommand) array.get(i);
		test = sdf.format(c.getComcreateddate());
	}
	
	String testy="";
	
	JSONObject jso = new JSONObject();

	ArrayList jk = (ArrayList)commentdao.date(connum);
	for(int i=0; i<jk.size(); i++){
		testy = sdf.format(jk.get(i));
		jso.put("time", testy);
		System.out.println("test3");

	}
	jso.put("data", array);
	jso.put("session",email);
/*	jso.put("test", test);*/
	
	resp.setContentType("application/json;charset=utf-8");
	
	
	PrintWriter out = resp.getWriter();
		
	out.print(jso.toString());
	System.out.println("jso::::::::;;"+jso.toString());

	}

	
	@RequestMapping(value="/deleteComment.hash", method=RequestMethod.POST)
	public void deleteComment(
			@RequestParam("comnum") String comnum,
			@RequestParam("connum") String connum,
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception{

		SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
		//delete
		int check = commentdao.deleteComment(Integer.parseInt(comnum));
		String email = (String) request.getSession().getAttribute("memId");
		System.out.println("deletecheck:::::"+check);
		//select comment
		ArrayList array = (ArrayList) commentdao.getComments(Integer.parseInt(connum));

		String test= "";
		for(int i=0; i<array.size(); i++){
			CommentCommand c = (CommentCommand) array.get(i);
			test = sdf.format(c.getComcreateddate());
		}
		
		JSONObject jso = new JSONObject();
		
		jso.put("data", array);
		jso.put("time", test);
		jso.put("session", email);
		
		resp.setContentType("application/json;charset=utf-8");
		 
		PrintWriter out = resp.getWriter();
		
		out.print(jso.toString());		
	}
	

	@RequestMapping("/updateCommentForm.hash")
	public ModelAndView UpdateCommentForm(@ModelAttribute("dto") CommentCommand commentdto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("content/UpdateComment");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		int index = Integer.parseInt(request.getParameter("i"));
		
		CommentCommand article = commentdao.selectComment(comnum);
		
		article.getComcreateddate();
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		
		
		mav.addObject("index",index);
		mav.addObject("sdf",sdf);
		mav.addObject("article",article);
		mav.addObject("connum",connum);
		
		return mav;
	}

	@RequestMapping("/updateCommentPro.hash")
	public void UpdateCommentPro(
			@RequestParam("connum") String connum,
			@RequestParam("comnum") String comnum,
			@RequestParam("comcontent") String comcontent,
			@RequestParam("index") String index,
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception{
		
		System.out.println(comnum+":::211321::::::::::::::::::::");
		/*int check = commentdao.updateComment(commentdto);*/
		
		System.out.println("¿©±â");
		CommentCommand test1 = new CommentCommand();
		
		test1.setComnum(Integer.parseInt(comnum));  
		test1.setConnum(Integer.parseInt(connum));
		test1.setComcontent(comcontent);
		request.setAttribute("index", index);
		int check = commentdao.updateComment(test1);
		
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(Integer.parseInt(connum));
		
		SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
		
		String test= "";
		for(int i=0; i<array.size(); i++){
			CommentCommand c = (CommentCommand) array.get(i);
			test += sdf.format(c.getComcreateddate());
			System.out.println(test);
		}
		
		resp.setContentType("application/json;charset=utf-8");
		
		JSONObject jso = new JSONObject();
		jso.put("time", test);
		jso.put("data", array);
		
		PrintWriter out = resp.getWriter();
		
		out.println(jso.toString());
	}
	
/*	@RequestMapping("/updateCommentPro.hash")
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
	}*/
	
	
}
