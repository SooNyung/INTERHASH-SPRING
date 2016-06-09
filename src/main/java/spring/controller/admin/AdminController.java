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
	
	/*@Autowired
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
*/

	@RequestMapping(value="/ManagerPage.hash", method=RequestMethod.GET)
	private String adminPage(){	
		return "view/Admin/ManagerPage";
	}
	
	@RequestMapping(value="/ManagerPageCount.hash",method=RequestMethod.GET)
	private ModelAndView adminCount(@RequestParam("HashName") AdminCommand HashName, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("view/Admin/ManagerPageCount");

		request.setAttribute("hashname", HashName);
		/*
		List<AdminCommand> list = (List<AdminCommand>)dao.selectHash();
		AdminCommand bean = (AdminCommand)list.get(5);//?
		System.out.println("array�뜝�떛紐뚯삕:::"+list);
	
		mv.addObject("content",list);*/
		
		return mv;
	}
	
	//占쎈뻿�⑥쥒苡띰옙�뻻�눧占� 占쎈읂占쎌뵠筌욑옙
	@RequestMapping(value="/ManagerPageReport.hash", method=RequestMethod.GET)
	private ModelAndView adminReport(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView("view/Admin/ManagerPageReport");

		String nickname = request.getParameter("connickname");//???
		
		return mv;
	}
	
	//�꽴占썹뵳�딆쁽揶쏉옙 占쎌돳占쎌뜚�꽴占썹뵳�뗫릭占쎈뮉 占쎈읂占쎌뵠筌욑옙
	@RequestMapping(value="/ManagerPageMember.hash", method=RequestMethod.GET)
	private ModelAndView adminMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("view/Admin/ManagerPageMember");

		/*List<MemberCommand> list = (List<MemberCommand>)ldao.selectMember();
		MemberCommand bean = (MemberCommand)list.get(0);
		System.out.println("�뜝�뙇�냲�삕�뜝�룞�삕::" + bean.getEmail());
		request.setAttribute("array", list);
		System.out.println("array�뜝�떛紐뚯삕:::"+list);*/
		return mv;
	}
	
	//�꽴占썹뵳�딆쁽揶쏉옙 占쎌돳占쎌뜚�꽴占썹뵳�뗫릭占쎈뮉 占쎈읂占쎌뵠筌욑옙 占쎌끏�뙴占�
	@RequestMapping(value="/ManagerPageMemberPro.hash", method=RequestMethod.GET)
	private ModelAndView adminMemberPro(@RequestParam("members") WithdrawalCommand members,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("view/Admin/ManagerPageMemberPro");
		
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
	

	//�꽴占썹뵳�딆쁽揶쏉옙 占쎄퉱占쎈닚占쎌넅占쎌뜚�꽴占썹뵳�뗫릭占쎈뮉 占쎈읂占쎌뵠筌욑옙
	@RequestMapping(value="/ManagerPageDeleteMember.hash", method=RequestMethod.GET)
	private ModelAndView adminDeleteMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("view/Admin/ManagerPageDeleteMember");
/*
		List<WithdrawalCommand> list = wdao.selectMember();
		WithdrawalCommand bean = (WithdrawalCommand)list.get(0);//?
		System.out.println("�뜝�뙇�냲�삕�뜝�룞�삕::" + bean.getDrawalemail());
		request.setAttribute("array", list);
		System.out.println("array�뜝�떛紐뚯삕:::"+ list);
*/		
		return mv;
	}

}
