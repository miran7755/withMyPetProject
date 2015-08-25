package control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//hello.do가 요청이 들어오면 컨트롤러가 자동으로 불러와진다
//@org.springframework.stereotype.Controller("/hello.do")
@org.springframework.stereotype.Controller("/hello.do")
public class HelloController{
	@RequestMapping
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		System.out.println("HelloController의 handleRequest()호출");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/hello.jsp");
		return mav;
	}
	
	
}
