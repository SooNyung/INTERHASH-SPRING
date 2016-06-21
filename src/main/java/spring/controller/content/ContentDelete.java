package spring.controller.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mybatis.ContentDAO;
import spring.model.ContentCommand;

@Controller
public class ContentDelete {

	@Autowired
	private ContentDAO contentdao;
		
	public void setContentdao(ContentDAO contentdao) {
		this.contentdao = contentdao;
	}

	@ModelAttribute("contentdto")
	public ContentCommand dto(){
		return new ContentCommand();
	}
	

	@RequestMapping("/ContentDelete.hash")
	public ModelAndView contentDelete(@ModelAttribute("contentdto") ContentCommand contentdto,
			@RequestParam("connum") int connum) throws Throwable {
		ModelAndView mav = new ModelAndView("fixpage/boardDiv");
		//int connum = Integer.parseInt(request.getParameter("connum"));
		contentdao.deleteContent(connum);
		return mav;
	}

}
