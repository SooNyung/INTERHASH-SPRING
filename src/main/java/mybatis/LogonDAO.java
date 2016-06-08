package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.model.MemberCommand;

public class LogonDAO {
	
SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public List<MemberCommand> selectMember(){
	return session.selectList("userinfo.getMember");
	}
}
