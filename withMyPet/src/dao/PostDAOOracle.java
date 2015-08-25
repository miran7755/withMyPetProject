package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vo.Media_tag;
import vo.Post;
import exception.AddException;

@Repository("postDAO")
public class PostDAOOracle implements PostDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	@Transactional
	public void insertAll(Post post, ArrayList<Media_tag> media_tag) throws AddException{
		session.insert("BoardMapper.insertAll", post);
		session.insert("BoardMapper.insertMedia", media_tag);
		
	}

	@Override
	public List<Post> selectByEmail(String email) {
		
		return null;
	}

	@Override
	public List<Post> selectByFriend(String friend_no) {
		
		return null;
	}



}
