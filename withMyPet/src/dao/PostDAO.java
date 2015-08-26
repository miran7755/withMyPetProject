package dao;

import java.util.ArrayList;
import java.util.List;

import vo.Media_tag;
import vo.Post;
import exception.AddException;

public interface PostDAO {
	void insertAll(Post post, Media_tag media_tag) throws AddException;
	List<Post>selectByEmail(String email);
	List<Post>selectByFriend(String friend_no);
	

}
