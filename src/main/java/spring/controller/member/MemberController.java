package spring.controller.member;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.ContentDAO;
import mybatis.MemberDAO;
import mybatis.MessageDAO;
import spring.model.MemberCommand;

@Controller
public class MemberController {
	
	@Autowired	
	MemberDAO dao;
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	@Autowired
	ContentDAO cdao;

	public void setCdao(ContentDAO cdao) {
		this.cdao = cdao;
	}

	@ModelAttribute("command")
	public MemberCommand memberCommand() {
		return new MemberCommand();
	}
	@Autowired
	MessageDAO mdao;
	
	public void setMdao(MessageDAO mdao) {
		this.mdao = mdao;
	}

	@RequestMapping("/SignupForm.hash")
	public String SignupForm(){
		return "userpage/SignupForm";
	}
	
	@RequestMapping("/SignupPro.hash")
	public ModelAndView SignupPro(MemberCommand memberCommand, @RequestParam("hash")String[] hash, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash�±� :: " + Arrays.toString(hash));
		memberCommand.setIp(request.getRemoteAddr());
		int a = dao.insertMember(memberCommand);
		System.out.println("ȸ������ ����? :: " + a);
		mv.addObject("member", memberCommand);
		return mv;
		
	}
	
	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);	
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("ȸ������ �����Ϸ�? " + a);
		return "userpage/UserInfoModifyPro";
	}
	
	@RequestMapping("/WithdrawalForm.hash")
	public ModelAndView deleteMember(@ModelAttribute("command")MemberCommand command){
		ModelAndView mv = new ModelAndView("userpage/WithdrawalForm");
		mv.addObject("c", command);
		
		
		return mv;
	}
	
	@RequestMapping("/WithdrawalPro.hash")
	public ModelAndView deleteMemberPro(String passwd, HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/WithdrawalPro");
		String email = (String)session.getAttribute("memId");
		String passwd1 = dao.checkDelete(email);
		System.out.println("������ passwd : " + passwd);
		System.out.println("select�� passwd :: " + passwd1);
		int check=1;
		
		if(passwd.equals(passwd1)) {
			int a = dao.deleteMember(email);
			System.out.println("delete��������  :" + a);
			session.invalidate();
		}
		else{
			check = 0;
		}
		mv.addObject("check", check);
				
		return mv;
		
	}
	
	@RequestMapping("/Board.hash")
	public String board(Model model,HttpSession session){
		String email =(String)session.getAttribute("memId");
		model.addAttribute("content", cdao.getContent());
		model.addAttribute("memberinfo", dao.getMemberInfo(email));
		model.addAttribute("messagelist",mdao.getMessageList(email));
		
		return "fixpage/boardDiv";
	}
}
