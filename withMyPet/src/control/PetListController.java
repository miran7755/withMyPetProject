package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import vo.Pet;
import dao.PetDAO;

@Controller("/viewpet.do")
public class PetListController {

	@Autowired(required = true)
	PetDAO dao;

	@RequestMapping
	public ModelAndView execute(HttpSession session) {		
		ArrayList<Pet> petList = new ArrayList<Pet>();
		Member b= new Member();
		b= (Member)session.getAttribute("loginInfo");
		petList= dao.selectByEmail(b.getE_mail());		
		ModelAndView mav = new ModelAndView();
		mav.addObject("petlist",petList);
		String url="viewPet.jsp";
		mav.setViewName(url);
		return mav;
	}
}
