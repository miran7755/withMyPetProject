package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.Media_tag;
import vo.Member;
import vo.Post;
import dao.PostDAO;
import exception.AddException;

@Controller("/boardpost.do")
public class BoardPostController {
	@Autowired
	private PostDAO dao;

	@RequestMapping
	public ModelAndView execute(@ModelAttribute Member member,
								@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag, 
								HttpSession session) {
		System.out.println("in BoardPostController");
		ModelAndView mav = new ModelAndView();
		String url = "/boardlistview.do";
		
		member = (Member) session.getAttribute("loginInfo");
		post.setMember(member);
		
		try {
			dao.boardInsertPost(post, media_tag);			
		} catch (AddException e) {
			e.printStackTrace();
		}		
		
		mav.setViewName(url);
		return mav;
	}
}
