package control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("/addpet.do")
public class AddPetController {
	@RequestMapping
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		
		arg0.setCharacterEncoding("UTF-8");
		System.out.println("AddPetController의 handleRequest()호출");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/AddPet.jsp");
		return mav;
	}
}
