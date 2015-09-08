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
import dao.PostDAO;

@Controller("/timelineListView.do")
public class TimelineListViewController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute ArrayList<Post> posts,
								@ModelAttribute ArrayList<Media_tag> media_tags,
								HttpSession session){
		System.out.println("in TimelineListViewController");
		ModelAndView mav = new ModelAndView();
		String url = "/timelineListView.jsp";
		
		try {
			posts = dao.TimelineSelectAll();
			media_tags = dao.TimelineSelectAllMedia_tag();
			
			mav.addObject("posts", posts);
			mav.addObject("media_tags", media_tags);			
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.setViewName(url);
		return mav;		
	}
}
