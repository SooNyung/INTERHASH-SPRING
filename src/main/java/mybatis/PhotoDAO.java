package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.PhotoCommand;
import spring.model.ProfilePhotoCommand;

@Repository
public class PhotoDAO {

	@Autowired
	SqlSession session;
	
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	public int insertPhoto(PhotoCommand command){
		return session.insert("writecontent.insertPhoto", command);
	}
	public List<PhotoCommand> selectPhoto(int connum){
		return session.selectList("writecontent.selectPhoto",connum);
	}
	
	public int updateProfilePhoto(ProfilePhotoCommand command){
		return session.update("Profile.update", command);
	}

}
