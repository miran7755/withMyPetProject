package control;

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
import exception.AddException;

@Controller("/boardreply.do")
public class BoardReplyController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Reply reply,
								@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag,
								HttpSession session){
		System.out.println("in BoardReplyController");
		ModelAndView mav = new ModelAndView();
		String url = "/boarddetail.jsp";

		try {
			dao.insertReply(reply);
			post = dao.boardPostDetail(reply.getPost_no());
			media_tag = dao.boardMedia_tagDetail(reply.getPost_no());
		} catch (AddException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("post", post);
		mav.addObject("media_tag", media_tag);
		mav.setViewName(url);
		return mav;
	}

}
