package com.green.project;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.ActorService;
import service.MovieService;
import service.RatingService;
import service.WishService;
import VO.ActorVO;
import VO.MovieVO;
import VO.RatingVO;
import VO.WishVO;




@Controller
public class MovieController {
	
	@Autowired
	MovieService service ;
	@Autowired
	ActorService serviceA ;
	@Autowired
	RatingService serviceR ;
	@Autowired
	WishService serviceW ;
	

	
	@RequestMapping(value = "/editMovie")
	public ModelAndView editMovie(ModelAndView mv, MovieVO mvo, ActorVO avo,HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		String realPath= request.getRealPath("/");
		
//		이부분은 창우씨꺼에서는 고쳐야합니다!
		if(realPath.contains(".eclipse.")) {
			realPath = "/Users/leejoohyeoung/IdeaProjects/eclipse/ProjectFolder/MovieReviewProject/MovieReview/src/main/webapp/resources/posterImage/";	
		}else {
			realPath += "resources/posterImage/";	
		}
		
//		이부분은 창우씨꺼에서는 고쳐야합니다!
//		if(realPath.contains(".eclipse.")) {
//			realPath = "C:/MTest/MyWork/MovieReviewProject/MovieReview/src/main/webapp/resources/posterImage/";	
//		}else {
//			realPath += "resources/posterImage/";	
//		}
		
		
		File f1= new File(realPath);
		if (!f1.exists()) f1.mkdir();
		
		String file1, file2 ="";
		MultipartFile posterfilef = mvo.getPosterfilef();
		
		if(posterfilef != null && !posterfilef.isEmpty()) {
			
			file1= realPath+ posterfilef.getOriginalFilename();
			posterfilef.transferTo(new File(file1));
			file2= "resources/posterImage/"+posterfilef.getOriginalFilename();	
		}
		
		mvo.setPosterfile(file2);
		
		String[] actor = request.getParameterValues("actor");
	
		
		if(service.update(mvo)>0) {
			
			// 방금 insert한 movie의 movie_num을 찾음
			mvo=service.findMovieNum(mvo);
			
			avo.setMovie_num(mvo.getMovie_num());
			
			for(int i=0 ; i<actor.length ; i++) {
				avo.setActor(actor[i]);
				serviceA.update(avo);
			}
			
			mv.addObject("message","영화수정에 성공했습니다.");
			
			
		}else {

			mv.addObject("message","영화수정에 실패했습니다.");
			
		}
		
		mv.setViewName("edit/editF");
		return mv;
	}
	
	
	@RequestMapping(value = "/movieEditF")
	public ModelAndView movieEditF(ModelAndView mv, MovieVO mvo, ActorVO avo, criForRating.PageMaker pageMaker, criForRating.SearchCriteria cri) {


			mvo = service.selectOne(mvo);
	      if (mvo != null){ mv.addObject("Movie", mvo);
	      } else mv.addObject("message", "해당 영화를 찾을 수 없습니다.");  
	         
	       List<ActorVO> avos = serviceA.selectListActs(avo);
	      if( avos != null)  mv.addObject("Actors", avos);
		      
	      cri.setSnoEno();
	      
	    
			mv.addObject("ratingVoList",serviceR.searchList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRowCount(serviceR.searchRowsCount(cri));
			
			mv.addObject("pageMaker",pageMaker);
			mv.setViewName("movie/movieEditF");
			return mv;
	
	} //mvdetail
	
	@RequestMapping(value = "/movieAdd")
	public ModelAndView movieAdd(ModelAndView mv, MovieVO mvo, ActorVO avo,HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		String realPath= request.getRealPath("/");
		
// 		주형
		if(realPath.contains(".eclipse.")) {
			realPath = "/Users/leejoohyeoung/IdeaProjects/eclipse/ProjectFolder/MovieReviewProject/MovieReview/src/main/webapp/resources/posterImage/";	
		}else {
			realPath += "resources/posterImage/";	
		}
		
//		이부분은 창우씨꺼에서는 고쳐야합니다!	
//		if(realPath.contains(".eclipse.")) {
//			realPath = "/C:/MTest/MyWork/ProjectFolder/MovieReviewProject/MovieReview/src/main/webapp/resources/posterImage/";	
//		}else {
//			realPath += "resources/posterImage/";	
//		} 
		
		
		File f1= new File(realPath);
		if (!f1.exists()) f1.mkdir();
		
		String file1, file2 ="";
		MultipartFile posterfilef = mvo.getPosterfilef();
		
		if(posterfilef != null && !posterfilef.isEmpty()) {
			
			file1= realPath+ posterfilef.getOriginalFilename();
			posterfilef.transferTo(new File(file1));
			file2= "resources/posterImage/"+posterfilef.getOriginalFilename();	
		}
		
		mvo.setPosterfile(file2);
		
		String[] actor = request.getParameterValues("actor");
	
		
		if(service.insert(mvo)>0) {
			
			// 방금 insert한 movie의 movie_num을 찾음
			mvo=service.findMovieNum(mvo);
			
			avo.setMovie_num(mvo.getMovie_num());
			
			for(int i=0 ; i<actor.length ; i++) {
				avo.setActor(actor[i]);
				serviceA.insert(avo);
			}
			
			mv.addObject("message","영화추가에 성공했습니다.");
			mv.setViewName("edit/editF");
			
		}else {

			mv.setViewName("edit/movieAdd");
			
		}

		return mv;
	}
	
	@RequestMapping(value = "/movieAddF")
	public ModelAndView movieAddF(ModelAndView mv) {
		
		mv.setViewName("edit/movieAdd");
		
		return mv;
	}

	@RequestMapping(value = "/mvlist")
	public ModelAndView mlist(ModelAndView mv,HttpServletRequest request) {
		String orderID = request.getParameter("orderID");
		if("random".equals(orderID)) {
			
			List<MovieVO> list = service.selectListRandom();
			if (list != null) mv.addObject("Banana", list);
			
		}else if("rating".equals(orderID)) {
			
			List<MovieVO> list = service.selectListRate();
			if (list != null) mv.addObject("Banana", list);
			
		} else if("new".equals(orderID)){
			
			List<MovieVO> list = service.selectListNew();
			

			if (list != null&&!(list.isEmpty())) {
					mv.addObject("Banana", list);
					mv.addObject("newMovie","T");
			}else{
					mv.addObject("message","최신영화가 없습니다.");
				}
				
		}
		
		mv.setViewName("movie/movieList2");
		return mv;
	} //mlist
	
	@RequestMapping(value = "/mvdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, MovieVO mvo, ActorVO avo, WishVO wvo, 
			criForRating.PageMaker pageMaker, criForRating.SearchCriteria cri, RatingVO rvo) {
			
			mvo = service.selectOne(mvo);
			//Wish에 저장돼있는지 확인 => 저장되어있으면 mvo.setLike("T"); 아니면 mvo.setLike("F");
			HttpSession session = request.getSession(false); 
			if(session!=null && session.getAttribute("loginID")!=null) {
				wvo.setId((String)session.getAttribute("loginID"));
				
				if(serviceW.selectOne(wvo) != null) {
					mvo.setLike("T");
				}else {
					mvo.setLike("F");
					
				}
				
			}
			
	      if (mvo != null){ mv.addObject("Movie", mvo);
	      } else mv.addObject("message", "해당 영화를 찾을 수 없습니다.");  
	         
	       List<ActorVO> avos = serviceA.selectListActs(avo);
	      if( avos != null)  mv.addObject("Actors", avos);
		      
	      cri.setSnoEno();
	      
	      if(serviceR.searchList(cri)!=null&&!(serviceR.searchList(cri).isEmpty())) {  
	    	  mv.addObject("ratingVoList",serviceR.searchList(cri));
	      }
			
			pageMaker.setCri(cri);
			pageMaker.setTotalRowCount(serviceR.searchRowsCount(cri));
			
			mv.addObject("pageMaker",pageMaker);

			int rating = serviceR.ratingAverage(rvo);
			
			if(rating == 0) {
				mv.addObject("rating", "아직 등록된 평점이 없습니다." );
			}else {
				mv.addObject("rating", rating+" 점");
			}
			

			mv.setViewName("movie/movieDetail");
			return mv;
	
	} //mvdetail
	
	
	
	
	
	@RequestMapping(value = "/search")
	public ModelAndView search(ModelAndView mv,criForSearch.SearchCriteria cri, criForSearch.PageMaker pageMaker) {

		cri.setSnoEno();
		
			mv.addObject("movieList",service.searchList(cri));
		
			pageMaker.setCri(cri);

			pageMaker.setTotalRowCount(service.searchRowsCount(cri));

			mv.addObject("pageMaker",pageMaker);	
			
			mv.addObject("message","총 "+service.searchRowsCount(cri)+"개의 영화를 찾았습니다.");
	
		mv.setViewName("movie/searchF");
		
		return mv;

	}
	

	
} //class
