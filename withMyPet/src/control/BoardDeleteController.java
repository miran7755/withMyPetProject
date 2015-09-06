package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import dao.PostDAO;

@Controller("/boarddelete.do")
public class BoardDeleteController {
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Member member,
								@RequestParam("post_no") int post_no,
								HttpSession session){
		System.out.println("in BoardDeleteController");
		ModelAndView mav = new ModelAndView();
		String url = "/boardlistview.do";
		String msg = "게시물이 삭제되었습니다.";
		
		member = (Member) session.getAttribute("loginInfo");
		
		dao.boardDelete(post_no);
		
		mav.addObject("msg", msg);
		mav.setViewName(url);
		return mav;
	}
	
}
