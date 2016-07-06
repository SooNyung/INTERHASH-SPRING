package spring.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.AdminDAO;
import mybatis.LogonDAO;
import mybatis.WithdrawalDAO;
import spring.model.ContentCommand;
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
		mv.addObject("today_like",dao.today_like());
		mv.addObject("today_content",dao.today_content());
		System.out.println(dao.selectHash());
		return mv;
	}
	

	@RequestMapping(value="/ManagerPageReport.hash", method=RequestMethod.GET)
	private ModelAndView adminReport(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageReport");

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
		
		/*WithdrawalCommand members = new WithdrawalCommand();
		members.setDrawalemail(member);
		dao.adminInsert(member);//
*/		
		MemberCommand a = new MemberCommand();
		a.setEmail(member);
		dao.deleteMember(member);
		
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
	
	List<MemberCommand> list = dao.selectMember(); //쿼리
	
	return new ModelAndView("excelView", "member", list);
	}
	
	@RequestMapping(value = "/toExcelWithdrawl.hash", method = RequestMethod.GET)
	 public ModelAndView withdrawl(HttpServletRequest req, HttpSession session) {
	ModelAndView result = new ModelAndView();
	
	List<WithdrawalCommand> list = wdao.selectMember(); //쿼리

	return new ModelAndView("withdrawl", "Withdrawal", list);
	}
	
	@RequestMapping(value="/template2.hash")//get방식으로 요청이 들어올때 다음생성자를 실행한다.
	public String form1() {
		return "map";
	}
	
	@RequestMapping(value="/map.hash")//get방식으로 요청이 들어올때 다음생성자를 실행한다.
	public String map(HttpServletRequest req) {
	
		return "adminpage/test";
	}
}
