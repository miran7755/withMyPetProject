package dao;

import java.util.ArrayList;

import vo.Friend_list;
import vo.Member;
import exception.AddException;

public interface FriendDAO {
	public ArrayList<Friend_list> selectFriend(String email) throws Exception;
	public void insert(Friend_list addFriend);
	public void delete(Friend_list delFriend);
	public ArrayList<Member> searchFriend(String search_email);

}
