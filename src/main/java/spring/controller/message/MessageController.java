package spring.controller.message;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
		
		String email="123";
		List<String> test = memberdao.selectEmail();
		System.out.println("test"+test);
	/*	for(int i=0; i<test.size(); i++){
			email.equals(test);
		}*/
		mav.addObject("emailList",test);
		return mav;
	}
	
	@RequestMapping("/MessagePro.hash")
	public ModelAndView messagePro(
			@ModelAttribute("memberdto") MemberCommand memberdto,
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("fixpage/boardDiv");
		
		//송신자 이메일		
		String sender = (String) request.getSession().getAttribute("memId");

		//수신자 이메일	
		String receiver = request.getParameter("receEmail");

		//송신자  닉네임
		memberdto = memberdao.modify(sender);
		String senderNick = memberdto.getNickname();		
		
		//수신자 닉네임
		memberdto = memberdao.modify(receiver);
		
		String receiverNick = memberdto.getNickname();
		messagedto.setReceNickname(receiverNick);
	
		//글 내용
		String msgContent = request.getParameter("messagecontent");
		messagedto.setMessageContent(msgContent);
		messagedto.setSendEmail(sender);
		messagedto.setReceEmail(receiver);
		messagedto.setSendNickname(senderNick);
		
		messagedto.setSendNickname(senderNick);		

		//메시지 보내는 쿼리 insert 
		int result = messagedao.sendMessage(messagedto);
		return mav;	
	}
	
	@RequestMapping("/MessageList.hash")
	public ModelAndView MessageList(
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
				ModelAndView mav = new ModelAndView("userpage/MessageList");
				String email = (String) request.getSession().getAttribute("memId");
				SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
				
				//메시지 리스트를 얻어오기 위한 쿼리문 
				List messageList = messagedao.getMessageList(email);

				
				mav.addObject("sdf",sdf);
				mav.addObject("messageList",messageList);
				return mav;
	}

	@RequestMapping("/MessageView.hash")
	public ModelAndView MessageView(
		@ModelAttribute("messagedto") MessageCommand messagedto,
		HttpServletRequest request){
		ModelAndView mav = new ModelAndView("userpage/MessageView");
		
		int messagenum = Integer.parseInt(request.getParameter("messageNum"));
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		
		messagedto = messagedao.selectMessageOne(messagenum);
		
		mav.addObject("sdf",sdf);
		mav.addObject("messageone",messagedto);
		
		return mav;
	}
	
	@RequestMapping("/deleteMessage.hash")
	public ModelAndView deleteMessage(
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("userpage/MessageList");
		int messagenum = Integer.parseInt(request.getParameter("messageNum"));
		String email = (String) request.getSession().getAttribute("memId");
		//메시지 삭제 쿼리
		int result = messagedao.deleteMessage(messagenum);

		List messageList = messagedao.getMessageList(email);
		
		mav.addObject("messageList",messageList);
		mav.addObject("result",result);		
		return mav;
	}

}
