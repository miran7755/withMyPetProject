package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.Media_tag;
import vo.Post;
import vo.Reply;
import dao.PostDAO;

@Controller("/boardreplylist.do")
public class BoardReplyListController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute ArrayList<Reply> replys,
								@ModelAttribute Post post,
								HttpSession session){
		System.out.println("in BoardReplyListController");
		ModelAndView mav = new ModelAndView();
		String url = "/boardreplylist.jsp";
		
		try {
			replys = dao.selectReply(post.getPost_no());
			mav.addObject("replys", replys);
		} catch (Exception e) {
			e.printStackTrace();
		}				

		mav.setViewName(url);
		return mav;
	}

}
