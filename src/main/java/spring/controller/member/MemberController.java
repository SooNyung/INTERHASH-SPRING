package spring.controller.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.lowagie.text.pdf.hyphenation.TernaryTree.Iterator;

import mybatis.AdminDAO;
import mybatis.ContentDAO;
import mybatis.MemberDAO;
import mybatis.MessageDAO;
import mybatis.PhotoDAO;
import spring.model.ContentCommand;
import spring.model.MemberCommand;
import spring.model.MessageCommand;
import spring.model.ProfilePhotoCommand;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;

	@Autowired
	PhotoDAO pdao;

	@Autowired
	ContentDAO cdao;
	
	@Autowired
	AdminDAO alarmdao;


	public void setAlarmdao(AdminDAO alarmdao) {
		this.alarmdao = alarmdao;
	}

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
	public ProfilePhotoCommand command() {
		return new ProfilePhotoCommand();
	}

	@Autowired
	MessageDAO mdao;

	public void setMdao(MessageDAO mdao) {
		this.mdao = mdao;
	}

	@RequestMapping("/SignupForm.hash")
	public String SignupForm() {
		return "userpage/SignupForm";
	}

	@RequestMapping("/SignupPro.hash")
	public ModelAndView SignupPro(MemberCommand memberCommand, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro");
		memberCommand.setIp(request.getRemoteAddr());
		/* int a = dao.insertMember(memberCommand); */
		/* System.out.println("회원가입 성공? :: " + a); */
		mv.addObject("member", memberCommand);
		return mv;

	}

	@RequestMapping("/SignupPro2.hash")
	public ModelAndView SignupPro2(MemberCommand memberCommand, @RequestParam("email") String email,
			@RequestParam("gender") String gender,@RequestParam("hash") String[] hash, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("userpage/SignupPro2");
		memberCommand.setIp(request.getRemoteAddr());
		memberCommand.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		int a = dao.insertMember(memberCommand);
		ProfilePhotoCommand pcommand = new ProfilePhotoCommand();
		pcommand.setEmail(email);
		if(gender=="M" || gender.equals("M")){
			pcommand.setPath("man.png");
		}
		else{
			pcommand.setPath("women.png");
		}
		
		int b = dao.insertProfile(pcommand);
		
		System.out.println("회원가입 성공? :: " + a);
		System.out.println("프로필 insert 성공? :: " + b);
		return mv;

	}

	@RequestMapping("/UserInfoModifyForm.hash")
	public ModelAndView ModifyForm(HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/UserInfoModifyForm");
		String email = (String) session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}

	@RequestMapping("/UserInfoModifyPro.hash")
	public String ModifyPro(@ModelAttribute("command") MemberCommand command) {
		int a = dao.modifyPro(command);
		System.out.println("회원정보 수정완료? " + a);
		return "userpage/UserInfoModifyPro";
	}

	@RequestMapping("/ModifyHash.hash")
	public ModelAndView ModifyHash(HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/ModifyHash");
		String email = (String) session.getAttribute("memId");
		MemberCommand command = dao.modify(email);
		String gethash = command.getHash();
		System.out.println("gethash ::" + gethash);
		command.setHash(gethash);
		mv.addObject("c", command);
		return mv;
	}

	@RequestMapping("/ModifyHashPro.hash")
	public String ModifyHashPro(@ModelAttribute("command") MemberCommand command, @RequestParam("hash") String[] hash) {
		command.setHash(Arrays.toString(hash));
		System.out.println("hash태그 :: " + Arrays.toString(hash));
		int a = dao.modifyHash(command);
		System.out.println("해시태그 수정완료? " + a);
		return "userpage/ModifyHashPro";
	}

	@RequestMapping("/WithdrawalForm.hash")
	public ModelAndView deleteMember(@ModelAttribute("command") MemberCommand command) {
		ModelAndView mv = new ModelAndView("userpage/WithdrawalForm");
		mv.addObject("c", command);

		return mv;
	}

	@RequestMapping("/WithdrawalPro.hash")
	public ModelAndView deleteMemberPro(String passwd, HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/WithdrawalPro");
		String email = (String) session.getAttribute("memId");
		String passwd1 = dao.checkDelete(email);
		System.out.println("가져온 passwd : " + passwd);
		System.out.println("select한 passwd :: " + passwd1);
		int check = 1;

		if (passwd.equals(passwd1)) {
			int a = dao.deleteMember(email);
			System.out.println("delete성공여부  :" + a);
			session.invalidate();
		} else {
			check = 0;
		}
		mv.addObject("check", check);

		return mv;

	}

	/*
	 * -----------------------------------프로필-----------------------------------
	 * ----
	 */
	@RequestMapping("/profile.hash")
	public ModelAndView profile(HttpSession session) {
		ModelAndView mv = new ModelAndView("userpage/Profile");
		String email = (String) session.getAttribute("memId");
		/*
		 * String path = dao.selectPath(email);
		 * session.setAttribute("profilePhoto", path);
		 */
		MemberCommand command = dao.modify(email);
		mv.addObject("c", command);
		return mv;
	}

	@RequestMapping("/profilePro.hash")
	public String ProfilePro(@ModelAttribute("command") MemberCommand command, ProfilePhotoCommand Pcommand,
			@RequestParam("photo") MultipartFile photo, String[] checked, String bloodgroups,
			HttpServletRequest request) {
		
		System.out.println("photo 받아옴? : " + photo);
		if(bloodgroups==null || bloodgroups.equals(null) || bloodgroups.equals("")){
			command.setBloodgroups("");
		}

			try {
				upload(photo, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		/* -------------------------------------------------------- */
		System.out.println("photo 받아옴? : " + photo);
		command.setChecked(Arrays.toString(checked));
		System.out.println("hash태그 :: " + Arrays.toString(checked));
		int a = dao.profile(command);
		System.out.println("프로필 수정완료? " + a);
		return "userpage/ProfilePro";
	}

	String real_name;

	private String upload(MultipartFile info, HttpServletRequest request) throws Exception {
		System.out.println("upload 메소드로 넘어옴");

		String user_home = (String) System.getProperties().get("user.home");

		// C:\Users\jin_notebook\Documents\workspace-sts-3.7.3.RELEASE\INTERHASH-SPRING\src\main\webapp\
		// upload\
		String workspace_dir = user_home
				+ "\\Documents\\workspace-sts-3.7.3.RELEASE\\INTERHASH-SPRING\\src\\main\\webapp\\upload\\";
		// String tmp_dir =
		// request.getSession().getServletContext().getRealPath("/");
		String tmp_dir = (String) System.getProperties().get("wtp.deploy");
		String email = (String) request.getSession().getAttribute("memId");
		// workspace 경로
		System.out.println("workspace 경로  :: " + workspace_dir);
		// 서버 경로
		System.out.println("서버 경로 :: " + tmp_dir);
		String upload_tmp_path = tmp_dir + "\\INTERHASH-SPRING\\upload\\";
		String name = info.getOriginalFilename();
	
		real_name = System.currentTimeMillis() + name;
		String path = workspace_dir + real_name;

		System.out.println("read_name ::::::::::" + real_name);
		System.out.println("email :: " + email);
		System.out.println("path :: " + path);
		ProfilePhotoCommand fileinfo = new ProfilePhotoCommand();
		
		

		// int result = pdao.insertPhoto();
		File f = new File(workspace_dir + real_name);
		File f1 = new File(upload_tmp_path + real_name);
		System.out.println("workspace : \n" + workspace_dir + real_name);
		System.out.println("tmp_dir : \n" + upload_tmp_path + real_name);
		if(name.equals("")||name==null||name.equals("null")){
			name= (String)request.getSession().getAttribute("profilePhoto");
		}
		else {
			fileinfo.setEmail(email);
			fileinfo.setPath(real_name);
			int a = pdao.updateProfilePhoto(fileinfo);
			System.out.println("사진 update 성공?" + a);
			request.getSession().setAttribute("profilePhoto", real_name);
			info.transferTo(f);
			info.transferTo(f1);
		}

		return name;
	}

	/*
	 * -----------------------------------프로필
	 * 끝---------------------------------------
	 */
	// 최신글 보기
	@RequestMapping("/Board.hash")
	public ModelAndView board(Model model, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("fixpage/boardDiv");
		String email = (String) session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.getContent());
		ArrayList<ContentCommand> content = cdao.getContent();
		List listtt = dao.getPhotoPathMap();
		List<Map<String, Object>> mapp = listtt;
		Map<Object, Object> map2 = new HashMap<>();
		for(int i=0;i<listtt.size();i++) {
			map2.put(mapp.get(i).get("EMAIL"), mapp.get(i).get("PATH"));
		}
		
		mv.addObject("profilephoto", map2);
		session.setAttribute("profilephoto", map2);

		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount", mdao.getMessageCount(email));
		String checked = dao.selectCheck(email); //진경
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1, hash.length() - 1);
		String[] hashlist = hash.split(",");
		for (int i = 0; i < hashlist.length; i++) {
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);

		session.setAttribute("hashlist",list);
		session.setAttribute("mesagelist",mdao.getMessageList(email));
		session.setAttribute("alarmlist",alarmdao.AlarmAll(email));
		session.setAttribute("count",alarmdao.alarm_count(email));
		session.setAttribute("num",1);

		return mv;
	}

	// 내 글보기
	@RequestMapping("/myContent.hash")
	public String myContent(Model model, HttpSession session) {
		String email = (String) session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.myContent(email));
		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount", mdao.getMessageCount(email));
		String checked = dao.selectCheck(email);
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1, hash.length() - 1);
		String[] hashlist = hash.split(",");
		for (int i = 0; i < hashlist.length; i++) {
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		session.setAttribute("hashlist", list);
		session.setAttribute("mesagelist", mdao.getMessageList(email));
		session.setAttribute("alarmlist",alarmdao.AlarmAll(email));
		session.setAttribute("count",alarmdao.alarm_count(email));
		session.setAttribute("num", 1);
		return "fixpage/boardDiv";
	}

	// hash클릭
	@RequestMapping("/hashLike.hash")
	public String hashlike(Model model, HttpSession session, String conhash) {

		String email = (String) session.getAttribute("memId");
		MemberCommand command = dao.getMemberInfo(email);
		session.setAttribute("content", cdao.hashLike(conhash));
		session.setAttribute("memberinfo", command);
		session.setAttribute("messagecount", mdao.getMessageCount(email));
		String checked = dao.selectCheck(email);
		session.setAttribute("checked", checked);
		String hash = command.getHash();
		hash = hash.substring(1, hash.length() - 1);
		String[] hashlist = hash.split(",");
		for (int i = 0; i < hashlist.length; i++) {
			hashlist[i] = hashlist[i].trim();
		}
		List<String> list = Arrays.asList(hashlist);
		session.setAttribute("hashlist", list);
		session.setAttribute("mesagelist", mdao.getMessageList(email));
		session.setAttribute("alarmlist",alarmdao.AlarmAll(email));
		session.setAttribute("count",alarmdao.alarm_count(email));
	
		session.setAttribute("num", 1);
		return "fixpage/boardDiv";
	}
	
	@RequestMapping("/ProfileView.hash")
	public ModelAndView ProfileView(String nickname){
		ModelAndView mv = new ModelAndView("userpage/ProfileView");
		MemberCommand command = dao.selectNick(nickname);
		String email = command.getEmail();
		String path = dao.photoView(email);
		mv.addObject("path",path);
		mv.addObject("c", command);
		return mv;
	}
	
	
	@RequestMapping("/alarmlist.hash")
	public ModelAndView MessageList(
			@ModelAttribute("messagedto") MessageCommand messagedto,HttpSession session,
			HttpServletRequest request){
				ModelAndView mav = new ModelAndView("userpage/alarmlist");
				
				String email = (String) request.getSession().getAttribute("memId");
				SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:MM");
				
			
				session.setAttribute("sdf",sdf);
				session.setAttribute("alarmlist",alarmdao.AlarmAll(email));

			
				return mav;
	}
	
	@RequestMapping("/alarmdelete.hash")
	public ModelAndView alarmdelete(
			@ModelAttribute("messagedto") MessageCommand messagedto,HttpSession session,
			int connum,
			HttpServletRequest request){
				ModelAndView mav = new ModelAndView("userpage/alarmlist");
				
				String email = (String) request.getSession().getAttribute("memId");
				SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:MM");
				System.out.println(connum);
				

				int result = alarmdao.alarm_delete(connum);;

				List alarmList = alarmdao.AlarmAll(email);
				
				
				mav.addObject("alarmList",alarmList);
				mav.addObject("result",result);	
				System.out.println("삭제성공");
				return mav;
	}
}
