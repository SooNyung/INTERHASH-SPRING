package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.model.UserInfoCommand;


public class UserInfoDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<UserInfoCommand> selectAllUserInfo() {
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
	}
}
