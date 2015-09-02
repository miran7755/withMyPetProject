package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.Blacklist;
import vo.Media_tag;
import vo.Member;
import vo.Post;
import vo.Report;
import dao.PostDAO;

@Controller("/report.do")
public class ReportController {
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Member member,
								@ModelAttribute Report report,
								@ModelAttribute Post post,
								@ModelAttribute Media_tag media_tag,
								@ModelAttribute Blacklist blacklist,
								HttpSession session){
		System.out.println("in ReportController");
		ModelAndView mav = new ModelAndView();
		String url = "/boarddetail.jsp";
		
		int report_count = 0;
		
		member = dao.selectByMember(report.getReported_email());
		System.out.println("member = " + member);
		
		if(report_count == 10){
			blacklist.setE_mail(report.getReported_email());
			dao.insertBlackList(blacklist);
			dao.updateBlFlag(report.getReported_email());
			
			try {
				post = dao.boardPostDetail(report.getPost_no());
				media_tag = dao.boardMedia_tagDetail(report.getPost_no());
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}else{
			try {			
				dao.report(report);
				post = dao.boardPostDetail(report.getPost_no());
				media_tag = dao.boardMedia_tagDetail(report.getPost_no());			
			} catch (Exception e) {	
				e.printStackTrace();
			}			
		}	
		mav.addObject("post", post);
		mav.addObject("media_tag", media_tag);
		mav.setViewName(url);
		return mav;
		
	}
}
