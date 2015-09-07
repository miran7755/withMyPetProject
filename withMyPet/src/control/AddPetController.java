package control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Member;
import vo.Pet;
import dao.PetDAO;

@Controller("/addpet.do")
public class AddPetController {

	@Autowired
	PetDAO dao;

	// HttpSession session;

	@RequestMapping
	public ModelAndView handleRequest(
			@RequestParam(required = false, value = "petName") String petName,
			@RequestParam(required = false, value = "animalCode") int animalCode,
			@RequestParam(required = false, value = "gender") String gender,
			@RequestParam(required = false, value = "image") String image,
			@RequestParam(required = false, value = "birthdate") String birthdate

			, HttpSession session) throws Exception {

		Member b = new Member();
		Pet p = new Pet();
		System.out.println("AddPetController의 handleRequest()호출");
		b = (Member) session.getAttribute("loginInfo");

		System.out.println("petName=" + petName + " " + "animalCode="
				+ animalCode + " " + "gender=" + gender + " \n " + "email="
				+ b.getE_mail() + " " + "image=" + image + " " + "");
		// arg0.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		String msg = null;
		if (!b.getE_mail().isEmpty()) {
			p.setE_mail(b.getE_mail());
			p.setName(petName);
			p.setAnimal_code(animalCode);
			p.setGender(gender);
			p.setImg(image);
			// System.out.println("STRING_birthdate=" + birthdate);

			p.setBirthdate(birthdate);

			dao.insert(p);
			msg = "추가 완료";
			System.out.println();
			mav.addObject("msg", msg);

		} else {
			msg = "추가 실패";
			mav.addObject("msg", msg);
			System.out.println("로그인 세션이 없습니다.");
		}
		mav.setViewName("/addPet.jsp");
		return mav;
	}
}
