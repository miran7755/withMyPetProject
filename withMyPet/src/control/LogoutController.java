package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("/logout.do")
public class LogoutController{

	@RequestMapping
	public ModelAndView execute(HttpSession session) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		// session 객체 얻기
//		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginInfo");
		String url="logoutResult.jsp";

		if (obj == null) {//로그인 안된 경우
			//request.setAttribute("msg", "로그인 실패");
			mav.addObject("msg", "로그아웃 실패");
		} else {//로그인 된 경우
			session.removeAttribute("loginInfo");//
			session.invalidate();//session 강제 제거
			//request.setAttribute("msg", "로그아웃 성공");
			mav.addObject("msg", "로그아웃 성공");
		}
		mav.setViewName(url);
		return mav;
	}

}
