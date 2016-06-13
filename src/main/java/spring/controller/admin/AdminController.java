package spring.controller.admin;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		return mv;
	}
	
	//�뜝�럥六울옙�뫁伊믦떋�씛�삕占쎈뻣占쎈닱�뜝占� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕
	@RequestMapping(value="/ManagerPageReport.hash", method=RequestMethod.GET)
	private ModelAndView adminReport(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageReport");

		//String nickname = request.getParameter("connickname");//???
		
		request.setAttribute("array", dao.selectMember());
		return mv;
	}
	
	//占쎄슈�뜝�뜾逾놂옙�봿�겱�뤆�룊�삕 �뜝�럩�뤂�뜝�럩�쐸占쎄슈�뜝�뜾逾놂옙�뿫由��뜝�럥裕� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕
	@RequestMapping(value="/ManagerPageMember.hash", method=RequestMethod.GET)
	private ModelAndView adminMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageMember");

		
		//MemberCommand bean = (MemberCommand)list.get(0);

		request.setAttribute("array", dao.selectMember());

		return mv;
	}
	
	//占쎄슈�뜝�뜾逾놂옙�봿�겱�뤆�룊�삕 �뜝�럩�뤂�뜝�럩�쐸占쎄슈�뜝�뜾逾놂옙�뿫由��뜝�럥裕� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕 �뜝�럩�걦占쎈쇀�뜝占�
	@RequestMapping(value="/ManagerPageMemberPro.hash", method=RequestMethod.GET)
	private ModelAndView adminMemberPro(@RequestParam("members") WithdrawalCommand members,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageMemberPro");
		
	/*	String check[] = request.getParameterValues("delete");
		System.out.println("delete::" + Arrays.toString(check));
		String member =  Arrays.toString(check);
		
		members.setDrawalemail(member);
		dao.adminInsert(member);
		
		MemberCommand a = new MemberCommand();
		a.setEmail(member);
		dao.deleteMember(member);
		 */
		return mv;
	}
	

	//占쎄슈�뜝�뜾逾놂옙�봿�겱�뤆�룊�삕 �뜝�럡�돮�뜝�럥�떄�뜝�럩�꼨�뜝�럩�쐸占쎄슈�뜝�뜾逾놂옙�뿫由��뜝�럥裕� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕
	@RequestMapping(value="/ManagerPageDeleteMember.hash", method=RequestMethod.GET)
	private ModelAndView adminDeleteMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("adminpage/ManagerPageDeleteMember");

		
	//	WithdrawalCommand bean = (WithdrawalCommand)list.get(0);//?
	
		request.setAttribute("array", wdao.selectMember());
	
	
		return mv;
	}

}
