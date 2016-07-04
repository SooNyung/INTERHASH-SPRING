package mybatis;

import java.sql.Array;
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
	
	public int deleteMessage(int messagenum){
		return session.delete("Message.deleteMessage",messagenum);
	}
	
	public MessageCommand selectMessageOne(int messagenum){
		return session.selectOne("Message.MessageOne", messagenum);
	}
	
/*	public int insertMember(MemberCommand command){
		return session.insert("member.insert", command);
	}*/
	
	public Array selectNum(String email){
		return (Array) session.selectList("alarm.connum", email);
	}
	
	public Array selectNick(int comnum){
		return (Array) session.selectList("alarm.comnick", comnum);
	}
	
	public int selectCount(String email){
		return session.selectOne("alarm.count", email);
	}
}
