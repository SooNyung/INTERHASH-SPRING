package spring.controller.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mybatis.ContentDAO;
import spring.model.ContentCommand;

@Controller
public class ContentModify {
	@Autowired
	ContentDAO cdao;
	
	public void setCdao(ContentDAO cdao) {
		this.cdao = cdao;
	}
	@RequestMapping("/ContentModifyForm.hash")
	public String request(Model model,@RequestParam("connum") int connum) {
		ContentCommand command = cdao.getContent(connum);
		model.addAttribute("content",command);
		
		return "userpage/ContentModifyForm";
	}
	@RequestMapping("/ContentModifyPro.hash")
	public String requestPro(Model model,@RequestParam("connum") int connum,@ModelAttribute("content") ContentCommand command) {
		
		//result 값이 1이어야 올바른 것
		int result = cdao.modifyContent(command);
		
		return "redirect:ContentView.hash";
	}
	
}
