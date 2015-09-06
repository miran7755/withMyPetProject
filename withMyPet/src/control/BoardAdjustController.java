package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import vo.Post;
import dao.PostDAO;

@Controller("/boardadjust.do")
public class BoardAdjustController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Post post,
								HttpSession session){
		System.out.println("in BoardAdjustController");
		ModelAndView mav = new ModelAndView();
		String url = "";
		
		Member member = (Member) session.getAttribute("loginInfo");
		post.setMember(member);
		post.setTb_flag('b');
		
		
		System.out.println("post = " + post);
		
		
		
		mav.setViewName(url);
		return mav;
	}

}
