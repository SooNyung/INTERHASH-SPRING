package mybatis;

import org.apache.ibatis.session.SqlSession;

import spring.model.ReportCommand;

public class ReportDAO {
	
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public int sendReport(ReportCommand dto){
		return session.insert("Report.sendReport", dto);
	}
	
	public int reportCount(String email){
		return session.update("Report.Reportcount", email);
	}
	
}
