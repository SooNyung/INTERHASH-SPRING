package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.ContentCommand;
import spring.model.PhotoCommand;

@Repository
public class ContentDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void insertContent(ContentCommand bean, PhotoCommand photo) throws Exception {
		session.insert("writecontent.insertContent", bean);
		session.insert("writecontent.insertPhoto", photo);
		session.commit();
	}

	public ArrayList getContent() throws Exception {
		ArrayList photo = null;
		ArrayList array = (ArrayList) session.selectList("writecontent.getContent");

		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = (ContentCommand) array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("photo.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		session.commit();
		return array;
	}

	public ArrayList getReport() throws Exception {
		ArrayList array = (ArrayList) session.selectList("report.getreport");
		session.commit();
		return array;
	}

	public ArrayList getContent(String hash) throws Exception {
		ArrayList photo = null;
		ArrayList array = (ArrayList) session.selectList("writecontent.getContentByHash", hash);

		// array = (ArrayList) session.selectList("writecontent.getContent");
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = (ContentCommand) array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("photo.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}

		session.commit();
		return array;
	}

	public ContentCommand getContent(int connum) throws Exception {
		ContentCommand content = null;
		ArrayList photo = (ArrayList) session.selectList("photo.selectPhoto", connum); 
		content = session.selectOne("comment.content", connum);
		
		content.setPhotolist(photo);
		return content;
	}

	public int deleteContent(int connum) throws Exception {
		int check = -1;
		check = session.delete("comment.contentdelete", connum);

		session.commit();
		return check;
	}

	/*
	 * public ContentCommand updatecontent(int connum)throws Exception{
	 * SqlSessionFactory factory = null; SqlSession session = null;
	 * ContentCommand article = null; try { factory = getFactory(); session =
	 * factory.openSession();
	 * 
	 * check = session.delete("comment.contentdelete", connum);
	 * 
	 * session.commit(); } catch (Exception e) { e.printStackTrace(); } finally
	 * { if (session != null) try { session.close(); } catch (Exception ex) { }
	 * } return check; }
	 */
}
