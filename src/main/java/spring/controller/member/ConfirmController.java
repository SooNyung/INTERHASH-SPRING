package spring.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mybatis.AdminDAO;
import mybatis.CommentDAO;
import mybatis.ConfirmDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONObject;
import spring.model.AlarmCommand;

@Controller
public class ConfirmController {
	
	@Autowired
	CommentDAO comdao ;
	
	public void setComdao(CommentDAO comdao)
	{
		this.comdao = comdao;
	}
	
	@Autowired
	ConfirmDAO Dao;
	
	public void setDao(ConfirmDAO Dao){
		this.Dao = Dao;
	}
	
	@Autowired
	ContentDAO cdao;
	
	public void setCdao(ContentDAO cdao) {
		this.cdao = cdao;
	}
	@Autowired
	private AdminDAO alarmdao;
	
	@RequestMapping(value="/ConfirmEmail.hash", method=RequestMethod.GET )
	private String email(HttpServletRequest request ,HttpSession session){
		String email = request.getParameter("email");
		System.out.println(email+"이메일확인");
		int check = Dao.existEmail(email);
		System.out.println(check);
		
		session.setAttribute("email", email);
		session.setAttribute("check", check);
		return "confirm/ConfirmEmail";
	}
	
	@RequestMapping(value="/ConfirmKey.hash")
	private String key(HttpServletRequest request, HttpSession session){
		String inputkey = request.getParameter("inputkey");
		String key = (String)session.getAttribute("key");
		
		
		if(inputkey.equals(key)){
			session.setAttribute("key", "success");
		}
		return "confirm/ConfirmSuccess";
	}
	
	@RequestMapping(value="/ConfirmNickname.hash")
	private String nickname(HttpServletRequest request, HttpSession session){
		String nickname = request.getParameter("nickname");
		System.out.println("닉네임확인 :: "+ nickname);

		int check = Dao.existNickname(nickname);
		System.out.println(check);
		
		session.setAttribute("nickname", nickname);
		session.setAttribute("check", check);
		
		return "confirm/ConfirmNickname";
	}
	
	@RequestMapping("/LikeCheck.hash")
	public void like_check(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model,HttpServletResponse resp,AlarmCommand dto,
			HttpServletRequest request
			) throws IOException{
		
		System.out.println("좋아요 눌렀을때!");

		JSONObject jso = new JSONObject(); // JASON 객체생성
	
		
		//알림
		int kinds = 1;
		String comnick = (String) request.getSession().getAttribute("nickName");
		System.out.println(comnick);
		String receivedemail = alarmdao.receivedEmail(connum);
		System.out.println(receivedemail);
		String confirmemail = alarmdao.confirm(comnick);
		System.out.println(confirmemail);
		cdao.update_like(connum);
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

//		Dao.adminlike(hashname);

		Dao.conlikePlus(connum);
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		
		jso.put("data", conlike); // jason은 map구조(키,값), data라는 key로 list데이터를 주입했다
		System.out.println("jso ::: "+jso);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		dto.setKinds(kinds);
		dto.setComnick(comnick);
		dto.setConnum(connum);
		dto.setReceivedemail(receivedemail);
		
		if(!((confirmemail).equals(receivedemail))){
			int alarm = alarmdao.Alarm(dto);
			System.out.println("알림성공");
		}
		
		out.print(jso.toString());

	}
	
	@RequestMapping("/Unlike.hash")
	private void unlike(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model,HttpServletResponse resp
			) throws IOException{
		System.out.println("좋아요 2번째 눌렀을때!");
		
		JSONObject jso = new JSONObject(); // JASON 객체생성
		
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

//		Dao.adminunlike(hashname);

		Dao.unlike(connum);
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		cdao.update_likedown(connum);
		jso.put("data", conlike); // jason은 map구조(키,값), data라는 key로 list데이터를 주입했다
		System.out.println("jso ::: "+jso);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
	}
	
	@RequestMapping("/Xclose.hash")
	private void close(@RequestParam("connum") int connum, HttpSession session,Model model,HttpServletResponse resp
			) throws IOException{
		System.out.println("X버튼눌렀을때!");
		
		JSONObject jso = new JSONObject(); // JASON 객체생성
		
		model.addAttribute("connum",connum);
		
		int count = comdao.commentcount(connum);
		session.setAttribute("commentcount", count);
		System.out.println("commentcount :: " + count);
		
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		
		jso.put("like", conlike); // jason은 map구조(키,값), data라는 key로 list데이터를 주입했다
		jso.put("comment", count); // jason은 map구조(키,값), data라는 key로 list데이터를 주입했다
		System.out.println("jso ::: "+jso);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
	}
	
	
}
