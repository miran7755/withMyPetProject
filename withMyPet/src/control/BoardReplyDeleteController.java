package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Reply;
import dao.PostDAO;

@Controller("/boardreplydelete.do")
public class BoardReplyDeleteController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute ArrayList<Reply> replys,
								@ModelAttribute Reply reply,
								HttpSession session){
		System.out.println("in BoardReplyDeleteController");
		ModelAndView mav = new ModelAndView();
		String url = "/boarddetail.do";
		
		try {
			dao.boardReplyDelete(reply);
			replys = dao.selectReply(reply.getPost_no());
			mav.addObject("replys", replys);
		} catch (Exception e) {
			e.printStackTrace();
		}		

		mav.setViewName(url);
		return mav;
	}
	
}
