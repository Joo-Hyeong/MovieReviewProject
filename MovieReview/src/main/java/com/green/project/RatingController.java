package com.green.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import VO.MemberVO;

import VO.RatingVO;
import service.MemberService;
import service.RatingService;

@Controller
public class RatingController {

	@Autowired
	MemberService service;
	@Autowired
	RatingService serviceR ;
	
	
	@RequestMapping(value = "/addRating")
	public ModelAndView addRating(ModelAndView mv, RatingVO vo) {

		if(serviceR.insert(vo)>0) {
				
			mv.addObject("success", "T");
			// 원래는 디테일 페이지 그냥 보여줘야함. 나중에하기
			// 그리고 한줄평부분 최신순, 평점순, 스포일러안보기 기능 만들기
			// + 한사람이 한번만 쓸수있게만들기
		}else {
			mv.addObject("success", "F");	
		}
		
		mv.setViewName("jsonView");
		return mv;

	}
	
	@RequestMapping(value = "/myratings")
	public ModelAndView bdetail(ModelAndView mv, MemberVO vo, RatingVO rvo, 
			criForRating.PageMaker pageMaker, criForRating.SearchCriteria cri) {

		vo = service.selectOne(vo);
		if (vo != null){ mv.addObject("Apple", vo);
		} else mv.addObject("message", "ID 정보를 찾을 수 없습니다.");  
	      
		cri.setSnoEno();
    
		mv.addObject("ratingVoList",serviceR.searchList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(serviceR.searchRowsCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("myInfo/myRatings");
		return mv;
	
	} //myratings
	
	@RequestMapping(value = "/rdelete")
	public ModelAndView rdelete(ModelAndView mv,RatingVO rvo,HttpServletRequest request ) {
		String chk[] = request.getParameterValues("chk[]");
		for(String s:chk) {
			rvo.setRating_num(Integer.parseInt(s));
			serviceR.delete(rvo);
		}
		
		mv.setViewName("redirect:myinfo");
		return mv;
	}//rdelete
	
}//class
