package control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import service.LoginService;
import vo.Member;


@Controller("/login.do")
public class LoginController{
	@Autowired(required=true)
	private LoginService service;
	@Autowired(required=true)
	private MemberDAO dao;

	@RequestMapping(method=RequestMethod.POST) //post방식으로 호출되었을때만 실행된다.
	/*public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {*/
	public ModelAndView execute(@RequestParam("em") String email,
								@RequestParam("pw") String password,
								HttpSession session  ){
		ModelAndView mav = new ModelAndView();
		System.out.println("작동");
		//Model : request에 저장될 attribute
		//view : viewer용 jsp
		
		/*String id = request.getParameter("id");
		String password = request.getParameter("pwd");*/

		String msg ="로그인 성공";
		//session = request.getSession();
		session.removeAttribute("loginInfo");
	
		try {
			System.out.println("###### try");
			service.login(email, password);	
			Member m = dao.selectByEmail(email);
			System.out.println("member......: " + m);
			session.setAttribute("loginInfo", m);			
		} catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
		}

		mav.addObject("msg", msg);
		String url = "/loginResult.jsp";
		mav.setViewName(url);
		
		return mav;
	}

}
