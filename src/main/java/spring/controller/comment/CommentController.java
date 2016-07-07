package spring.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
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

import mybatis.AdminDAO;
import mybatis.CommentDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import spring.model.AlarmCommand;
import spring.model.CommentCommand;
import spring.model.ContentCommand;



@Controller
public class CommentController {
	@Autowired
	private CommentDAO commentdao;

	@Autowired
	private ContentDAO contentdao;

	@Autowired
	private AdminDAO alarmdao;
	
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
			CommentCommand commentdto,
			AlarmCommand dto,
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception{
		
	
	SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
	String comnick = (String) request.getSession().getAttribute("nickName");
	String comcontent = request.getParameter("comcontent");
	
	String receivedemail = alarmdao.receivedEmail(connum);

	
	String comip = request.getRemoteAddr();
	String email = (String) request.getSession().getAttribute("memId");
	
	
	//수정


	System.out.println(comnick);//글번호
	System.out.println(email);//보낸이메일
	System.out.println(receivedemail);
	
	commentdto.setComnick(comnick);
	commentdto.setComcontent(comcontent);
	commentdto.setEmail(email);
	commentdto.setComip(comip);
	
	System.out.println("commentdto:::"+commentdto);
	dto.setComnick(comnick);
	dto.setConnum(connum);
	dto.setReceivedemail(receivedemail);
	
	
	int alarm = alarmdao.Alarm(dto);
	
	int result = commentdao.insertComment(commentdto);
	System.out.println("zzzz");
	ArrayList array = (ArrayList)commentdao.getComments(connum);

	String test= "";
	for(int i=0; i<array.size(); i++){
		CommentCommand c = (CommentCommand) array.get(i);
		test = sdf.format(c.getComcreateddate());
	}
	
	JSONObject jso = new JSONObject();

	jso.put("data", array);
	jso.put("session",email);
	jso.put("test", test);
	
	resp.setContentType("application/json;charset=utf-8");
	
	request.setAttribute("sdf", sdf);
	PrintWriter out = resp.getWriter();
		
	out.print(jso.toString());
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
	
/*	@RequestMapping("/deleteComment1.hash")
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
	}*/
	
	
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
	public void UpdateCommentPro(
			@RequestParam("comnum") int comnum,
			@RequestParam("connum") int connum,
			@RequestParam("comcontent") String comcontent,
			HttpServletResponse resp
			) throws Exception{
		
		/*int check = commentdao.updateComment(commentdto);*/
		
		CommentCommand test1 = new CommentCommand();
		
		test1.setComnum(comnum);
		test1.setConnum(connum);
		test1.setComcontent(comcontent);
		
		int check = commentdao.updateComment(test1);
		
		System.out.println("comcontent::::::::::::::::::::::"+comcontent);
		
		System.out.println("check 값 test::::::::::::::::"+ check);
		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);
		
		SimpleDateFormat sdf= new SimpleDateFormat("YY-MM-dd HH:mm");
		String test= "";
		for(int i=0; i<array.size(); i++){
			CommentCommand c = (CommentCommand) array.get(i);
			test = sdf.format(c.getComcreateddate());
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
