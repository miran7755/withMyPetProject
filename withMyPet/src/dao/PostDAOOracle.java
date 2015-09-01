package dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vo.Media_tag;
import vo.Post;
import vo.Reply;
import exception.AddException;

@Repository("postDAO")
public class PostDAOOracle implements PostDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	@Transactional
	public void boardInsertPost(Post post, Media_tag media_tag) throws AddException{
		System.out.println("in PostDAOOracle insertAll");		
		session.insert("BoardMapper.insertAll", post);
		if(media_tag.getImg() == null){
			media_tag.setImg(null);
		}
		if(media_tag.getTag_name() == null){
			media_tag.setTag_name("null");
		}
		if(media_tag.getVideo() == null){
			media_tag.setVideo("null");
		}		
		System.out.println(media_tag.getImg() + "" + media_tag.getVideo());
		session.insert("BoardMapper.insertMedia", null);
	}
	
	@Override
	public ArrayList<Post> boardSelectAll() throws Exception{
		ArrayList<Post> list = new ArrayList<Post>();
		list = (ArrayList)session.selectList("BoardMapper.selectAll");
		return list;
	}
	
	@Override
	public ArrayList<Post> boardSelectAll(int cntPerPage, int currentPage) throws Exception{
		System.out.println("in PostDAOOracle selectAll(int cntPerPage, int currentPage)");
		ArrayList<Post> posts = new ArrayList<Post>();
		HashMap<String, Integer>map = new HashMap<String, Integer>();
		map.put("currentPage", currentPage);
		map.put("cntPerPage", cntPerPage);
		posts = (ArrayList)session.selectList("BoardMapper.selectAllPage", map);
		return posts;	
	}
	
	@Override
	public ArrayList<Post> boardSelectByEmail(String value) throws Exception{
		System.out.println("in PostDAOOracle selectByEmail(String email)");
		ArrayList<Post> posts = new ArrayList<Post>();
		posts = (ArrayList)session.selectList("BoardMapper.selectByEmail", value);
		return posts;
	}

	@Override
	public int getTotalCnt() throws Exception{
		System.out.println("in PostDAOOracle getTotalCnt()");
		return session.selectOne("BoardMapper.getTotalCnt");
	}

	@Override
	public ArrayList<Post> boardSelectBySubject(String value) throws Exception{
		System.out.println("in PostDAOOracle selectBySubject(String value)");
		ArrayList<Post> posts = new ArrayList<Post>();
		posts = (ArrayList)session.selectList("BoardMapper.selectBySubject", value);
		return posts;
	}

	@Override
	public Post boardPostDetail(int post_no) throws Exception{
		System.out.println("in PostDAOOracle postDetail(String post_no)");
		Post post = new Post();
		post = session.selectOne("BoardMapper.postDetail", post_no);
		return post;
	}
	
	@Override
	public Media_tag boardMedia_tagDetail(int post_no) throws Exception{
		System.out.println("in PostDAOOracle media_tagDetail(String post_no)");
		Media_tag media_tag = new Media_tag();
		media_tag = session.selectOne("BoardMapper.media_tagDetail", post_no);
		return media_tag;
	}
	
	@Override
	public void boardPostLikeCount(Post post) throws Exception{
		System.out.println("in PostDAOOracle likeCount()");
		session.update("BoardMapper.likeCount", post);		
	}
	
	@Override
	public void boardPostHateCount(Post post) throws Exception{
		System.out.println("in PostDAOOracle hateCount()");
		session.update("BoardMapper.hateCount", post);		
	}
	
	@Override
	public void insertReply(Reply reply) throws AddException{
		System.out.println("in PostDAOOracle insertReply(Reply reply)");
		session.insert("BoardMapper.insertReply", reply);		
	}
	
	@Override
	public ArrayList<Reply> selectReply(int post_no) throws Exception{
		System.out.println("in PostDAOOracle selectReply(Reply reply)");
		ArrayList<Reply> replys = new ArrayList<Reply>();
		replys = (ArrayList)session.selectList("BoardMapper.selectReply", post_no);
		return replys;		
	}
	
	@Override
	public void replyLikeCount(Reply reply) throws Exception{
		System.out.println("in PostDAOOracle replyLikeCount()");
		session.update("BoardMapper.replyLikeCount", reply);		
	}
	


}
