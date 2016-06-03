package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ZipcodeCommand;

@Component
public class ZipcodeDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<ZipcodeCommand> selectAllInfo() {
		//return session.selectList("selectAll");
		return session.selectList("ZipcodeInfo.selectAll");
	}
	public List<ZipcodeCommand> selectInfo(String area4) {
		//return session.selectList("selectAll");
		return session.selectList("ZipcodeInfo.selectInfo",area4);
	}
}
