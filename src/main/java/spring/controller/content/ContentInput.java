package spring.controller.content;

import java.io.File;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mybatis.ConfirmDAO;
import mybatis.ContentDAO;
import mybatis.PhotoDAO;
import spring.model.ContentCommand;
import spring.model.PhotoCommand;


@Controller
public class ContentInput {
	
	
	@RequestMapping("/ContentInputForm.hash")
	public String request() throws Throwable {

		return "/userpage/ContentInputForm.jsp";
	}
	@Autowired
	PhotoDAO pdao;
	
	public void setDao(PhotoDAO pdao) {
		this.pdao = pdao;
	}
	@Autowired
	ContentDAO cdao;
	
	public void setPdao(PhotoDAO pdao) {
		this.pdao = pdao;
	}
	@RequestMapping("/TagCheck.hash")
	private String tag_check(@RequestParam("check") String check,Model model){
		model.addAttribute("check","y");
		return "userpage/TagCheck";
	}
	@RequestMapping("/ContentInputPro.hash")
	public String file_upload(@RequestParam("conphoto") MultipartFile conphoto,@RequestParam("content") String content ,
			@RequestParam("tag") String tag ,@RequestParam("maptitle") String maptitle,@RequestParam("mapplace") String mapplace, HttpServletRequest request
			) {
		
		try {
			
			request.setAttribute("maptitle", maptitle);
			request.setAttribute("mapplace", mapplace);
			System.out.println(maptitle);		
			
			String map1 = mapplace;
			map1 = map1.substring(1,map1.length()-1);
			
			
			System.out.println(map1);
			
			String[] map2 = map1.split(", ");
			
			for(int i = 0; i <map2.length; i++)
			{
				System.out.println("위도,경도=" + map2[i].trim());
			}
			
			String latitude = map2[0];
			System.out.println("위도:"+latitude);
			String longtitude = map2[1].trim();
			System.out.println("경도:"+longtitude);
			
			request.setAttribute("file1",upload(conphoto,request,content,tag,maptitle,latitude,longtitude));
			request.setAttribute("real_name", real_name);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:Board.hash";
	}
	String real_name;
	private String upload(MultipartFile info,HttpServletRequest request,String content,String tag,String maptitle,String latitude,String longtitude) throws Exception{
		
/*		Properties prop = System.getProperties();
		Set set = prop.keySet();
		Iterator iter = set.iterator();
		while(iter.hasNext()){
			String key=(String)iter.next();
			System.out.println(key + " :: "+prop.getProperty(key));
			
		}
		System.out.println("절취선 --------------------------------");
		*/
		//String workspace_dir= (String)System.getProperties().get("user.dir");
		
		//사용자의 user 폴더 주소 C:\Users\jin_notebook
		String user_home= (String)System.getProperties().get("user.home");
		
		// C:\Users\jin_notebook\Documents\workspace-sts-3.7.3.RELEASE\INTERHASH-SPRING\src\main\webapp\ upload\ 
		String workspace_dir=user_home+"\\Documents\\workspace-sts-3.7.3.RELEASE\\INTERHASH-SPRING\\src\\main\\webapp\\upload\\";
		//String tmp_dir = request.getSession().getServletContext().getRealPath("/");
		String tmp_dir = (String)System.getProperties().get("wtp.deploy");
		String email = (String)request.getSession().getAttribute("memId");
		//workspace 경로
		System.out.println("workspace 경로  :: "+ workspace_dir);
		//서버 경로
		System.out.println("서버 경로 :: "+tmp_dir);
		String upload_tmp_path = tmp_dir + "\\INTERHASH-SPRING\\upload\\";
		String name = info.getOriginalFilename();
		real_name= System.currentTimeMillis()+name;
		
		//available() 메서드는 바이트 단위로 계산함.
		int size = info.getInputStream().available();
		System.out.println("email : "+request.getSession().getAttribute("memId"));
		ContentCommand content_obj = new ContentCommand();
        content_obj.setContent(content);
        content_obj.setConip(request.getRemoteAddr());
        content_obj.setConnickname((String)request.getSession().getAttribute("nickName"));
        content_obj.setEmail(email);
        content_obj.setConhash(tag);
        content_obj.setConcreateddate(new Timestamp(System.currentTimeMillis()));
        content_obj.setConmodifieddate(new Timestamp(System.currentTimeMillis()));	
        content_obj.setMaptitle(maptitle);
        content_obj.setLatitude(latitude);
        content_obj.setLongtitude(longtitude);
		
		
		PhotoCommand fileinfo = new PhotoCommand();
		fileinfo.setPhotoname(name);
		fileinfo.setRealpath(real_name);
		fileinfo.setPhotosize(size+"");
		fileinfo.setEmail(email);
		fileinfo.setServerpath("");
		System.out.println("여기가 에런가??");
		cdao.insertContent(content_obj, fileinfo);
	//	int result = pdao.insertPhoto();
		
		File f = new File(workspace_dir+real_name);
		File f1 = new File(upload_tmp_path+real_name);
		System.out.println("workspace : \n"+workspace_dir+real_name);
		System.out.println("tmp_dir : \n"+upload_tmp_path+real_name);
		info.transferTo(f);
		info.transferTo(f1);
		return name;
	}
	
}
