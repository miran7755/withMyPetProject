package control;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.LoginService;
import vo.Blacklist;
import vo.Member;
import dao.MemberDAO;
import dao.PostDAO;


@Controller("/login.do")
public class LoginController{
	
	@Autowired(required=true)
	private LoginService service;
	
	@Autowired(required=true)
	private MemberDAO mdao;
	
	@Autowired
	private PostDAO pdao;

	
	@RequestMapping(method=RequestMethod.POST) //post방식으로 호출되었을때만 실행된다.
	/*public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {*/
	public ModelAndView execute(@ModelAttribute Blacklist blacklist,
								@ModelAttribute Member member,
								@RequestParam("em") String email,
								@RequestParam("pw") String password,
								HttpSession session){
		ModelAndView mav = new ModelAndView();
		String url = "/loginResult.jsp";
		Date nowDate = new Date();
		Date releaseDate = new Date();		
		//System.out.println("작동");
		//Model : request에 저장될 attribute
		//view : viewer용 jsp

		String msg = "로그인 성공";
		session.removeAttribute("loginInfo");
		try {
			service.login(email, password);
			member = mdao.selectByEmail(email);			

			blacklist = pdao.selectByBlacklist(email);		
			if(blacklist != null){
				releaseDate = blacklist.getBl_release();				
				if(member.getBl_flag() == 10){
					if((nowDate.compareTo(releaseDate)) >= 0){					
						member.setBl_flag(0);
						pdao.updateBlFlag(member);
						pdao.deleteBlackList(email);
					}	
				}	
			}					
			session.setAttribute("loginInfo", member);
		} catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
		}

		mav.addObject("msg", msg);
		mav.setViewName(url);
		return mav;
	}

}
