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
import org.springframework.web.socket.server.RequestUpgradeStrategy;

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
	public CommentCommand commentdto() {
		return new CommentCommand();
	}

	@ModelAttribute("contentdto")
	public ContentCommand contentdto() {
		return new ContentCommand();
	}

	@RequestMapping("/InsertComment.hash")
	public void interC(@RequestParam("connum") int connum, AlarmCommand dto, HttpServletResponse resp,
			HttpServletRequest request) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		String comnick = (String) request.getSession().getAttribute("nickName");
		String comcontent = request.getParameter("comcontent");

		String receivedemail = alarmdao.receivedEmail(connum);

		String comip = request.getRemoteAddr();
		String email = (String) request.getSession().getAttribute("memId");

		CommentCommand commentdto1 = new CommentCommand();
		commentdto1.setComnick(comnick);
		commentdto1.setComcontent(comcontent);
		commentdto1.setEmail(email);
		commentdto1.setComip(comip);
		commentdto1.setConnum(connum);

		int result = commentdao.insertComment(commentdto1);

		dto.setComnick(comnick);
		dto.setConnum(connum);
		dto.setReceivedemail(receivedemail);

		System.out.println("dto:::" + dto);

		/* int alarm = alarmdao.Alarm(dto); */

		ArrayList array = (ArrayList) commentdao.getComments(connum);


		
		int count = commentdao.commentcount(connum);

	
		JSONObject jso = new JSONObject();
		JSONArray jsoa = new JSONArray();
		
		
		
		List<String> arr = new ArrayList();
		
		for (int i = 0; i < array.size(); i++) {
			CommentCommand c = (CommentCommand) array.get(i);
			arr.add(sdf.format(c.getComcreateddate()));			
		}
		
		jso.put("arr", arr);	
		jso.put("data", array);
		jso.put("session", email);
		jso.put("count", count);

		resp.setContentType("application/json;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.print(jso.toString());
	}

	@RequestMapping(value = "/deleteComment.hash", method = RequestMethod.POST)
	public void deleteComment(@RequestParam("comnum") String comnum, @RequestParam("connum") String connum,
			HttpServletResponse resp, HttpServletRequest request) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		// delete
		int check = commentdao.deleteComment(Integer.parseInt(comnum));
		String email = (String) request.getSession().getAttribute("memId");
		System.out.println("deletecheck:::::" + check);
		// select comment
		ArrayList array = (ArrayList) commentdao.getComments(Integer.parseInt(connum));

		String test = "";
		for (int i = 0; i < array.size(); i++) {
			CommentCommand c = (CommentCommand) array.get(i);
			test = sdf.format(c.getComcreateddate());
		}

		int count = commentdao.commentcount(Integer.parseInt(connum));

		JSONObject jso = new JSONObject();

		List<String> arr = new ArrayList();
		
		for (int i = 0; i < array.size(); i++) {
			CommentCommand c = (CommentCommand) array.get(i);
			arr.add(sdf.format(c.getComcreateddate()));			
		}
		
		
		jso.put("arr", arr);
		jso.put("data", array);
		jso.put("time", test);
		jso.put("session", email);
		jso.put("count", count);

		resp.setContentType("application/json;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.print(jso.toString());
	}

	@RequestMapping("/updateCommentForm.hash")
	public ModelAndView UpdateCommentForm(@ModelAttribute("dto") CommentCommand commentdto,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("content/UpdateComment");

		int connum = Integer.parseInt(request.getParameter("connum"));
		int comnum = Integer.parseInt(request.getParameter("comnum"));

		CommentCommand article = commentdao.selectComment(comnum);

		article.getComcreateddate();
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");

		mav.addObject("index", comnum);
		mav.addObject("sdf", sdf);
		mav.addObject("article", article);
		mav.addObject("connum", connum);

		return mav;
	}

	@RequestMapping("/updateCommentPro.hash")
	public void UpdateCommentPro(@RequestParam("connum") String connum, 
			@RequestParam("comnum") String comnum,
			@RequestParam("comcontent") String comcontent, 
			HttpServletResponse resp,
			HttpServletRequest request
			) throws Exception {


		CommentCommand test1 = new CommentCommand();

		test1.setComnum(Integer.parseInt(comnum));
		test1.setConnum(Integer.parseInt(connum));
		test1.setComcontent(comcontent);
		request.setAttribute("index", connum);
		
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");

		int check = commentdao.updateComment(test1);
		
		
		String dateone = commentdao.test(Integer.parseInt(comnum));
		
		resp.setContentType("application/json;charset=utf-8");

		
		JSONObject jso = new JSONObject();

		jso.put("dateone", dateone);
		
		PrintWriter out = resp.getWriter();
		
		out.println(jso.toString());
		
	}

}
