package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.controller.member.TempPasswd;
import spring.model.MemberCommand;
import spring.model.ProfilePhotoCommand;
import spring.model.VisitCommand;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public int insertMember(MemberCommand command) {
		return session.insert("member.insert", command);
	}

	public MemberCommand modify(String email) {
		return session.selectOne("member.selectMember", email);

	}

	public int modifyPro(MemberCommand command) {
		return session.update("member.updateMember", command);
	}

	public int deleteMember(String email) {
		return session.delete("member.delete", email);
	}

	public int modifyHash(MemberCommand command) {
		return session.update("member.updateHash", command);
	}

	public String checkDelete(String email) {
		return session.selectOne("member.checkdelete", email);
	}

	public String findPassword(MemberCommand info) {
		return session.selectOne("member.findPassword", info);
	}

	public int login(MemberCommand info) {
		System.out.println(info.getEmail() + " ::: " + info.getPasswd());
		// String s= session.selectOne("member.login", info);
		// System.out.println("s:::"+s);
		// return s;

		return session.selectOne("member.login", info);
	}
	public int getAdmin(String email){
		return session.selectOne("member.getAdmin",email);
	}

	public String nick(MemberCommand info) {
		return session.selectOne("member.nick", info);
	}

	public int findEmail(MemberCommand info) {
		return session.selectOne("member.findEmail", info);
	}

	public List<MemberCommand> emailList() {
		return session.selectList("member.emailList");
	}


	public List<String> selectEmail() {
		return session.selectList("member.selectEmail");
	}

	public String tempPasswd(TempPasswd temppw) {
		return session.selectOne("member.tempPasswd", temppw);
	}

	public MemberCommand getMemberInfo(String email) {
		return session.selectOne("member.selectMember", email);
	}
	
	public int profile(MemberCommand command){
		return session.update("member.profile", command);
	}
	
	public String selectCheck(String email){
		return session.selectOne("member.selectCheck", email);
	}
	
	public int insertProfile(ProfilePhotoCommand command){
		return session.insert("member.insertP", command);
		
	}
	
	public String selectPath(String email){
		return session.selectOne("Profile.selectPath", email);
	}
	
	public MemberCommand selectNick(String nickname) {
		return session.selectOne("member.selectNick", nickname);

	}
	
	public String photoView(String email){
		return session.selectOne("member.photoView", email);
	}
	public List getPhotoPathMap(){
		return session.selectList("member.getprofilepath");
		
		
		
	}

	public int visitor(VisitCommand visit){
		return session.insert("member.visitor", visit);
		
	}
	
}
