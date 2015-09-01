package control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("/replylikecount.do")
public class ReplyLikeCountController{

	@RequestMapping
	public ModelAndView execute(){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

}
