package dao;

import java.util.ArrayList;

import vo.Member;
import exception.AddException;

public interface FriendDAO {
	public ArrayList<Member> selectFriend(String email) throws Exception;
	public void insert(String email);
	public void delete(String email);

}
