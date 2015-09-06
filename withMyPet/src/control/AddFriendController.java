package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Friend_list;
import vo.Member;
import dao.FriendDAO;
import exception.AddException;

@Controller("/addFriend.do")
public class AddFriendController {
	@Autowired
	private FriendDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Friend_list friend_list,
								@ModelAttribute Member member,
								@RequestParam("add_email") String add_email,
								HttpSession session  ){
		
		
		ModelAndView mav = new ModelAndView();
		String msg = "";
		friend_list.setFriend_e_mail(add_email);
		
		member = (Member) session.getAttribute("loginInfo");
		friend_list.setE_mail(member.getE_mail());
		
		int cnt = 0;
		try {
			ArrayList<Friend_list> check_friend = (ArrayList) dao.selectFriend(member.getE_mail());
			System.out.println("친구확인  ==="+ check_friend);
			for(int i=0; i>check_friend.size(); i++){
				if(check_friend.get(i).getE_mail().equals(add_email)){
					++cnt;
					break;
				}
			}
			if(cnt > 0){
				msg = "이미 팔로우 중인 친구입니다.";
			}else{
				dao.insert(friend_list);	
				msg = "친구로 추가되었습니다. ";
			}
			
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		
		mav.addObject("msg", msg);
		String url = "/addFriendResult.jsp";
		mav.setViewName(url);
		//System.out.println(mav);
		return mav;
	}
	

}
