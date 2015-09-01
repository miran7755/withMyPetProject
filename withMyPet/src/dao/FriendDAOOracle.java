package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.Member;
@Repository("FriendDAO")
public class FriendDAOOracle implements FriendDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public ArrayList<Member> selectFriend(String email) throws Exception {
		ArrayList<Member> fl = (ArrayList) session.selectList("FriendMapper.selectFriend", email);
		return fl;
	}

	@Override
	public void insert(String email) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String email) {
		// TODO Auto-generated method stub

	}

}
