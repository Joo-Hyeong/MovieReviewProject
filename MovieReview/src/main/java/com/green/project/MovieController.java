package com.green.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ActorService;
import service.MovieService;
import VO.ActorVO;
import VO.MovieVO;


@Controller
public class MovieController {
	
	@Autowired
	MovieService service ;
	@Autowired
	ActorService service2 ;
	
	

	@RequestMapping(value = "/mvlist")
	public ModelAndView mlist(ModelAndView mv) {

		List<MovieVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("movie/movieList");
		return mv;
	} //mlist

	@RequestMapping(value = "/mvdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, 
			MovieVO vo, RedirectAttributes rttr, ActorVO avo) {
		
		vo = service.selectOne(vo);
		if (vo != null) {
			request.setAttribute("Apple", vo);
			
			
			List<ActorVO> avos = service2.selectOne(avo);
			
		if( avos != null) request.setAttribute("Banana", avos);
			mv.setViewName("movie/movieDetail");
		}else {
			rttr.addFlashAttribute("message", "~~ 영화를 찾을 수 없습니다 ~~");
			mv.setViewName("redirect:mvlist"); 
		}
		return mv;
	} //mvdetail

} //class
