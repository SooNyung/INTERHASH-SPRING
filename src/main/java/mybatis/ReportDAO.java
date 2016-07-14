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
	
	public int reportCountCon(String email){
		return session.update("Reportcountcon",email);
	}
	
	public int reportCountCom(String email){
		return session.update("Reportcountcom",email);
	}
	public String getreportcontent(int connum){
		return session.selectOne("Report.getreportcontent",connum);
	}
	public String getreportcomment(int comnum){
		return session.selectOne("Report.getreportcomment",comnum);
	}
}
