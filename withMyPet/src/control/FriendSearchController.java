package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Friend_list;
import vo.Member;
import dao.FriendDAO;


@Controller("/friendsearch.do")
public class FriendSearchController {
	@Autowired
	FriendDAO dao;
	
	@RequestMapping
	public ModelAndView execute(
			@RequestParam(required = false, value = "search_email") String search_email,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Member> searchFriend = new ArrayList<Member>();
		System.out.println("search email ==== : " + search_email);
		
		String url = "/searchFriendResult.jsp";
		try {
			searchFriend = dao.searchFriend("%"+search_email+"%");
			System.out.println("controller searchFriend값 : " + searchFriend);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// mav.addObject("fl", fl);
		mav.addObject("sf", searchFriend);

		// mav.addObject("fl2", "hi");
		mav.setViewName(url);
		return mav;
	}

}

