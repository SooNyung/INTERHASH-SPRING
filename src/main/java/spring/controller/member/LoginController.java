package spring.controller.member;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import spring.model.MemberCommand;

@Controller
public class LoginController {

	@Autowired
	MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	// �α�����
	@RequestMapping("/LoginForm.hash")
	private String login(HttpSession session) 
	{		
		return "userpage/LoginForm";
	}

	//�α���
	@RequestMapping("/LoginPro.hash")
	private ModelAndView login(@ModelAttribute("userinput")MemberCommand info,  HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:Board.hash");
		// result�� 1�̸� �α��� ���� 0�̸� ����

		System.out.println("passwd :: "+ info.getPasswd()+" email "+info.getEmail());

		int result = dao.login(info);

		String nick = dao.nick(info) ;

		System.out.println("dao.nick(info) ::: " + nick);

		System.out.println("dao.login(info) :: " + result);

		//if(result != null && result.equals(info.getPasswd()) )
		if(result == 1)
		{
			session.setAttribute("memId", info.getEmail());
			session.setAttribute("nickName", nick);

			System.out.println("��� ������~");	
			return mv;		
		} 
		else
		{
			session.setAttribute("memId", null);
			//	session.setAttribute("passwd", null);

			System.out.println("�α��� ����");

			//mv.setViewName("userpage/LoginFail");
			mv.setViewName("redirect:LoginFailPro.hash");

			return mv;
		}
	}
			

	// ��â���� �α��� ����?
	@RequestMapping(value = "/LoginPro.hash", method = RequestMethod.GET)
	private String login1(MemberCommand info, HttpSession session) {

		return "userpage/LoginMain";

		/*
		 * System.out.println("login1 :: info.getEmail() :: "+info.getEmail());
		 * 
		 * int result = dao.login(info);
		 * 
		 * if(result==1) { session.setAttribute("memId", info.getEmail());
		 * return "login/LoginMain"; } else { session.setAttribute("memId",
		 * null); return "login/LoginFail"; }
		 */
	}

	// �α��ν���
	@RequestMapping("LoginFailPro.hash")
	private String intpu() {
		return "main";
	}

	// �α��� ��â����
	@RequestMapping("LoginNew.hash")
	private String input() {
		return "userpage/LoginNew";
	}

	// �α׾ƿ�
	@RequestMapping("/LogOut.hash")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("main"); // ("TEST");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		session.setAttribute("nickName",null);
		return mv;
	}

	// �н����� ã��
	@RequestMapping("/FindPasswordForm.hash")
	private String find() {
		return "userpage/FindPasswordForm";
	}

	/*@RequestMapping("/FindPasswordPro.hash")
	private ModelAndView find(@ModelAttribute("useremail") MemberCommand info) {
		ModelAndView mv = new ModelAndView("userpage/FindPasswordForm");

		String email = info.getEmail();
		System.out.println("info.getEmail() :: " + info.getEmail());

		String password = (String) dao.findPassword(info);

		mv.addObject("password", password);
		mv.addObject("email", email);

		return mv;
	}*/
	
String key="";
	
	@RequestMapping("/FindPasswordPro.hash")
	private String find1(@ModelAttribute("useremail") MemberCommand info, HttpSession session, HttpServletRequest request ) //@RequestParam("email") MemberCommand info, HttpSession session, 
	{
		System.out.println("findEmail ������~");
		
		//String email = (String) request.getSession().getAttribute("email");
		
		String email = info.getEmail() ;
		
		System.out.println("info.getEmail ::: " + info.getEmail());
		
		key = makeKey();
	
		sendmail(email,key); // ���������� ������ �ӽ� ��й�ȣ�� email�� ����
		
		System.out.println("key ::: "+ key);
		
		int result = dao.findEmail(info);
		
		String findpassword = dao.findPassword(info) ;

		//String tempPasswd = dao.tempPasswd(tempPasswd) ;
		//System.out.println("tempPasswd ::: " + tempPasswd);
		
		if(result == 1)
		{	
			System.out.println("result ���� O");
			
			session.setAttribute("key",key);
			session.setAttribute("email", info.getEmail());
			session.setAttribute("password", findpassword);
		
			return "userpage/FindPasswordForm";
		}
		else
		{
			System.out.println("result ���� X");
			
			session.setAttribute("key",null);
			session.setAttribute("email", null);
			session.setAttribute("password", null);
			
			return "userpage/FindPasswordForm";
		}
	}
	
	// �ӽ� ��й�ȣ�� ���������� ����
	public String makeKey(){
		Random ran = new Random();
		String key = "";
		for(int i=0;i<7;i++){
			key+=ran.nextInt(10);
		}
		return key;
	}

	final String username = "fksh90@gmail.com";
	final String password = "q131313!#";

	public void sendmail(String email,String key) {

		Properties props = new Properties();
		
		//props.put("mail.smtp.user","emailtestt90@gmail.com"); 
		//props.put("mail.smtp.password","emailtest123");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "456");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		
		props.put("mail.debug", "false");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				//return new PasswordAuthentication(username, password);
				return new PasswordAuthentication(username,password);
				
			}
		});
		System.out.println("send() ����");
		
		try {
			Message message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress("emailtestt90@gmail.com")); //������ ��� Email
			
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));// �޴� ��� Email
			
			System.out.println("InternetAddress.parse(email) ::: " + InternetAddress.parse(email));
			
			System.out.println("sendEmail() �ȿ� email ::: " + email);
		
			message.setContent("<h3>InterHash#</h3><hr/>������ȣ�� "+key+" �Դϴ�.<br>","text/html; charset=UTF-8;");//�۳����� htmlŸ��
			
			message.setSubject("InterHash#�� �̸��� ������ȣ�Դϴ�");
			//message.setText("<html><body><a href='http://www.naver.com'>naver</a> Dear Mail Crawler," + "\n\n No spam to my email, please!</body></html>");// ����
			System.out.println("send!!!");
			
			Transport.send(message);
			
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			key="";
		}
	}
}
