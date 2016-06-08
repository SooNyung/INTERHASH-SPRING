package spring.controller.member;

import java.util.Arrays;

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
	
	@RequestMapping("/jinkyoung-member/SignupForm.do")
	public String SignupForm(){
		return "jinkyoung-member/SignupForm";
	}
	
	@RequestMapping("/jinkyoung-member/SignupPro.do")
	public ModelAndView SignupPro(MemberCommand memberCommand, @RequestParam("hash")String[] hash) {
		ModelAndView mv = new ModelAndView("jinkyoung-member/SignupPro");
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		int a = dao.insertMember(memberCommand);
		System.out.println("회원가입 성공? :: " + a);
		mv.addObject("member", memberCommand);		
		return mv;
		
	}
	
	@RequestMapping("/jinkyoung-member/UserInfoModifyForm.do")
	public ModelAndView ModifyForm(HttpSession session){
		ModelAndView mv = new ModelAndView("jinkyoung-member/UserInfoModifyForm");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/jinkyoung-member/UserInfoModifyPro.do")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("회원정보 수정완료? " + a);
		return "jinkyoung-member/UserInfoModifyPro";
	}
	
	@RequestMapping("/jinkyoung-member/WithdrawalForm.do")
	public String deleteMember(){
		return "jinkyoung-member/WithdrawalForm";
	}
	
	@RequestMapping("/jinkyoung-member/WithdrawalPro.do")
	public ModelAndView deleteMemberPro(String passwd, HttpSession session){
		ModelAndView mv = new ModelAndView("jinkyoung-member/WithdrawalPro");
		String email = (String)session.getAttribute("memId");
		String id = (String)session.getAttribute("memId");
		String passwd1 = dao.checkDelete(id);
		System.out.println("가져온 passwd : " + passwd);
		System.out.println("select한 passwd :: " + passwd1);
		int check=1;
		
		if(passwd.equals(passwd1)) {
			int a = dao.deleteMember(id);
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
