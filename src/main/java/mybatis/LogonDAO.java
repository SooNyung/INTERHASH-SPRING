package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.MemberCommand;

@Repository
public class LogonDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<MemberCommand> selectMember() {
		return session.selectList("userinfo.getMember");
	}
}
