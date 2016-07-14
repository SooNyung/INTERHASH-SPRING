package spring.controller.admin;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.AdminDAO;
import mybatis.LogonDAO;
import mybatis.WithdrawalDAO;
import spring.model.AdminCommand;
import spring.model.MemberCommand;
import spring.model.WithdrawalCommand;

@Controller
public class AdminController {
	
	@Autowired
	AdminDAO dao;
	
	@Autowired
	WithdrawalDAO wdao;
	
	@Autowired
	LogonDAO ldao;
	
	
	public void setWdao(WithdrawalDAO wdao) {
		this.wdao = wdao;
	}


	public void setDao(AdminDAO dao){
		this.dao = dao;
	}

	
	public void setLdao(LogonDAO ldao) {
		this.ldao = ldao;
	}

	@RequestMapping(value="/ManagerPage.hash", method=RequestMethod.GET)
	private String adminPage(){	
		return "adminpage/ManagerPage";
	}
	
	@RequestMapping(value="/ManagerPageCount.hash",method=RequestMethod.GET)
	private ModelAndView adminCount(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageCount");
		
		//request.setAttribute("hashname", HashName);
	
		//AdminCommand bean = (AdminCommand)list.get(5);//?
	
		mv.addObject("content",dao.selectHash());
		mv.addObject("contentcount",dao.contentCount());
		mv.addObject("likecount",dao.likeCount());
		mv.addObject("total_count",dao.total_count());
		mv.addObject("today",dao.today());
		try{
			mv.addObject("today_like",dao.today_like());
		}catch(Exception e){
			mv.addObject("today_like",0);
		}
		mv.addObject("today_content",dao.today_content());
		AdminCommand com = (AdminCommand)dao.selectHash().get(0);
		return mv;
	}
	

	@RequestMapping(value="/ManagerPageReport.hash", method=RequestMethod.GET)
	private ModelAndView adminReport(HttpServletRequest request , HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageReport");
		response.setCharacterEncoding("UTF-8");
		//String nickname = request.getParameter("connickname");//???
		request.setAttribute("report", dao.report());
	
		
		
		return mv;
	}
	

	@RequestMapping(value="/ManagerPageMember.hash", method=RequestMethod.GET)
	private ModelAndView adminMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageMember");

		
		//MemberCommand bean = (MemberCommand)list.get(0);
		System.out.println(dao.memberCount());
		request.setAttribute("count", dao.memberCount());
		request.setAttribute("array", dao.selectMember());
		
		
		return mv;
	}

	@RequestMapping(value="/ManagerPageMemberPro.hash", method=RequestMethod.POST)
	private ModelAndView adminMemberPro(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageMemberPro");
		
		String check[] = request.getParameterValues("delete");
		System.out.println("delete::" + Arrays.toString(check));
		String member =  Arrays.toString(check);
		
		WithdrawalCommand members = new WithdrawalCommand();
		members.setDrawalemail(member);
		dao.adminInsert(member);
		System.out.println("탈퇴회원에 들어감");
	
		MemberCommand a = new MemberCommand();
		a.setEmail(member);
		dao.deleteMember(member);
		System.out.println("삭제 성공");
		
		return mv;
	}
	

	
	@RequestMapping(value="/ManagerPageDeleteMember.hash", method=RequestMethod.GET)
	private ModelAndView adminDeleteMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageDeleteMember");

	//	WithdrawalCommand bean = (WithdrawalCommand)list.get(0);//?
	
		request.setAttribute("array", wdao.selectMember());
	
		return mv;
	}
	
	@RequestMapping(value = "/toExcel.hash", method = RequestMethod.GET)
	 public ModelAndView toExcel(HttpServletRequest req, HttpSession session) {
	ModelAndView result = new ModelAndView();
	
	List<MemberCommand> list = dao.selectMember();
	
	return new ModelAndView("excelView", "member", list);
	}
	
	@RequestMapping(value = "/toExcelWithdrawl.hash", method = RequestMethod.GET)
	 public ModelAndView withdrawl(HttpServletRequest req, HttpSession session) {
	ModelAndView result = new ModelAndView();
	
	List<WithdrawalCommand> list = wdao.selectMember();

	return new ModelAndView("withdrawl", "Withdrawal", list);
	}
	
	@RequestMapping(value="/template2.hash")
	public String form1() {
		return "map";
	}
	
	@RequestMapping(value="/map.hash")
	public String map(HttpServletRequest req) {
	
		return "adminpage/test";
	}
}
