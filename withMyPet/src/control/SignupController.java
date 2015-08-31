package control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import dao.MemberDAO;
import exception.AddException;

@Controller("/signup.do")
public class SignupController {
	
	@Autowired
	private MemberDAO dao;
	

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView execute(@ModelAttribute Member m,
								@RequestParam("n_email") String email,
								@RequestParam("n_nickname") String nickname,
								@RequestParam("n_pwd") String password) throws AddException{	

		System.out.println("@@@@@@@signupcontroller");
		//request.setCharacterEncoding("UTF-8");  ->요청한글처리는 web.xml에 추가
		//String id = request.getParameter("id");
		//String pw = request.getParameter("pwd");
		
		ModelAndView mav = new ModelAndView();
		String url = "";
		String msg = "";
		
		Member chk_mem = dao.selectByEmail(email);
		if(chk_mem == null){		
		m.setE_mail(email);
		m.setNickname(nickname);
		m.setPassword(password);			
		msg = "가입이 완료되었습니다. 로그인하세요. ^^ㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		dao.insert(m);
		}
		else{
			msg = "이미 존재하는 아이디입니다.";			
		}
		url = "/signupResult.jsp";
		 mav.addObject("msg", msg);
		 mav.setViewName(url);
		return mav;
	}
}
