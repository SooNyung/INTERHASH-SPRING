package mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.model.MemberCommand;

public class MemberDAO extends SqlSessionDaoSupport{
	public int insertMember(MemberCommand command){
		return getSqlSession().insert("member.insert", command);
	}
	
	public MemberCommand modify(String email){
		return getSqlSession().selectOne("member.selectMember", email);
		
	}
	
	public int modifyPro(MemberCommand command){
		return getSqlSession().update("member.updateMember", command);
	}
	
	public int deleteMember(String email){
		return getSqlSession().delete("member.delete", email);
	}
	
	public String checkDelete(String email){
		return getSqlSession().selectOne("logon.checkdelete",email);
	}
	public String findPassword(MemberCommand info){
		return getSqlSession().selectOne("UserInfo.findPassword",info);
	}
}
