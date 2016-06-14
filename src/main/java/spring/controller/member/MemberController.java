<<<<<<< HEAD
package spring.controller.member;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import spring.model.MemberCommand;

@Controller
public class MemberController {
	
	MemberDAO dao;
	
	@Autowired	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@ModelAttribute("command")
	public MemberCommand memberCommand() {
		return new MemberCommand();
	}
	
	@RequestMapping("/SignupForm.hash")
	public String SignupForm(){
		return "userpage/SignupForm";
	}
	
	@RequestMapping("/SignupPro.hash")
	public ModelAndView SignupPro(MemberCommand memberCommand, @RequestParam("hash")String[] hash, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		memberCommand.setIp(request.getRemoteAddr());
		int a = dao.insertMember(memberCommand);
		System.out.println("회원가입 성공? :: " + a);
		mv.addObject("member", memberCommand);		
		return mv;
		
	}
	
	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session){
		System.out.println("여기옴?");
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		System.out.println("여기옴?2");
		String email = (String)session.getAttribute("memId");

		System.out.println("memId ::  " + email);
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		gethash = gethash.substring(1, gethash.length()-1);
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);	
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("회원정보 수정완료? " + a);
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
		System.out.println("가져온 passwd : " + passwd);
		System.out.println("select한 passwd :: " + passwd1);
		int check=1;
		
		if(passwd.equals(passwd1)) {
			int a = dao.deleteMember(email);
			System.out.println("delete성공여부  :" + a);
			session.invalidate();
		}
		else{
			check = 0;
		}
		mv.addObject("check", check);
				
		return mv;
		
	}

}
=======
package spring.controller.member;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import spring.model.MemberCommand;

@Controller
public class MemberController {
	
	MemberDAO dao;
	
	@Autowired	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@ModelAttribute("command")
	public MemberCommand memberCommand() {
		return new MemberCommand();
	}
	
	@RequestMapping("/SignupForm.hash")
	public String SignupForm(HttpServletRequest request, HttpSession session){
		String key = (String)request.getSession().getAttribute("key");
		session.setAttribute("key", key);
		return "userpage/SignupForm";
	}
	
	@RequestMapping("/SignupPro.hash")
	public ModelAndView SignupPro(MemberCommand memberCommand, @RequestParam("hash")String[] hash, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		memberCommand.setIp(request.getRemoteAddr());
		int a = dao.insertMember(memberCommand);
		System.out.println("회원가입 성공? :: " + a);
		mv.addObject("member", memberCommand);
		return mv;
		
	}
	
	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		gethash = gethash.substring(1, gethash.length()-1);
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);	
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("회원정보 수정완료? " + a);
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
		System.out.println("가져온 passwd : " + passwd);
		System.out.println("select한 passwd :: " + passwd1);
		int check=1;
		
		if(passwd.equals(passwd1)) {
			int a = dao.deleteMember(email);
			System.out.println("delete성공여부  :" + a);
			session.invalidate();
		}
		else{
			check = 0;
		}
		mv.addObject("check", check);
				
		return mv;
		
	}

}
>>>>>>> da6d2edf2e90066251faa38d89ff0684582da3e0
