package dao;

import java.util.ArrayList;

import vo.Member;

public interface MemberDAO {

	public ArrayList<Member> selectAll() throws Exception;
	public Member selectByEmail(String email);
	public void insert(Member m);
	public void update(String email);
	public void delete(String email);
	
}
