package mybatis;

import org.apache.ibatis.session.SqlSession;

public class ConfirmDAO {
	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public int existEmail(String email){
		return session.selectOne("Confirm.existEmail",email);
	}
	public int existNickname(String nickname){
		return session.selectOne("Confirm.existName",nickname);
	}
}

/*
<select id="existEmail" parameterType="String" resultType="Integer">
select count(*) from usertable where email=#{email}
</select>*/