package spring.controller.content;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import mybatis.ReportDAO;
import spring.controller.comment.CommentController;
import spring.model.CommentCommand;
import spring.model.ContentCommand;
import spring.model.ReportCommand;

@Controller
public class ReportController {

	@Autowired
	private ReportDAO reportdao;

	@Autowired
	private ContentDAO contentdao;

	@Autowired
	private CommentDAO commentdao;
	
	
	public void setCommentdao(CommentDAO commentdao) {
		this.commentdao = commentdao;
	}

	public void setContentdao(ContentDAO contentdao) {
		this.contentdao = contentdao;
	}

	public void setReportdao(ReportDAO reportdao) {
		this.reportdao = reportdao;
	}

	@ModelAttribute("reportdto")
	public ReportCommand dto() {
		return new ReportCommand();
	}

	@ModelAttribute("contentdto")
	public ContentCommand contentdto() {
		return new ContentCommand();
	}
	
	@ModelAttribute("commentdto")
	public CommentCommand commentdto(){
		return new CommentCommand();
	}

	@RequestMapping("/ReportForm.hash")
	public ModelAndView reportForm(@ModelAttribute("contentdto") ContentCommand contentdto,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("content/ReportForm");
		int connum = Integer.parseInt(request.getParameter("connum"));
		int check = 0;
		
		ContentCommand content = contentdao.getContent(connum);

		mav.addObject("check",check);
		mav.addObject("content", content);
		
		return mav;
	}

	@RequestMapping("/ReportPro.hash")
	public ModelAndView reportPro(@ModelAttribute("reportdto") ReportCommand reportdto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("content/ReportPro");
		String [] value = {
				"������ ������ �ְų� ��̾����ϴ�.",
				"������ ���� �Ǵ� �强�� ���ԵǾ� �ֽ��ϴ�.",
				"������ �Դϴ�.",
				"Ÿ���� �������ų� �������� �����Դϴ�.",
				"���� �Ǵ� ���� ��ǰ�� ���� �Խù��Դϴ�.",
				"�� ������ ��ŷ���߽��ϴ�.",
				"���Լ� �Խù��Դϴ�."
		};
		int report_num = Integer.parseInt(reportdto.getReport());
		int connum = Integer.parseInt(request.getParameter("connum"));
		String email = reportdto.getEmail();
		reportdto.setReporter((String)request.getSession().getAttribute("memId"));
		reportdto.setReport(value[report_num]);
		System.out.println("�г��� ::: "+ reportdto.getComnick());
		reportdao.sendReport(reportdto);
		int result = reportdao.reportCount(email);
		System.out.println(result);
		int result2 = reportdao.reportCountCon(email);
		System.out.println(result2);
		return mav;
	}
	
	@RequestMapping("/ReportFormCom.hash")
	public ModelAndView reportFormCom(@ModelAttribute("commentdto") CommentCommand commentdto,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("content/ReportFormCom");
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		commentdto = commentdao.selectComment(comnum);
		mav.addObject("comment", commentdto);
		return mav;
	}
	
	@RequestMapping("/ReportProCom.hash")
	public ModelAndView reportProCom(@ModelAttribute("reportdto") ReportCommand reportdto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("content/ReportPro");
		
		String [] value = {
				"������ ������ �ְų� ��̾����ϴ�.",
				"������ ���� �Ǵ� �强�� ���ԵǾ� �ֽ��ϴ�.",
				"������ �Դϴ�.",
				"Ÿ���� �������ų� �������� �����Դϴ�.",
				"���� �Ǵ� ���� ��ǰ�� ���� �Խù��Դϴ�.",
				"�� ������ ��ŷ���߽��ϴ�.",
				"���Լ� �Խù��Դϴ�."
		};
		reportdto.setReporter((String)request.getSession().getAttribute("memId"));
		int report_num = Integer.parseInt(reportdto.getReport());
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		String email = reportdto.getEmail();
		reportdto.setReport(value[report_num]);
		System.out.println("�Ű��� ::" +value[report_num]);
		reportdao.sendReportCom(reportdto);
		return mav;
	}

}
