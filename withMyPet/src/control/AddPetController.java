package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;

@Controller("/addpet.do")
public class AddPetController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping
	public ModelAndView handleRequest(
			@RequestParam(required=false,value="petName") String petName,
			@RequestParam(required=false,value="kindName") String kindName,
			@RequestParam(required=false,value="gender") String gender,
			@RequestParam(required=false,value="image") String image
			
			,HttpSession session) throws Exception {
		
		
		Member b = new Member();
		b = (Member)session.getAttribute("loginInfo");
		
		System.out.println("petName="+petName+" "+"kindName="+kindName+" "+ "gender="+gender+" "+"email="+b.getE_mail() +"image=" +image);
		//arg0.setCharacterEncoding("UTF-8");
		
		
		System.out.println("AddPetController의 handleRequest()호출");
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","추가 완료!");
		
		mav.setViewName("/AddPet.jsp");
		return mav;
	}
}
