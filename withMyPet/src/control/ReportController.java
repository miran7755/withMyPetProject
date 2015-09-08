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
		
		member = dao.selectByMember(report.getReported_email());
		System.out.println("신고" + member.getBl_flag() + "번째");
		if(member.getBl_flag() == 9){
			dao.report(report);
			member.setBl_flag(member.getBl_flag() + 1);
			dao.updateBlFlag(member);
			blacklist.setE_mail(report.getReported_email());
			dao.insertBlackList(blacklist);
			
			try {
				post = dao.boardPostDetail(report.getPost_no());
				media_tag = dao.boardMedia_tagDetail(report.getPost_no());
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}else{
			try {			
				dao.report(report);
				member.setBl_flag(member.getBl_flag() + 1);
				dao.updateBlFlag(member);
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
