package control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Media_tag;
import vo.Post;
import dao.PostDAO;

@Controller("/boarddetail.do")
public class BoardDetailController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag,
								@RequestParam("post_no") int post_no){
		System.out.println("in BoardDetailController");
		ModelAndView mav = new ModelAndView();
		String url = "/boarddetail.jsp";
		
		try {
			post = dao.boardPostDetail(post_no);
			media_tag = dao.boardMedia_tagDetail(post_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.addObject("post", post);
		mav.addObject("media_tag", media_tag);
		mav.setViewName(url);		
		return mav;
	}

}
