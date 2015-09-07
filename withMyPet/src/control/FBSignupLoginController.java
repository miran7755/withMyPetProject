package control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import exception.AddException;
import service.LoginService;
import vo.Member;


@Controller("/FBSignupLogin.do")
public class FBSignupLoginController{
	@Autowired(required=true)
	private MemberDAO dao;
	@RequestMapping
	public ModelAndView execute(@ModelAttribute Member m,
			@RequestParam("n_email") String email,
			@RequestParam("n_nickname") String nickname,
			@RequestParam("n_pwd") String password,
			HttpSession session) throws AddException{	

		ModelAndView mav = new ModelAndView();
		//System.out.println("FB작동");
		
		/*String id = request.getParameter("id");
		String password = request.getParameter("pwd");*/
		
		String msg = "";		
		Member chk_mem = dao.selectByEmail(email);		
		if(chk_mem == null){		//비회원인 경우 Signup Flow
		m.setE_mail(email);
		m.setNickname(nickname);
		m.setPassword(password);			
		msg = "가입이 완료되었습니다. 로그인하세요.";
		dao.insert(m);
		}
		else{//회원인 경우 Login Session 정보 넣어주기 
			msg = "이미 존재하는 아이디입니다. 로그인합니다.";
		}
		//LoginSession정보 넣어주기 
		session.removeAttribute("loginInfo");
		Member member = dao.selectByEmail(email);
		session.setAttribute("loginInfo", member);
		//System.out.println("member&&&&&&" + member);

		mav.addObject("msg", msg);
		String url = "/loginResult.jsp";
		mav.setViewName(url);
		return mav;

	}

}
