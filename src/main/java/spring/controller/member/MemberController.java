package spring.controller.member;

import java.io.File;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.ContentDAO;
import mybatis.MemberDAO;
import mybatis.MessageDAO;
import mybatis.PhotoDAO;
import spring.model.ContentCommand;
import spring.model.MemberCommand;
import spring.model.PhotoCommand;
import spring.model.ProfilePhotoCommand;

@Controller
public class MemberController {
	
	@Autowired	
	MemberDAO dao;
	
	@Autowired
	PhotoDAO pdao;
	
	@Autowired
	ContentDAO cdao;
		
	public void setPdao(PhotoDAO pdao) {
		this.pdao = pdao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}


	public void setCdao(ContentDAO cdao) {
		this.cdao = cdao;
	}

	@ModelAttribute("command")
	public MemberCommand memberCommand() {
		return new MemberCommand();
	}
	@ModelAttribute("Pcommand")
	public ProfilePhotoCommand command(){
		return new ProfilePhotoCommand();
	}
	
	@Autowired
	MessageDAO mdao;
	
	public void setMdao(MessageDAO mdao) {
		this.mdao = mdao;
	}

	@RequestMapping("/SignupForm.hash")
	public String SignupForm(){
		return "userpage/SignupForm";
	}
	
	@RequestMapping("/SignupPro.hash")
	public ModelAndView SignupPro(MemberCommand memberCommand, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setIp(request.getRemoteAddr());
		/*int a = dao.insertMember(memberCommand);*/
/*		System.out.println("ȸ������ ����? :: " + a);*/
		mv.addObject("member", memberCommand);
		return mv;
		
	}
	
	@RequestMapping("/SignupPro2.hash")
	public ModelAndView SignupPro2(MemberCommand memberCommand, @RequestParam("hash")String[] hash, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("userpage/SignupPro2");
		memberCommand.setIp(request.getRemoteAddr());
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash�±� :: " + Arrays.toString(hash));
		int a = dao.insertMember(memberCommand);
		System.out.println("ȸ������ ����? :: " + a);
		return mv;
		
	}
	
	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command")MemberCommand command){
		int a = dao.modifyPro(command);
		System.out.println("ȸ������ �����Ϸ�? " + a);
		return "userpage/UserInfoModifyPro";
	}
	
	@RequestMapping("/ModifyHash.hash")
	public ModelAndView ModifyHash(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/ModifyHash");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/ModifyHashPro.hash")
	public String ModifyHashPro(@ModelAttribute("command")MemberCommand command, @RequestParam("hash") String[] hash){
		command.setHash(Arrays.toString(hash));
		System.out.println("hash�±� :: " + Arrays.toString(hash));
		int a = dao.modifyHash(command);
		System.out.println("�ؽ��±� �����Ϸ�? " + a);
		return "userpage/ModifyHashPro";
	}

	
	@RequestMapping("/WithdrawalForm.hash")
	public ModelAndView deleteMember(@ModelAttribute("command")MemberCommand command){
		ModelAndView mv = new ModelAndView("userpage/WithdrawalForm");
		mv.addObject("c", command);
		
		return mv;
	}
	
	@RequestMapping("/WithdrawalPro.hash")
	public ModelAndView deleteMemberPro(String passwd, HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/WithdrawalPro");
		String email = (String)session.getAttribute("memId");
		String passwd1 = dao.checkDelete(email);
		System.out.println("������ passwd : " + passwd);
		System.out.println("select�� passwd :: " + passwd1);
		int check=1;
		
		if(passwd.equals(passwd1)) {
			int a = dao.deleteMember(email);
			System.out.println("delete��������  :" + a);
			session.invalidate();
		}
		else{
			check = 0;
		}
		mv.addObject("check", check);
				
		return mv;
		
	}
/*	-----------------------------------������---------------------------------------*/
	@RequestMapping("/profile.hash")
	public ModelAndView profile(HttpSession session){
		ModelAndView mv = new ModelAndView("userpage/Profile");
		String email = (String)session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}
	
	@RequestMapping("/profilePro.hash")
	public String ProfilePro(@ModelAttribute("command")MemberCommand command, 
			ProfilePhotoCommand Pcommand, @RequestParam("photo") MultipartFile photo, @RequestParam("checked") String[] checked,
			HttpServletRequest request){
		
		try {
			upload(photo, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
	/*	--------------------------------------------------------*/
		System.out.println("photo �޾ƿ�? : " + photo);
		command.setHash(Arrays.toString(checked));
		System.out.println("hash�±� :: " + Arrays.toString(checked));
		int a = dao.profile(command);
		System.out.println("������ �����Ϸ�? " + a);
		return "userpage/ProfilePro";
	}
	
	String real_name;
	
	private String upload(MultipartFile info,HttpServletRequest request) throws Exception{
		System.out.println("upload �޼ҵ�� �Ѿ��");

		String user_home= (String)System.getProperties().get("user.home");
		
		// C:\Users\jin_notebook\Documents\workspace-sts-3.7.3.RELEASE\INTERHASH-SPRING\src\main\webapp\ upload\ 
		String workspace_dir=user_home+"\\Documents\\workspace-sts-3.7.3.RELEASE\\INTERHASH-SPRING\\src\\main\\webapp\\upload\\";
		//String tmp_dir = request.getSession().getServletContext().getRealPath("/");
		String tmp_dir = (String)System.getProperties().get("wtp.deploy");
		String email = (String)request.getSession().getAttribute("memId");
		//workspace ���
		System.out.println("workspace ���  :: "+ workspace_dir);
		//���� ���
		System.out.println("���� ��� :: "+tmp_dir);
		String upload_tmp_path = tmp_dir + "\\INTERHASH-SPRING\\upload\\";
		String name = info.getOriginalFilename();
		real_name= System.currentTimeMillis()+name;
		String path = workspace_dir + real_name;
		System.out.println("email :: " + email);
		System.out.println("path :: " + path);
		ProfilePhotoCommand fileinfo = new ProfilePhotoCommand();
		fileinfo.setEmail(email);
		fileinfo.setPath(real_name);
		System.out.println("���Ⱑ ������??");
		
		int a = pdao.updateProfilePhoto(fileinfo);
		System.out.println("���� update ����?" + a);
	//	int result = pdao.insertPhoto();
		
		File f = new File(workspace_dir+real_name);
		File f1 = new File(upload_tmp_path+real_name);
		System.out.println("workspace : \n"+workspace_dir+real_name);
		System.out.println("tmp_dir : \n"+upload_tmp_path+real_name);
		info.transferTo(f);
		info.transferTo(f1);
		return name;
	}
	
	
	/*	-----------------------------------������ ��---------------------------------------*/
	//�ֽű� ����
	@RequestMapping("/Board.hash")
	public String board(Model model,HttpSession session){
		String email =(String)session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.getContent());
		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount",mdao.getMessageCount(email));
		String checked = dao.selectCheck(email);
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1,hash.length()-1);
		String []  hashlist = hash.split(",");
		for(int i = 0;i<hashlist.length;i++){
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		session.setAttribute("hashlist",list);
		session.setAttribute("mesagelist",mdao.getMessageList(email));
		session.setAttribute("num",1);
		return "fixpage/boardDiv";
	}
	
	//�� �ۺ���
	@RequestMapping("/myContent.hash")
	public String myContent(Model model,HttpSession session){
		String email =(String)session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.myContent(email));
		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount",mdao.getMessageCount(email));
		String checked = dao.selectCheck(email);
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1,hash.length()-1);
		String []  hashlist = hash.split(",");
		for(int i = 0;i<hashlist.length;i++){
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		session.setAttribute("hashlist",list);
		session.setAttribute("mesagelist",mdao.getMessageList(email));
		session.setAttribute("num",1);
		return "fixpage/boardDiv";
	}
	
	//hashŬ��	
	@RequestMapping("/hashLike.hash")
	public String hashlike(Model model,HttpSession session, String conhash){
		
		String email =(String)session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.hashLike(conhash));
		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount",mdao.getMessageCount(email));
		String checked = dao.selectCheck(email);
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1,hash.length()-1);
		String []  hashlist = hash.split(",");
		for(int i = 0;i<hashlist.length;i++){
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		session.setAttribute("hashlist",list);
		session.setAttribute("mesagelist",mdao.getMessageList(email));
		session.setAttribute("num",1);
		return "fixpage/boardDiv";
	}

}
