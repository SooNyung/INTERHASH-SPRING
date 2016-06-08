package spring.controller.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

public class ContentModify {

	@RequestMapping("/ContentModifyForm.hash")
	public String request(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		return "/userpage/ContentModifyForm.jsp";
	}
	@RequestMapping("/ContentModifyPro.hash")
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int connum = Integer.parseInt(request.getParameter("connum"));
		
		//ContentDBBean dbpro = ContentDBBean.getInstance();
/*		ContentDataBean article = dbpro.co*/
		
		return "ContentView.hash";
	}
	
}
