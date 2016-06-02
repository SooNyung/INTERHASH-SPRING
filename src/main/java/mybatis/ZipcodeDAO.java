package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.model.ZipcodeCommand;

public class ZipcodeDAO {
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
