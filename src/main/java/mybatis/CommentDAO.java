package mybatis;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.print.DocFlavor.STRING;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.CommentCommand;
@Repository
public class CommentDAO {
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public int insertComment(CommentCommand dto){
		return session.insert("Comment.insertComment",dto);
	}
	
	public List<String> getComments(int connum){
		return session.selectList("Comment.getComment",connum);
	}
	
	public int deleteComment(int comnum){
		return session.delete("Comment.deleteComment", comnum);
	}
	
	public CommentCommand selectComment(int comnum){
		return session.selectOne("Comment.selectComment",comnum);
		}
	
	public int updateComment(CommentCommand dto){
		return session.update("Comment.updateComment", dto);
	}
	
	public int commentcount(int connum){
		return session.selectOne("Comment.commentcount",connum);
	}
	
	public List<String> testcomment(){
		return session.selectList("Comment.test");	
	} 
	
	public String test(int comnum){
		SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-dd HH:mm");
		String testdate = sdf.format(session.selectOne("Comment.date1",comnum));
		return testdate;
	}

	
}
