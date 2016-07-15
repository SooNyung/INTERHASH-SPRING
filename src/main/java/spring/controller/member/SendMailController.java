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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/*import javax.mail.Session;*/

@Controller
public class SendMailController {
	
	String key="";
	
	@RequestMapping(value="/SendEmail.hash")
	private String send(HttpServletRequest request, HttpSession session){
		String email = (String)request.getSession().getAttribute("email");
		key = makeKey();
		
		session.setAttribute("key",key);
		
		sendmail(email,key);
		return "userpage/SendEmail";
	}
		
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
		/*
		 * props.put("mail.smtp.user",username); props.put("mail.smtp.password",
		 * password);
		 */
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
		props.put("mail.debug", "false");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		System.out.println("??");
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("fksh90@gmail.com"));//
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setContent("<h3 style='color:#FF6088;'>�� InterHash# ��</h3><hr style='border: dashed 0.5px; color:#7A7A7A;'>������ȣ�� <b style='color:#FF6088;'>"+key+"</b> �Դϴ�:-)<br>","text/html; charset=UTF-8;");//�۳����� htmlŸ��
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
