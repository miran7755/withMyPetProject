package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import vo.Pet;
import dao.PetDAO;

@Controller("/deletepet.do")
public class DeletePetController {

	@Autowired
	PetDAO dao;

	@RequestMapping
	public ModelAndView handleRequest(@RequestParam("petNo") int petNo,HttpSession session)
	{
		System.out.println("DeletePetController 동작");
		ModelAndView mav = new ModelAndView();
		String url = "/viewPet.jsp";		
		Member member = (Member) session.getAttribute("loginInfo");
		ArrayList<Pet> petList;
		dao.deleteByPetNo(petNo);
		petList = dao.selectByEmail(member.getE_mail());
		mav.addObject("petList", petList);
		//System.out.println("email="+member.getE_mail());
		System.out.println("petlist="+petList);
		
		mav.setViewName(url);
		return mav;

	}

}
