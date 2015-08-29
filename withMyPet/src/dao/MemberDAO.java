package dao;

import java.util.ArrayList;

import exception.AddException;
import vo.Member;

public interface MemberDAO {

	public ArrayList<Member> selectAll() throws Exception;
	public Member selectByEmail(String email);
	public void insert(Member m) throws AddException;
	public void update(String email);
	public void delete(String email);
	
}
