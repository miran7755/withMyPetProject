package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import dao.FriendDAO;

@Controller("/friendlist.do")
public class FriendListController {
	
	@Autowired(required=true)
	private FriendDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@RequestParam(required=false, value="email") String email,
			HttpSession session  ){
		ModelAndView mav = new ModelAndView();
		ArrayList<Member> fl = new ArrayList<Member>();
		Member my = (Member) session.getAttribute("loginInfo");
		System.out.println("my : " + my);
		String myemail = my.getE_mail();
		//System.out.println("myemail : " + myemail + "email: " + email);
		
		String url = "/friendlistResult.jsp";
		try {
			fl = dao.selectFriend(myemail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("fl", fl);
		mav.setViewName(url);
		return mav;
	}

}
