package mybatis;
/*
 * 게시물에 대한 DAO객체 입니다.
 * 
 */
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.AdminCommand;
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
	}

	public ArrayList<ContentCommand> getContent() {
		ArrayList photo = null;
		ArrayList<ContentCommand> array = (ArrayList) session.selectList("writecontent.getContent");
		
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = array.get(i);
			int connum = bean.getConnum();
			bean.setCommentcount(session.selectOne("Comment.commentcount",connum));
			photo = (ArrayList) session.selectList("writecontent.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		return array;
	}

	public ArrayList getReport() throws Exception {
		return (ArrayList) session.selectList("report.getreport");
	}

	public ArrayList<ContentCommand> getContent(String hash) throws Exception {
		ArrayList photo = null;
		ArrayList<ContentCommand> array = (ArrayList) session.selectList("writecontent.getContentByHash", hash);

		// array = (ArrayList) session.selectList("writecontent.getContent");
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("photo.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		return array;
	}
	
	public ContentCommand getContent(int connum){
		ContentCommand content = null;
		ArrayList photo = (ArrayList) session.selectList("writecontent.selectPhoto",connum);
		content = session.selectOne("writecontent.getContentone",connum);
		content.setPhotolist(photo);
		return content;
	}
	
	public int deleteContent(int connum){
		int result = session.delete("writecontent.deleteContent",connum);
		System.out.println("result :::::" + result);
		return result;
	}
	public int modifyContent(ContentCommand command){
		return session.update("writecontent.updateContent",command);
	}
	
	
	public List<ContentCommand> myContent(String email){
		ArrayList photo = null;
		ArrayList<ContentCommand> array = (ArrayList) session.selectList("writecontent.myContent",email);
		
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("writecontent.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		return array;
	}

	public List<ContentCommand> hashLike(String conhash){
		ArrayList photo = null;
		ArrayList<ContentCommand> array = (ArrayList) session.selectList("writecontent.hashLike",conhash);
		
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("writecontent.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		return array;

	}
	
	public List<ContentCommand> search(String searchname) {
		ArrayList photo = null;
		ArrayList<ContentCommand> array = (ArrayList) session.selectList("writecontent.search", searchname);
		
		for (int i = 0; i < array.size(); i++) {
			ContentCommand bean = array.get(i);
			int connum = bean.getConnum();
			photo = (ArrayList) session.selectList("writecontent.selectPhoto", connum);
			bean.setPhotolist(photo);
			array.set(i, bean);
		}
		return array;
	
	}
	
	//popular 테이블의 해당 날짜의 게시물 번호가 있는지 체크
	public int getdate(int connum){
		return session.selectOne("writecontent.search_date",connum);
	}
	//popular 테이블의 해당 날짜와 게시물 번호가 없을 경우 추가
	public int insertpop(int connum){
		return session.insert("writecontent.insert_pop",connum);
	}
	//popular 테이블의 조회수 +1
	public int update_count(int connum){
		return session.update("writecontent.update_count", connum);
	}
	//popular 테이블의 좋아요 수 +1
	public int update_like(int connum){
		return session.update("writecontent.update_like", connum);
	}
	//popular 테이블의 좋아요 수 -1
		public int update_likedown(int connum){
			return session.update("writecontent.update_likedown", connum);
		}
	public List getPopContents(){
		return session.selectList("writecontent.getpopularcontent");
	}
/*	public ContentCommand getContent(int connum) throws Exception {
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
	}*/


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
