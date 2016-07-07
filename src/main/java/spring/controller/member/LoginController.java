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
import org.springframework.web.servlet.ModelAndView;

import mybatis.MemberDAO;
import spring.model.MemberCommand;
import spring.model.VisitCommand;

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
	private ModelAndView login(@ModelAttribute("userinput")MemberCommand info, String email, HttpSession session,
			VisitCommand visit) {
		

		ModelAndView mv = new ModelAndView("redirect:Board.hash");

		int result = dao.login(info);

		String nick = dao.nick(info) ;
		
		String pw = dao.findPassword(info);
		System.out.println("pw ::: " + pw );
		
		
		//System.out.println("dao.nick(info) ::: " + nick);
		//System.out.println("dao.login(info) :: " + result);
		
		// result�� 1�̸� �α��� ���� 0�̸� ����
		if(result == 1)
		{
			String path = dao.selectPath(email);
			
			System.out.println("path ::: " + path);
			
			dao.visitor(visit);

			session.setAttribute("memId", info.getEmail());
			session.setAttribute("nickName", nick);
			session.setAttribute("profilePhoto", path);

			System.out.println("�α��� ����");	
			return mv;		
		} 
		else
		{
			session.setAttribute("emailfail", "fail");
			session.setAttribute("passwd", null);
			session.setAttribute("nickName", null);

			System.out.println("�α��� ����");
			//mv.setViewName("redirect:Main.hash");
			mv.setViewName("redirect:LoginFailPro.hash");
			return mv;
		}
		
	}
	
	// �α��ν���
	@RequestMapping("LoginFailPro.hash")
	private String intpu(HttpSession session) {
		return "main";
	}
	
	// �α׾ƿ�
	@RequestMapping("/LogOut.hash")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		session.invalidate();
		return mv;
	}

	// �н����� ã��
	@RequestMapping("/FindPasswordForm.hash")
	private String find(HttpSession session) {
		
		session.setAttribute("memId", null);
		session.setAttribute("email", null);
		session.setAttribute("password", null);
		
		return "userpage/FindPasswordForm";
	}

	String key="";
	
	@RequestMapping("/FindPasswordPro.hash")
	private String find1(@ModelAttribute("useremail") MemberCommand info, HttpSession session, HttpServletRequest request ) //@RequestParam("email") MemberCommand info, HttpSession session, 
	{		
		System.out.println("findPassword ������~");
		
		int result = dao.findEmail(info);
		
		String email = info.getEmail() ;		
		sendmail(email); // ���������� ������ �ӽ� ��й�ȣ�� email�� ����
		
		if(result == 1)
		{	
			System.out.println("email ����");

			session.setAttribute("email", info.getEmail());
			//session.setAttribute("password", findpassword);
		
			return "userpage/FindPasswordForm";
		}
		else
		{
			System.out.println("email ����");
		
			session.setAttribute("key",null);
			session.setAttribute("email", null);
			session.setAttribute("password", null);
			
			return "userpage/FindPasswordForm";
		}
	}

	final String username = "fksh90@gmail.com";
	final String password = "q131313!#";

	public void sendmail(String email) {
		
		TempPasswd temppw = new TempPasswd();
		
		temppw.setEmail(email);
		temppw.setPasswd(makeKey()); // �ӽ� ��й�ȣ�� ���� passwd�� ����
		
		dao.tempPasswd(temppw); // �ӽ� ��й�ȣ�� ������Ʈ��
		
		// ������ �ӽ� ��й�ȣ�� �����ͼ� key�� ���� 
		key=temppw.getPasswd(); // �ٲ� ��й�ȣ�� key�� ����
		System.out.println("�ӽú�й�ȣ�� �̸��Ͽ� ���� key  ::: " + key);
		
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "456");
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
				return new PasswordAuthentication(username,password);
				
			}
		});
		System.out.println("send() ����");
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username)); //������ ��� Email
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));// �޴� ��� Email
			//System.out.println("sendEmail() �ȿ� email ::: " + email);
			message.setContent("<h3>InterHash#</h3><hr/>�ӽ� ��й�ȣ�� "+key+" �Դϴ�.<br>","text/html; charset=UTF-8;");//�۳����� htmlŸ��
			message.setSubject("InterHash#�� �̸��� �ӽ� ��й�ȣ�Դϴ�");
			//message.setText("<html><body><a href='http://www.naver.com'>naver</a> Dear Mail Crawler," + "\n\n No spam to my email, please!</body></html>");// ����
			
			System.out.println("send!!!");
			
			Transport.send(message);
			
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			key=""; // key�� �ʱ�ȭ ������
		}
	}
	
	// �ӽ� ��й�ȣ�� ���ڷθ� ����
	/*public String makeKey(){
		Random ran = new Random();
		String key = "";
		for(int i=0;i<7;i++){
			key+=ran.nextInt(10);
		}
		return key;
	}*/
	
	//�ӽ� ��й�ȣ Ư����������
	private String makeKey(){
		String result="";
		//33���� ! �̰�, 122 �� z �Դϴ�.
		//�׷��Ƿ� �� ���ڴ� 90���Դϴ�.
		Random ran = new Random();
		char [] letter_arr = new char[90];
		char letter = '!';
		for(int i=0;i<90;i++){
			if(letter=='!'){
				System.out.println("! ��ȣ : "+(int)letter);
			}
			if(letter=='z'){
				System.out.println("z ��ȣ : "+(int)letter);
			}
			//System.out.println(letter);
			letter_arr[i]=letter;
			letter = (char)(++letter);
		}
		
		for(int i=0;i<8;i++){
			int a =ran.nextInt(90);
			result = result+letter_arr[a];
		}
		System.out.println("�ӽú�й�ȣ : "+result);
		return result;
	}
}

/*// ��â���� �α��� ����?
@RequestMapping(value = "/LoginPro.hash", method = RequestMethod.GET)
private String login1(MemberCommand info, HttpSession session) {

	return "userpage/LoginMain";

	
	 * System.out.println("login1 :: info.getEmail() :: "+info.getEmail());
	 * 
	 * int result = dao.login(info);
	 * 
	 * if(result==1) { session.setAttribute("memId", info.getEmail());
	 * return "login/LoginMain"; } else { session.setAttribute("memId",
	 * null); return "login/LoginFail"; }
	 
}

// �α��� ��â����
@RequestMapping("LoginNew.hash")
private String input() {
	return "userpage/LoginNew";
}*/
