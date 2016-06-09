package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.CommentCommand;
@Repository
public class CommentDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public int insertComment(CommentCommand dto){
		return session.insert("Comment.insertComment",dto);
	}
	
	public List<CommentCommand> getComments(int connum){
		return session.selectList("Comment.getComment",connum);
	}
	
	public int deleteComment(int comnum){
		return session.delete("Comment.deleteComment", comnum);
	}
	
	public CommentCommand selectComment(int comnum){
		return session.selectOne("Comment.selectComment",comnum);
		}
	
	public int updateComment(int comnum){
		return session.update("Comment.updateComment", comnum);
	}
	
	
	
/*	public List<UserInfoCommand> selectAllUserInfo() {
		//return session.selectList("selectAll");
		return session.selectList("UserInfo.selectAll");
	}
	public int insertUserInfo(UserInfoCommand info){
		return session.insert("UserInfo.insertUserInfo",info);
	}
	public int login(UserInfoCommand info){
		return session.selectOne("UserInfo.login",info);
	}
	public UserInfoCommand getUserInfo(String memId){
		return session.selectOne("UserInfo.selectUserInfo",memId);
	}
	public void modyfyUserInfo(UserInfoCommand info){
		session.update("UserInfo.modifyUserInfo", info);
	}
	public void withdrawal(String email){
		session.delete("UserInfo.withdrawal", email);
	}
	public String findPassword(UserInfoCommand info){
		return session.selectOne("UserInfo.findPassword",info);
	}*/
	
}
