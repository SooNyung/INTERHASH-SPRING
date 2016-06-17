package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.MessageCommand;

/*메시지 구현 DAO*/
@Repository
public class MessageDAO {
	
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public int sendMessage(MessageCommand dto){
		return session.insert("Message.send",dto);
	}
	public List getMessageList(String email){
		return session.selectList("Message.getMessageList",email);
	}
	public int getMessageCount(String email){
		return session.selectOne("Message.getMessageCount",email);
	}
/*	public int insertMember(MemberCommand command){
		return session.insert("member.insert", command);
	}*/
	
}
