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
		m.setE_mail(email);
		m.setNickname(nickname);
		m.setPassword(password);
		
		//String name = request.getParameter("name");
		//String zip_idx = request.getParameter("zip_idx");
		//System.out.println("zip_idx =" + zip_idx);
		//String address = request.getParameter("address");
		//Zip zip = new Zip(); 
		//zip.setIdx(idx);
		//c.setZip(zip);
		//String gender = request.getParameter("gender");
		//String birthYear = request.getParameter("birthYear");
		//String birthMonth = request.getParameter("birthMonth");
		//String birthDay = request.getParameter("birthDay");
		//int idx = Integer.parseInt(zip_idx);
		//String birth_date = year + month + day;
		//c.setBirth_date(birth_date);
		String url = "/signupResult.jsp";
		String msg = "";
		ModelAndView mav = new ModelAndView();
		 msg = "가입이 완료되었습니다. 로그인하세요. ^^ㅋㅋㅋㅋㅋㅋㅋㅋㅋ";
		 dao.insert(m);
		 mav.addObject("msg", msg);
		 mav.setViewName(url);
		return mav;
	}
}
