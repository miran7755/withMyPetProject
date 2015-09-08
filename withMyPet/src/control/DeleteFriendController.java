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

@Controller("/delFriend.do")
public class DeleteFriendController {
	@Autowired
	private FriendDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Friend_list friend_list,
								@ModelAttribute Member member,
								@RequestParam("del_email") String del_email,
								HttpSession session  ){
		
		
		ModelAndView mav = new ModelAndView();
		String msg = "";
		friend_list.setFriend_e_mail(del_email);
		
		member = (Member) session.getAttribute("loginInfo");
		friend_list.setE_mail(member.getE_mail());
		try{
			dao.delete(friend_list);
			msg = "친구를 삭제하였습니다. ";
		}catch(Exception e){
			e.printStackTrace();
		}
			
		mav.addObject("msg", msg);
		String url = "/delFriendResult.jsp";
		mav.setViewName(url);
		//System.out.println(mav);
		return mav;
	}
	

}