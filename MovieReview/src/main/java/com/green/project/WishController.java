package com.green.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import VO.MemberVO;
import VO.MovieVO;
import VO.RatingVO;
import VO.WishVO;
import service.MemberService;
import service.MovieService;
import service.WishService;

@Controller
public class WishController {
	
	@Autowired
	MemberService service;	
	@Autowired
	MovieService serviceM;
	@Autowired
	WishService serviceW;
	

	@RequestMapping(value = "/winsert")
	public ModelAndView winsert(ModelAndView mv,WishVO wvo) {
		
		
		if(serviceW.selectOne(wvo) != null) {
			// 이미 목록에 있을 경우 삭제
			if(serviceW.delete(wvo)>0) {
				mv.addObject("successDel","T");
			
			}
			
		}else {
			// 목록에 없을 경우 등록
			if(serviceW.insert(wvo)>0) {
				mv.addObject("successIn","T");
			
			}
			
		}
	
		mv.setViewName("jsonView");
		return mv;
	}//winsert
	
	@RequestMapping(value = "/wishlist")
	public ModelAndView wishlist(ModelAndView mv,MemberVO vo,MovieVO mvo,HttpServletRequest request,
			criForWish.PageMaker pageMaker,criForWish.SearchCriteria cri) {
		
		String orderID = request.getParameter("orderID");
		
		vo = service.selectOne(vo);
		
		if (vo != null){ 
			
			mv.addObject("Apple", vo);
			
			
		} else {

			
			mv.addObject("messageHome", "로그인 후 이용가능합니다.");
		}
		
		cri.setSnoEno();
		pageMaker.setCri(cri);
		
		List<WishVO> listW = serviceW.searchList(cri);
		
		if(listW.isEmpty()) {
			mv.addObject("messageHome", "찜 목록에 등록된 영화가 없습니다.");
		}else {
			pageMaker.setTotalRowCount(serviceW.searchRowsCount(cri));
		
			mv.addObject("pageMaker",pageMaker);
			
			List<MovieVO> listM = new ArrayList<MovieVO>();
		for(int i=0;i<listW.size();i++) {
			mvo.setMovie_num(listW.get(i).getMovie_num());
			listM.add(serviceM.selectOne(mvo));    
		}
		
		mv.addObject("Banana", listM);
		
		
		}
		
		
		
		if("wish".equals(orderID)) 
			 mv.setViewName("movie/movieList");
		else mv.setViewName("myInfo/wishList");
		
		
		return mv;
	}//wishlist
	
//	@RequestMapping(value = "/wdelete")
//	public ModelAndView wdelete(ModelAndView mv,WishVO wvo) {
//		if(serviceW.delete(wvo)>0) {
//			mv.addObject("message","삭제 성공");
//		} else {
//			mv.addObject("message","삭제 실패");
//		}
//		mv.setViewName("jsonview");
//		return mv;
//	}//winsert
	
	@RequestMapping(value = "/wdelete")
	public ModelAndView rdelete(ModelAndView mv,WishVO wvo,HttpServletRequest request ) {
		String chk[] = request.getParameterValues("chk[]");
		
		wvo.setId((String)request.getSession().getAttribute("loginID"));
		for(String s:chk) {
			wvo.setMovie_num(Integer.parseInt(s));
			serviceW.delete(wvo);
		}
		
		mv.setViewName("redirect:myinfo");
		return mv;
	}//rdelete
	
}
