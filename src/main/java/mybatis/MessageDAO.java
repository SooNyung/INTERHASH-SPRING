package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import spring.model.MemberCommand;

/*�޽��� ���� DAO*/
public class MessageDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
/*	public int insertMember(MemberCommand command){
		return session.insert("member.insert", command);
	}*/
	
}
