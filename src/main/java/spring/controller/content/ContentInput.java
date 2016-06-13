package spring.controller.content;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import spring.model.ContentCommand;
import spring.model.PhotoCommand;


@Controller
public class ContentInput {
	
	
	@RequestMapping("/ContentInputForm.hash")
	public String request() throws Throwable {

		return "/userpage/ContentInputForm.jsp";
	}
/*	
	@RequestMapping("/ContentInputPro.hash")
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 request.setCharacterEncoding("UTF-8");
		 
		    // 10Mbyte ����
		    int maxSize  = 1024*1024*10;        
		 
		    // ������ �����̳� ���
		    String root = request.getSession().getServletContext().getRealPath("/");
		    
		    //String root1 = "F:\\git_test\\INTERHASH\\WebContent\\";
		    //String root1 = "F:\\jsp_git\\INTERHASH\\WebContent\\";
		    String root1 ="C:\\Users\\jin_notebook\\Documents\\KH_workspace\\INTERHASH\\WebContent\\";
		    // ���� ���� ���(ex : /home/tour/web/ROOT/upload)
		    String savePath = "upload"+"\\";
		 
		    // ���ε� ���ϸ�
		    String uploadFile = "";
		 
		    // ���� ������ ���ϸ�
		    String newFileName = "";
		 
		 
		 
		    int read = 0;
		    byte[] buf = new byte[1024];
		    FileInputStream fin = null;
		    FileOutputStream fout = null;
		    long currentTime = System.currentTimeMillis();  
		    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");  
		    String content="";
		    String conhash="";
		    String nickname="";
		    String email="";
		    String ip="";
		    try{
		 
		        MultipartRequest multi = new MultipartRequest(request, root+savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		         System.out.println("������ : " +root+ savePath);
		        // ���۹��� parameter�� �ѱ۱��� ����
		        content = multi.getParameter("content");
		      //  content = new String(content.getBytes("8859_1"), "UTF-8");
		        System.out.println("���� content:: " + content);
		        conhash = multi.getParameter("tag");
		       // conhash = new String(conhash.getBytes("8859_1"), "UTF-8");
		        System.out.println("���� conhash:: "+conhash);
		        
		        nickname=(String)request.getSession().getAttribute("nickName");
		        //nickname=new String(nickname.getBytes("8859_1"),"UTF-8");
		        
		        email=(String)request.getSession().getAttribute("memId");
		       // email=new String(email.getBytes("8859_1"),"UTF-8");
		        
		        
		        // ���Ͼ��ε�
		       
		        uploadFile = multi.getFilesystemName("conphoto");
		        System.out.println("���Ͼ��ε� ����? "+multi.getFilesystemName("conphoto"));
		        // ���� ������ ���ϸ�(ex : 20140819151221.zip)
		        //newFileName = simDf.format(new Date(currentTime)) +"."+ uploadFile.substring(uploadFile.lastIndexOf(".")+1);
		 
		         
		        // ���ε�� ���� ��ü ����
		        File oldFile = new File(root+savePath + uploadFile);
		 
		         
		        // ���� ����� ���� ��ü ����
		        File newFile = new File(root1+savePath + uploadFile);
		         
		 
		        // ���ϸ� rename
		        //if(!oldFile.renameTo(newFile)){
		 
		            // rename�� ���� ������� ������ ������ �����ϰ� ���������� ����
		 
		            buf = new byte[1024];
		            fin = new FileInputStream(oldFile);
		            fout = new FileOutputStream(newFile);
		            read = 0;
		            while((read=fin.read(buf,0,buf.length))!=-1){
		                fout.write(buf, 0, read);
		            }
		            fin.close();
		            fout.close();
		            //oldFile.delete();
		       // }   
		           ContentCommand content_obj = new ContentCommand();
		           content_obj.setContent(content);
		           content_obj.setConip(request.getRemoteAddr());
		           content_obj.setConnickname(nickname);
		           content_obj.setEmail(email);
		           content_obj.setConhash(conhash);
		           content_obj.setConcreateddate(new Timestamp(System.currentTimeMillis()));
		           content_obj.setConmodifieddate(new Timestamp(System.currentTimeMillis()));
		           
		           PhotoCommand photo_obj = new PhotoCommand();
		           
		           photo_obj.setEmail((String)request.getSession().getAttribute("memId"));
		           photo_obj.setPhotoname(uploadFile);
		           photo_obj.setRealpath(root1+savePath + uploadFile);
		           photo_obj.setServerpath(savePath + uploadFile);
		           System.out.println("Path:::"+newFile.getAbsolutePath());
		           photo_obj.setPhotosize(newFile.length()+"");
		           System.out.println("���� �뷮 :: "+newFile.length());
		           
		           ContentDBBean bean =  ContentDBBean.getInstance();
		           bean.insertContent(content_obj, photo_obj);
		    }catch(Exception e){
		        e.printStackTrace();
		    }
		
		
		return "Board.hash";
	}
	
	@RequestMapping("/ContentInputPro.hash")
	public String file_upload(@RequestParam("file1") MultipartFile info, HttpServletRequest request) {
		System.out.println("���� ������?");
		try {
			request.setAttribute("list", list());
			request.setAttribute("file1",upload(info,request));
			request.setAttribute("real_name", real_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fileupload/upload_list";
	}
	String real_name;
	private String upload(MultipartFile info,HttpServletRequest request) throws Exception{
		//�п� ���
		String path = "C://Users//user2//Documents//workspace-sts-3.7.3.RELEASE//Gradle_webmvc//src//main//webapp//img//";
		//String path = "C://Users//user2//Documents//workspace-sts-3.7.3.RELEASE//Gradle_webmvc//src//main//webapp//WEB-INF//views//fileupload//img//";
		//��Ʈ�� ���
		//String path = "C://Users//jin_notebook//Documents//workspace-sts-3.7.3.RELEASE//Gradle_webmvc//src//main//webapp//img//";
		String name = info.getOriginalFilename();
		real_name= System.currentTimeMillis()+name;
		String real_path= path+real_name;
		int size = info.getInputStream().available();
		
		PhotoCommand fileinfo = new PhotoCommand();
		fileinfo.setName(name);
		fileinfo.setPath(real_path);
		fileinfo.setFilesize(size);
		
		AbstractApplicationContext context = new GenericXmlApplicationContext("mybatis.xml");
		FileInfoDAO dao = (FileInfoDAO)context.getBean("dao");
		System.out.println("���Ⱑ ������??");
		int result = dao.insertFileInfo(fileinfo);
		System.out.println("real_path :: "+real_path);
		System.out.println("insert result :: "+result);
		
		File f = new File(real_path);
		String tmp_path = "C://Users//user2//Downloads//spring-tool-suite-3.7.3.RELEASE-e4.6-win32-x86_64//sts-bundle//pivotal-tc-server-developer-3.1.3.SR1//base-instance//wtpwebapps//Gradle_webmvc//img//";
		File f1 = new File(tmp_path+real_name);
		System.out.println("f1:: "+request.getSession().getServletContext().getRealPath("/")+"//"+real_name);
		info.transferTo(f);
		info.transferTo(f1);
//		context.close();
		return name;
	}
	*/
}
