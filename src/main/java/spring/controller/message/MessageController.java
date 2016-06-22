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

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
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


	@RequestMapping("/MessageForm.hash")
	public ModelAndView messageForm(@ModelAttribute("memberdto") MemberCommand memberdto){
		ModelAndView mav = new ModelAndView("userpage/MessageForm");
		
		List<String> test = memberdao.selectEmail();

		mav.addObject("emailList",test);
		return mav;
	}
	
	@RequestMapping("/MessagePro.hash")	
	public ModelAndView messagePro(
			@ModelAttribute("memberdto") MemberCommand memberdto,
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView("fixpage/boardDiv");
		
		//�۽��� �̸���		
		String sender = (String) request.getSession().getAttribute("memId");

		//������ �̸���	
		String receiver = request.getParameter("receEmail");

		//�۽���  �г���
		memberdto = memberdao.modify(sender);
		String senderNick = memberdto.getNickname();		
		
		//������ �г���
		memberdto = memberdao.modify(receiver);
		
		String receiverNick = memberdto.getNickname();
		messagedto.setReceNickname(receiverNick);
	
		//�� ����
		String msgContent = request.getParameter("messagecontent");
		messagedto.setMessageContent(msgContent);
		
		messagedto.setSendEmail(sender);
		messagedto.setReceEmail(receiver);
		messagedto.setSendNickname(senderNick);

		//�޽��� ������ ���� insert 
		int result = messagedao.sendMessage(messagedto);
		return mav;	
	}
	
	@RequestMapping("/MessageList.hash")
	public ModelAndView MessageList(
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request){
				ModelAndView mav = new ModelAndView("userpage/MessageList");
				
				String email = (String) request.getSession().getAttribute("memId");
				SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:MM");
				
				//�޽��� ����Ʈ�� ������ ���� ������ 
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
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		//�޽��� ���� ����
		int result = messagedao.deleteMessage(messagenum);

		List messageList = messagedao.getMessageList(email);
		
		mav.addObject("sdf",sdf);
		mav.addObject("messageList",messageList);
		mav.addObject("result",result);		
		return mav;
	}
	
	@RequestMapping("/ReMessageForm.hash")
	public ModelAndView ReMessage(
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request
			){
		ModelAndView mav = new ModelAndView("userpage/ReMessageForm");
		
		String sender = request.getParameter("sendEmail");
		String sendernick = request.getParameter("sendNickname");

		mav.addObject("sender",sender);
		mav.addObject("sendNick",sendernick);
	
		return mav;
	}
	
	@RequestMapping("/ReMessagePro.hash")
	public ModelAndView ReMessagePro(
			@ModelAttribute("memberdto") MemberCommand memberdto,
			@ModelAttribute("messagedto") MessageCommand messagedto,
			HttpServletRequest request
			){
		ModelAndView mav = new ModelAndView("userpage/MessageList");
		
		//������ [����]
		String receiver = request.getParameter("sender");
		String recenick = request.getParameter("sendNick");
		String email = (String) request.getSession().getAttribute("memId");

		//�۽���
		String sender = (String) request.getSession().getAttribute("memId");
		
		//�۽��� �г���
		memberdto = memberdao.modify(sender);
		
		String senderNick = memberdto.getNickname();
		
		String msgContent = request.getParameter("messagecontent");
		
		List messageList = messagedao.getMessageList(email);
		
		messagedto.setSendEmail(sender);
		messagedto.setSendNickname(senderNick);
		messagedto.setReceEmail(receiver);
		messagedto.setReceNickname(recenick);
		messagedto.setMessageContent(msgContent);
		
		mav.addObject("messageList",messageList);
		
		//���� ������
		int result = messagedao.sendMessage(messagedto);
		
		return mav;
		
	}

}
