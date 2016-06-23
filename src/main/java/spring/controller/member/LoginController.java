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

	// 로그인폼
	@RequestMapping("/LoginForm.hash")
	private String login(HttpSession session) 
	{		
		return "userpage/LoginForm";
	}

	//로그인
	@RequestMapping("/LoginPro.hash")
	private ModelAndView login(@ModelAttribute("userinput")MemberCommand info,  HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:Board.hash");
		
		int result = dao.login(info);

		String nick = dao.nick(info) ;

		//System.out.println("dao.nick(info) ::: " + nick);
		//System.out.println("dao.login(info) :: " + result);
		
		// result가 1이면 로그인 성공 0이면 실패
		if(result == 1)
		{
			session.setAttribute("memId", info.getEmail());
			session.setAttribute("nickName", nick);

			System.out.println("로그인 성공");	
			return mv;		
		} 
		else
		{
			session.setAttribute("memId", null);
			session.setAttribute("passwd", null);
			session.setAttribute("nickName", null);

			System.out.println("로그인 실패");
			mv.setViewName("redirect:LoginFailPro.hash");
			return mv;
		}
	}
	
	// 로그인실패
	@RequestMapping("LoginFailPro.hash")
	private String intpu() {
		return "main";
	}
	
	// 로그아웃
	@RequestMapping("/LogOut.hash")
	private ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		session.setAttribute("memId", null);
		session.setAttribute("password", null);
		session.setAttribute("nickName",null);
		return mv;
	}

	// 패스워드 찾기
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
		System.out.println("findPassword 들어오나~");
		
		String email = info.getEmail() ;		
//		System.out.println("info.getEmail ::: " + info.getEmail());
	
		sendmail(email); // 랜던값으로 생성한 임시 비밀번호를 email에 저장
		
		int result = dao.findEmail(info);
		
		String findpassword = dao.findPassword(info) ;
		
		//key = dao.findPassword(info);
		
		if(result == 1)
		{	
			System.out.println("email 있음");

			//session.setAttribute("key",key);
			//System.out.println("result == 1 안에 임시 비밀번호 :::" +key);
			
			session.setAttribute("email", info.getEmail());
			session.setAttribute("password", findpassword);
		
			return "userpage/FindPasswordForm";
		}
		else
		{
			System.out.println("email 없음");
		
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
		
		//test 임시비밀번호를생성할때 항상 처음에는 null 값이 들어가게
		temppw.setPasswd(null);
		System.out.println("temppw.getPasswd() :::" + temppw.getPasswd());
		
		temppw.setEmail(email);
		System.out.println("sendEmail() ::: "+email);
		
		temppw.setPasswd(makeKey());
		System.out.println("temppw.getPasswd() ::: "+temppw.getPasswd());
		
		dao.tempPasswd(temppw);
		System.out.println("key :::" + key);
		
		key=temppw.getPasswd(); // 바뀐 비밀번호를 key에 저장

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
		System.out.println("send() 실행");
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username)); //보내는 사람 Email
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));// 받는 사람 Email
			//System.out.println("sendEmail() 안에 email ::: " + email);
			message.setContent("<h3>InterHash#</h3><hr/>임시 비밀번호는 "+key+" 입니다.<br>","text/html; charset=UTF-8;");//글내용을 html타입
			message.setSubject("InterHash#의 이메일 임시 비밀번호입니다");
			//message.setText("<html><body><a href='http://www.naver.com'>naver</a> Dear Mail Crawler," + "\n\n No spam to my email, please!</body></html>");// 내용
			
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
	
	// 임시 비밀번호를 숫자로만 생성
	/*public String makeKey(){
		Random ran = new Random();
		String key = "";
		for(int i=0;i<7;i++){
			key+=ran.nextInt(10);
		}
		return key;
	}*/
	
	//임시 비밀번호 특수문자포함
	String result="";
	private String makeKey(){
		//33번은 ! 이고, 122 는 z 입니다.
		//그러므로 총 문자는 90개입니다.
		Random ran = new Random();
		char [] letter_arr = new char[90];
		char letter = '!';
		for(int i=0;i<90;i++){
			if(letter=='!'){
				System.out.println("! 번호 : "+(int)letter);
			}
			if(letter=='z'){
				System.out.println("z 번호 : "+(int)letter);
			}
			//System.out.println(letter);
			letter_arr[i]=letter;
			letter = (char)(++letter);
		}
		
		for(int i=0;i<8;i++){
			int a =ran.nextInt(90);
			result = result+letter_arr[a];
		}
		System.out.println("임시비밀번호 : "+result);
		return result;
	}
}

/*// 새창에서 로그인 동작?
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

// 로그인 새창띄우기
@RequestMapping("LoginNew.hash")
private String input() {
	return "userpage/LoginNew";
}*/
