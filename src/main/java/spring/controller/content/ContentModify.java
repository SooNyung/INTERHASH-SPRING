package spring.controller.content;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContentModify {

	@RequestMapping("/ContentModifyForm.hash")
	public String request(Model model) {
		
		return "/userpage/ContentModifyForm";
	}
	@RequestMapping("/ContentModifyPro.hash")
	public String requestPro(Model model,@RequestParam("connum") int connum) {
		
		
		return "redirect:ContentView.hash";
	}
	
}
