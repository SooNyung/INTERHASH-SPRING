package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.ReportCommand;

@Repository
public class ReportDAO {
	@Autowired
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
	
	public int sendReportCom(ReportCommand dto){
		return session.insert("Report.sendReportCom",dto);
	}
	
}
