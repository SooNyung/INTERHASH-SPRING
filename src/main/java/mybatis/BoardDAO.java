package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.model.BoardCommand;

public class BoardDAO {
	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public List<BoardCommand> selectAll(){
		return session.selectList("Board.selectAll");
	}
	public BoardCommand selectOne(int num){
		return session.selectOne("Board.selectOne", num);
	}
	
	
	public int insert_Content(BoardCommand board){
		return session.insert("Board.insert_content", board);
	}
}
