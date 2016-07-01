package spring.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.jsp.extractor.SessionScopeExtractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mybatis.ConfirmDAO;
import net.sf.json.JSONObject;

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
		System.out.println(email+"�̸���Ȯ��");
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
		System.out.println("�г���Ȯ�� :: "+ nickname);

		int check = Dao.existNickname(nickname);
		System.out.println(check);
		
		session.setAttribute("nickname", nickname);
		session.setAttribute("check", check);
		
		return "confirm/ConfirmNickname";
	}
	
//	int togle = 1;
	
	@RequestMapping("/LikeCheck.hash")
	public void like_check(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model,HttpServletResponse resp
			) throws IOException{
		
		System.out.println("���ƿ� ��������!");

		JSONObject jso = new JSONObject(); // JASON ��ü����
		
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

		
		Dao.conlikePlus(connum);
		System.out.println("method1");
		/*Dao.adminlike(hashname);*/
		System.out.println("method2");
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		
		
		jso.put("data", conlike); // jason�� map����(Ű,��), data��� key�� list�����͸� �����ߴ�
		System.out.println("jso ::: "+jso);
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

		//return "confirm/likeCheck";
		//return "fixpage/boardDiv"; //����test��
	}
	
	@RequestMapping("/Unlike.hash")
	private String unlike(@RequestParam("connum") int connum, @RequestParam("conhash") String hashname,
			HttpSession session,Model model,HttpServletResponse resp
			) throws IOException{
		System.out.println("���ƿ� 2��° ��������!");
		
		JSONObject jso = new JSONObject(); // JASON ��ü����
		
		model.addAttribute("connum",connum);
		model.addAttribute("conhash",hashname);

		Dao.unlike(connum);
		Dao.adminunlike(hashname);
		int conlike = Dao.getConlike(connum);
		session.setAttribute("conlike", conlike);
		
		jso.put("data", conlike); // jason�� map����(Ű,��), data��� key�� list�����͸� �����ߴ�
		System.out.println("jso ::: "+jso);
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		
		//return "confirm/unlike";
		return "fixpage/boardDiv"; //����test��
	}
}
