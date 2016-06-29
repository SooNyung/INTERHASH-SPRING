package spring.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.jsp.extractor.SessionScopeExtractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mybatis.ConfirmDAO;

@Controller
public class ConfirmController {
	
	@Autowired
	ConfirmDAO Dao;
	
	public void setDao(ConfirmDAO Dao){
		this.Dao = Dao;
	}
	
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
	private String like_check(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model){
		System.out.println("좋아요 눌렀을때!");
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

		Dao.conlikePlus(connum);
		Dao.adminlike(hashname);
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		return "confirm/likeCheck";
		//return "fixpage/boardDiv"; //보현test중
	}
	
	@RequestMapping("/Unlike.hash")
	private String unlike(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model){
		System.out.println("좋아요 2번째 눌렀을때!");
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

		Dao.unlike(connum);
		Dao.adminunlike(hashname);
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		return "confirm/unlike";
		//return "fixpage/boardDiv"; //보현test중
	}
}
