package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.Member;
@Repository("MemberDAO")
public class MemberDAOOracle implements MemberDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public ArrayList<Member> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public Member selectByEmail(String email) {
		Member m = session.selectOne("MemberMapper.selectByEmail", email);
		return m;
	}



	@Override
	public void insert(Member m) {
		session.insert("MemberMapper.insert", m);
		
	}


	

	@Override
	public void update(String email) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String email) {
		// TODO Auto-generated method stub
		
	}



	
}
