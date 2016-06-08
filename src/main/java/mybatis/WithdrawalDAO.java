package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.model.WithdrawalCommand;

public class WithdrawalDAO {

	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public List<WithdrawalCommand> selectMember(){
		
		return session.selectList("admin.withselect");
	}
	
}
