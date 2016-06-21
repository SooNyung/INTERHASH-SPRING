package spring.controller.member;

import java.util.Arrays;
import java.util.List;

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
	public ModelAndView SignupPro(MemberCommand memberCommand, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setIp(request.getRemoteAddr());
		/*int a = dao.insertMember(memberCommand);*/
/*		System.out.println("회원가입 성공? :: " + a);*/
		mv.addObject("member", memberCommand);
		return mv;
		
	}
	
	@RequestMapping("/SignupPro2.hash")
	public ModelAndView SignupPro2(MemberCommand memberCommand, @RequestParam("hash")String[] hash, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("userpage/SignupPro2");
		memberCommand.setIp(request.getRemoteAddr());
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		int a = dao.insertMember(memberCommand);
		System.out.println("회원가입 성공? :: " + a);
		return mv;
		
	}
	
	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("회원정보 수정완료? " + a);
		return "userpage/UserInfoModifyPro";
	}
	
	@RequestMapping("/ModifyHash.hash")
	public ModelAndView ModifyHash(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/ModifyHash");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/ModifyHashPro.hash")
	public String ModifyHashPro(@ModelAttribute("command")MemberCommand command, @RequestParam("hash") String[] hash){
		command.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		int a = dao.modifyHash(command);
		System.out.println("해시태그 수정완료? " + a);
		System.out.println("여기두오겠지?");
		return "userpage/ModifyHashPro";
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
	
	@RequestMapping("/Board.hash")
	public String board(Model model,HttpSession session){
		String email =(String)session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		model.addAttribute("content", cdao.getContent());
		model.addAttribute("memberinfo", command);
		model.addAttribute("messagecount",mdao.getMessageCount(email));
		System.out.println(mdao.getMessageCount(email));
		String hash = command.getHash();
		hash = hash.substring(1,hash.length()-1);
		String []  hashlist = hash.split(",");
		for(int i = 0;i<hashlist.length;i++){
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		model.addAttribute("hashlist",list);
		model.addAttribute("mesagelist",mdao.getMessageList(email));
		return "fixpage/boardDiv";
	}
}
