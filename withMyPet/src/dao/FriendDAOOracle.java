package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.Friend_list;
import vo.Member;

@Repository("FriendDAO")
public class FriendDAOOracle implements FriendDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public ArrayList<Friend_list> selectFriend(String email) throws Exception {
		ArrayList<Friend_list> fl = (ArrayList) session.selectList("FriendMapper.selectFriend", email);
		System.out.println("DAO fl값 : " +fl);
		return fl;
	}

	@Override
	public void insert(Friend_list addFriend) {
		session.insert("FriendMapper.insert", addFriend);
	}

	@Override
	public void delete(Friend_list delFriend) {
		session.delete("FriendMapper.deleteFriend", delFriend);

	}

	@Override
	public ArrayList<Member> searchFriend(String search_email) {
		ArrayList<Member> searchFriend = (ArrayList) session.selectList("FriendMapper.searchFriend", search_email);
		return searchFriend;
	}

}
