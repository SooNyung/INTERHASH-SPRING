package spring.controller.content;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.ReportDAO;
import spring.model.ReportCommand;


@Controller
public class ReportController {

	private ReportDAO reportdao;

	public void setReportdao(ReportDAO reportdao) {
		this.reportdao = reportdao;
	}
	
	@ModelAttribute("dto")
	public ReportCommand dto(){
		return new ReportCommand();
	}
	
	@RequestMapping("/Report/ReportForm.hash")
	public ModelAndView reportForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("Report/ReportForm");
		
		int connum = Integer.parseInt(request.getParameter("connum"));
			
		//ContentDataBean content = dbpro.getContent(connum);
		//mav.addobject("content", content)
			
		return mav;
	}
	
	@RequestMapping("/Report/ReportPro.hash")
	public ModelAndView reportPro(@ModelAttribute("dto") ReportCommand dto,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("Report/ReportPro");
			
		String email = (String) request.getSession().getAttribute("memId");
		
		reportdao.sendReport(dto);
		
		reportdao.reportCount(email);
		
		return mav;
	}
	
}
