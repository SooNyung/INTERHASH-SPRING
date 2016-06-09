package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.WithdrawalCommand;

@Repository
public class WithdrawalDAO {
	@Autowired
	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public List<WithdrawalCommand> selectMember(){
		
		return session.selectList("admin.withselect");
	}
	
}
