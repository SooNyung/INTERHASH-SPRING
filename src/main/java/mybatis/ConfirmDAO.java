package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.ContentCommand;

@Repository
public class ConfirmDAO {
	@Autowired
	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public int existEmail(String email){
		return session.selectOne("Confirm.existEmail",email);
	}
	public int existNickname(String nickname){
		return session.selectOne("Confirm.existNickname",nickname);
	}
	public ContentCommand getContent(int connum){
		return session.selectOne("Confirm.getContent", connum);
	}
	public int getConlike(int connum){
		return session.selectOne("Confirm.getConlike", connum);
	}
	public void conlikePlus(int connum){
		session.update("Confirm.conlikePlus", connum);
	}
	public void unlike(int connum){
		session.update("Confirm.unlike",connum);
	}
/*	public void adminlike(String hashname){
		session.update("Confirm.adminlike",hashname);
	}
	public void adminunlike(String hashname){
		session.update("Confirm.adminunlike",hashname);
	}*/
}