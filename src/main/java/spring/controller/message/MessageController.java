package spring.controller.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import mybatis.MessageDAO;
import spring.model.MemberCommand;
import spring.model.MessageCommand;

@Controller
public class MessageController {
	
	@Autowired
	private MemberDAO memberdao;

	@Autowired
	private MessageDAO messagedao;
	
	
	public void setMessagedao(MessageDAO messagedao) {
		this.messagedao = messagedao;
	}

	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}
	
	@ModelAttribute("messagedto")
	public MessageCommand messagedto(){
		return new MessageCommand();
	}
	
	@ModelAttribute("memberdto")
	public MemberCommand memberdto(){
		return new MemberCommand();
	}
	
	@RequestMapping("/MessageForm.hash")
	public ModelAndView messageForm(@ModelAttribute("memberdto") MemberCommand memberdto){
		ModelAndView mav = new ModelAndView("userpage/MessageForm");
		
		ArrayList<MemberCommand> emailList = (ArrayList<MemberCommand>) memberdao.emailList();
		System.out.println("emailList"+emailList);
		mav.addObject("emailList",emailList);
		return mav;
	}
	
	@RequestMapping("/MessagePro.hash")
	public ModelAndView messagePro(
			@ModelAttribute("memberdto") MemberCommand memberdto,
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("fixpage/boardDiv");
		
		//�۽���
		String sender = (String) request.getSession().getAttribute("memId");	
		//������
		String receiver = request.getParameter("receEmail");
		
		//�۽���  �г���
		memberdto = memberdao.modify(sender);
		String senderNick = memberdto.getNickname();		
		//������ �г���
		memberdto = memberdao.modify(receiver);
		String receiverNick = memberdto.getNickname();
		
		//�� ����
		String msgContent = request.getParameter("messagecontent");
		
		messagedto.setMessageContent(msgContent);
		messagedto.setSendEmail(sender);
		messagedto.setReceEmail(receiver);
		messagedto.setSendNickname(senderNick);
		messagedto.setReceNickname(receiverNick);
			
		//�޽��� ������ ���� insert 
		int result = messagedao.sendMessage(messagedto);
				
		return mav;
		
	}
	
}
