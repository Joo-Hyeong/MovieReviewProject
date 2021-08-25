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
import VO.PageVO;
import VO.ActorVO;
import VO.MovieVO;


@Controller
public class MovieController {
	
	@Autowired
	MovieService service ;
	@Autowired
	ActorService service2 ;
	
	// ** Mermber PageList : PageBlock
	@RequestMapping(value = "/mvpagelist")
	public ModelAndView bpagelist(ModelAndView mv, PageVO<MovieVO> pvo) {
		// 1) Paging 준비
		// => 요청 Page 확인, sno , eno 계산 
	
		int currPage = 1;
		if (pvo.getCurrPage() > 1) currPage = pvo.getCurrPage();
		else pvo.setCurrPage(currPage);
		
		int sno = (currPage-1)*pvo.getRowsPerPage() + 1 ;
		int eno = sno + pvo.getRowsPerPage() - 1 ;
		pvo.setSno(sno);
		pvo.setEno(eno);
		
		// 2) Service 처리
		// => List 읽어오기, 전체Row수(totalRowCount) 
		// => 전체 PageNo 계산하기
		pvo=service.pageList(pvo); // 대입문은 없어도 가능 (pvo는 참조형이므로)
		
		int totalPageNo = pvo.getTotalRowCount()/pvo.getRowsPerPage();
		if ( pvo.getTotalRowCount()%pvo.getRowsPerPage() !=0 )
			totalPageNo += 1;
		
		// 3) View 처리
		// => PageBlock 기능 : sPageNo, ePageNo 계산
		
		int sPageNo = ((currPage-1)/pvo.getPageNoCount())*pvo.getPageNoCount()+1;
		int ePageNo = (sPageNo + pvo.getPageNoCount()) - 1 ;
		// 계산으로 얻어진 ePageNo가 실제 LastPage 인 totalPageNo 보다 크면 수정 필요.
		if (ePageNo > totalPageNo) ePageNo = totalPageNo;
		
		mv.addObject("sPageNo", sPageNo) ;
		mv.addObject("ePageNo", ePageNo) ;
		mv.addObject("pageNoCount", pvo.getPageNoCount()) ;
		
		// view01 => currPage, totalPageNo, List 
		mv.addObject("currPage", pvo.getCurrPage());
		mv.addObject("totalPageNo", totalPageNo);
		
		if (pvo.getList() != null && pvo.getList().size() > 0) mv.addObject("Banana",pvo.getList());
		else mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		
		mv.setViewName("movie/pageMVList");
		return mv;
	} //mpagelist

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
