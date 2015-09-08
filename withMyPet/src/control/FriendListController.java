package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vo.Friend_list;
import vo.Member;
import dao.FriendDAO;


@Controller("/friendlist.do")
public class FriendListController {
	@Autowired
	FriendDAO dao;
	
	@RequestMapping
	public ModelAndView execute(
			@RequestParam(required = false, value = "email") String email,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Friend_list> fl = new ArrayList<Friend_list>();
		Member my = (Member) session.getAttribute("loginInfo");
		System.out.println("my : " + my);
		String myemail = my.getE_mail();
		 System.out.println("이것이 진짜 myemail : " + myemail + "email: " + email);

		String url = "/friendlistResult.jsp";
		try {
			fl = dao.selectFriend(myemail);
			System.out.println("controller fl값 : " + fl);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// mav.addObject("fl", fl);
		mav.addObject("fl", fl);

		// mav.addObject("fl2", "hi");
		mav.setViewName(url);
		return mav;
	}

}
// @Controller("/friendlist.do")
// public class FriendListController implements Controller{
// private FriendDAO dao;
// public FriendListController(){
// dao = new FriendDAOOracle();
// }
//
// @RequestMapping
// public String execute(HttpServletRequest request,
// HttpServletResponse response) {
// HttpSession session = request.getSession();
// ArrayList<Friend_list> fl = new ArrayList<Friend_list>();
// Member my = (Member) session.getAttribute("loginInfo");
// System.out.println("my : " + my);
// String myemail = my.getE_mail();
// //System.out.println("myemail : " + myemail + "email: " + email);
//
// String url = "/friendlistResult.jsp";
// try {
// fl = dao.selectFriend(myemail);
// System.out.println("controller fl값 : "+ fl);
//
// } catch (Exception e) {
// e.printStackTrace();
// }
//
// request.setAttribute("fl","test!!");
// return url;
// }
//
// @Override
// public Class<? extends Annotation> annotationType() {
// // TODO Auto-generated method stub
// return null;
// }
//
// @Override
// public String value() {
// // TODO Auto-generated method stub
// return null;
// }

// }
