package spring.controller.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentDelete {

	@RequestMapping("/ContentDelete.hash")
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int connum = Integer.parseInt(request.getParameter("connum"));
	
		System.out.println("connum:::"+connum);
		/*ContentDBBean dbpro = ContentDBBean.getInstance();
		int check = dbpro.deleteContent(connum);
		System.out.println("check °ª :::::"+check);*/
		return "/userpage/ContentDelete.jsp";
	}

}
