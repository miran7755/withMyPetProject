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

@Controller("/boardadjust.do")
public class BoardAdjustController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Member member,
								@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag,
								HttpSession session){
		System.out.println("in BoardAdjustController");
		ModelAndView mav = new ModelAndView();
		String url = "/boarddetail.do";
		
		member = (Member) session.getAttribute("loginInfo");
		post.setMember(member);
		
		System.out.println("member = " + member);
		System.out.println("post = " + post);
		System.out.println("media_tag = " + media_tag);
		
		
		try {
			dao.boardPostUpdate(post);
			post = dao.boardPostDetail(post.getPost_no());
			media_tag = dao.boardMedia_tagDetail(post.getPost_no());
		
			mav.addObject("post", post);
			mav.addObject("media_tag", media_tag);
		} catch (AddException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		mav.setViewName(url);
		return mav;
	}

}
