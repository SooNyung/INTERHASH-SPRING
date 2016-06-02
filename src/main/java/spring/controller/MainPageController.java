package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	@RequestMapping("index.do")
	private String page(){
		return "view/TEST";
	}
}
