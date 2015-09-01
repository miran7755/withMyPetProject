package control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import util.PageBean;
import vo.Post;
import dao.PostDAO;

@Controller("/boardlistview.do")
public class BoardListViewController{
	@Autowired
	private PostDAO dao;
	
	@RequestMapping
	public ModelAndView execute(@ModelAttribute ArrayList<Post> posts,
								@ModelAttribute PageBean<Post> pb,
								HttpSession session,
								@RequestParam(required=false, value="value") String value, 
								@RequestParam(required=false, value="item") String item, 
								@RequestParam(defaultValue="1", value="currentPage") int currentPage){
		System.out.println("in BoardListViewController");
		ModelAndView mav = new ModelAndView();
		String url = "";
		try {
			if(value == null || value.equals("")){//전체검색
				int cntPerPage=4;			
				posts = dao.boardSelectAll(cntPerPage, currentPage);
				int totalCnt = dao.getTotalCnt(); //총상품수얻기
				int cntPerPageGroup = 3; //페이지그룹의 페이지목록수
				pb = new PageBean<Post>(posts, totalCnt, currentPage, cntPerPage, cntPerPageGroup);
			}else if(item.equals("e_mail")){ //작성자 이메일로 찾기
				posts = dao.boardSelectByEmail(value);
				pb = new PageBean<Post>(); 
				pb.setList(posts);
			}else if(item.equals("subject")){//제목으로 찾기
				posts = dao.boardSelectBySubject("%" + value + "%");
				pb = new PageBean<Post>();
				pb.setList(posts);
			}			
			url = "/boardlistview.jsp";
			mav.addObject("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
			url = "/error.jsp";
		}	

		mav.setViewName(url);
		return mav;		
	}
}
