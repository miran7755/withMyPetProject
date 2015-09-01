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
	public ModelAndView execute(@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag, 
								HttpSession session) {
		System.out.println("in BoardPostController");
		ModelAndView mav = new ModelAndView();
		
		String e_mail = (String) session.getId();
		Member member = new Member();
		member.setE_mail(e_mail);
		post.setMember(member);
		
		System.out.println("e_mail = " + e_mail);
		System.out.println("post = " + post);
		System.out.println("media_tag = " + media_tag);
		
		try {
			dao.boardInsertPost(post, media_tag);

		} catch (AddException e) {
			e.printStackTrace();
		}

		return mav;
	}

}
