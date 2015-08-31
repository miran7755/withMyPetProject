package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.LoginService;
import vo.Member;
import dao.MemberDAO;
import exception.AddException;

@Controller("/FBLogin.do")
public class FBLoginController {

	@Autowired(required=true)
	private MemberDAO dao;

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView execute(
			@RequestParam("n_email") String email,
			@RequestParam("n_nickname") String nickname,
			@RequestParam("n_pwd") String password) {	

        System.out.println("@@@@@@@signupcontroller");

        ModelAndView mav = new ModelAndView();

		mav.addObject("msg", "msg");
		String url = "/loginResult.jsp";
		mav.setViewName(url);
		return mav;

	}

}
