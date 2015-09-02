package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import vo.Blacklist;
import vo.Media_tag;
import vo.Member;
import vo.Post;
import vo.Reply;
import vo.Report;
import exception.AddException;

public interface PostDAO {
	/**
	 * 게시판에 새로운 글을 쓴다.
	 * @param post 글 제목, 작성자, 게시판 종류(timeline or board), 내용 
	 * @param media_tag 사진과 동영상을 첨부한다.
	 * @throws AddException
	 */
	void boardInsertPost(Post post, Media_tag media_tag) throws AddException;
	/**
	 * 게시판 전체목록 보기
	 * @return
	 * @throws Exception
	 */
	ArrayList<Post> boardSelectAll() throws Exception;
	/**
	 * 게시판 전체목록 보기에서 페이지빈 추가한다.
	 * @param cntPerPage
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	ArrayList<Post> boardSelectAll(int cntPerPage, int currentPage) throws Exception;
	/**
	 * 게시판에 있는 게시글의 수를 계산해서 온다.
	 * @return
	 * @throws Exception 
	 */
	int getTotalCnt() throws Exception;
	/**
	 * 게시판 목록에서 글쓴이(email)로 검색한다.
	 * @param email
	 * @return
	 */
	ArrayList<Post> boardSelectByEmail(String email) throws Exception;
	/**
	 * 게시판 목록에서 제목으로 검색한다.
	 * @param value
	 * @return
	 */
	ArrayList<Post> boardSelectBySubject(String value) throws Exception;
	/**
	 * 게시물 상세보기중 Post에 해당하는 내용 가져온다.
	 * @param post_no
	 * @return
	 */
	Post boardPostDetail(int post_no) throws Exception;
	/**
	 * 게시물 상세보기중 Media_tag에 해당하는 내용 가져온다.
	 * @param post_no
	 * @return
	 */
	Media_tag boardMedia_tagDetail(int post_no) throws Exception;
	/**
	 * 게시물에 좋아요수를 1 증가시킨다.
	 * @throws Exception
	 */
	void boardPostLikeCount(Post post) throws Exception;
	/**
	 * 게시물에 싫어요수를 1 증가시킨다.
	 * @throws Exception
	 */
	void boardPostHateCount(Post post) throws Exception;
	/**
	 * 게시물에 댓글을 단다.
	 * @param reply
	 * @throws AddException
	 */
	void insertReply(Reply reply) throws AddException;
	/**
	 * 게시물에 해당하는 댓글목록을 불러온다.
	 * @param reply
	 * @return
	 * @throws Exception
	 */
	ArrayList<Reply> selectReply(int post_no) throws Exception;
	/**
	 * 댓글에 좋아요 수를 1 증가시킨다.
	 * @param reply
	 * @throws Exception
	 */
	void replyLikeCount(Reply reply) throws Exception;
	/**
	 * 해당 댓글에 좋아요 수를 불러온다.
	 * @param reply
	 * @return
	 */
	int selectReplyLikeCount(Reply reply);
	/**
	 * 신고 카운트를 1 증가시킨다.
	 * @param report
	 */
	void report(Report report);
	/**
	 * 신고횟수를 조회해온다.
	 * @param report
	 * @return
	 */
	int reportCount(Report report);
	/**
	 * 블랙리스트에 추가한다.
	 * @param blacklist
	 */
	void insertBlackList(Blacklist blacklist);
	/**
	 * BlackList Flag를 변경해준다.
	 * @param member
	 */
	void updateBlFlag(String e_mail);
	/**
	 * 해당 e_mail 유저의 멤버정보를 가져온다.
	 * @param reported_email
	 * @return
	 */
	Member selectByMember(String reported_email);
	
	

}
