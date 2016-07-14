package spring.controller.content;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mybatis.CommentDAO;
import mybatis.ContentDAO;
import net.sf.json.JSONObject;
import spring.model.CommentCommand;
import spring.model.ContentCommand;
import spring.model.PhotoCommand;

@Controller
public class ContentModify {

	@Autowired
	private ContentDAO contentdao;

	@Autowired
	private CommentDAO commentdao;

	@ModelAttribute
	public CommentCommand commentdto() {
		return new CommentCommand();
	}

	@ModelAttribute
	public ContentCommand contentdto() {
		return new ContentCommand();
	}
	
	@ModelAttribute
	public PhotoCommand photodto(){
		return new PhotoCommand();
	}

	@RequestMapping("/ContentUpdate.hash")
	public void UpdateForm(HttpServletRequest request, HttpServletResponse resp, @RequestParam("connum") int connum)
			throws IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");

		ContentCommand contentdto = contentdao.getContent(connum);
		String conhash = contentdto.getConhash();
		conhash = conhash.replaceAll(",", "");
		contentdto.setConhash(conhash);

		ArrayList<CommentCommand> array = (ArrayList) commentdao.getComments(connum);

		int count = commentdao.commentcount(connum);

		request.setAttribute("count", count);

		resp.setContentType("application/json;charset=utf-8");
		
		List<String> arr = new ArrayList();
		
		for (int i = 0; i < array.size(); i++) {
			CommentCommand c = (CommentCommand) array.get(i);
			arr.add(sdf.format(c.getComcreateddate()));			
		}
		

		JSONObject jso = new JSONObject();

		jso.put("data", array);

		jso.put("arr",arr);
		PrintWriter out = resp.getWriter();

		out.print(jso.toString());

	}

	@RequestMapping("/UpdateTagCheck.hash")
	private String tag_check(@RequestParam("check") String check, Model model) {
		model.addAttribute("check", "y");
		return "userpage/TagCheckUpdate";
	}

	@RequestMapping("/ContentUpdatePro.hash")
	public void updatePro(HttpServletResponse resp, @RequestParam("connum") int connum,
			@RequestParam("content") String content, @RequestParam("conhash") String conhash,
			@RequestParam("maptitle") String maptitle,
			@RequestParam("latitude") String latitude,
			@RequestParam("longtitude") String longtitude,
			HttpServletRequest request) throws IOException {


		System.out.println(maptitle);

		ContentCommand contentdto = new ContentCommand();

		contentdto.setContent(content);
		contentdto.setConnum(connum);
		contentdto.setConhash(conhash);
		contentdto.setMaptitle(maptitle);
		contentdto.setLatitude(latitude);
		contentdto.setLongtitude(longtitude);
				


		System.out.println("contentdto:::::::::::" + contentdto);

		int result = contentdao.modifyContent(contentdto);

		JSONObject jso = new JSONObject();

		PrintWriter out = resp.getWriter();

		/* jso.put("result", result); */

		out.print(jso.toString());

	}

	@RequestMapping("/FileUpdate.hash")
	public void imageUpdate(MultipartHttpServletRequest request,
			HttpServletResponse resp
			
			) throws IOException {


		int connum = Integer.parseInt(request.getParameter("num"));

		MultipartFile file = request.getFile("conphoto2");
		String photoname = file.getOriginalFilename();


		String user_home = (String) System.getProperties().get("user.home");
		String workspace_dir=user_home+"\\Documents\\workspace-sts-3.7.3.RELEASE\\INTERHASH-SPRING\\src\\main\\webapp\\upload\\";
		String tmp_dir = (String) System.getProperties().get("wtp.deploy");
		String upload_tmp_path = tmp_dir + "\\INTERHASH-SPRING\\upload\\";
		
		String realpath= System.currentTimeMillis()+photoname;
		
		System.out.println("filename :: "+photoname);
		File f = new File(workspace_dir + realpath);
		System.out.println("workspace_dir ::: "+f.getAbsolutePath());
		
		File f1 = new File(upload_tmp_path + realpath);
		System.out.println("upload_dir ::: "+f1.getAbsolutePath());		
		file.transferTo(f);
		System.out.println("error3");
		
		  try {
			   FileInputStream fis = new FileInputStream(f);
			   FileOutputStream fos = new FileOutputStream(f1);
			   
			   int data = 0;
			   while((data=fis.read())!=-1) {
			    fos.write(data);
			   }
			   fis.close();
			   fos.close();
			   
			  } catch (IOException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			  }
		
		
		
		String photosize = Long.toString(file.getSize());
		
		System.out.println("error4");
		PhotoCommand p = new PhotoCommand();
		
		p.setPhotoname(photoname);
		p.setRealpath(realpath);
		p.setPhotosize(photosize);
		p.setConnum(connum);
		

		System.out.println("dto:::::::::"+p.toString());
		
		int photoresult = contentdao.updatePhoto(p);

		System.out.println("result::::::::"+photoresult);
		JSONObject jso = new JSONObject();

		PrintWriter out = resp.getWriter();

		out.print(jso.toString());

	}

}
