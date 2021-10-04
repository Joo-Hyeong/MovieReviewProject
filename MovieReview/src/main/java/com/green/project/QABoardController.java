package com.green.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import VO.QABoardVO;
import criForBoard.PageMaker;
import criForBoard.SearchCriteria;
import oracle.net.aso.m;
import service.QABoardService;


@Controller
public class QABoardController {

	@Autowired
	QABoardService service;
	
	

	
	
	
	// ** QA_Board PageList
	@RequestMapping(value = "/qalist")
	public ModelAndView bcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {

		cri.setSnoEno();
		mv.addObject("Banana",service.searchList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("board/qaList");
		
		return mv;
	} //bcplist 
	
	
	// ** 답글달기
	@RequestMapping(value = "/replyf")
	public ModelAndView replyf(ModelAndView mv, QABoardVO vo, @RequestParam("adminMod") String adminMod) {

		if("Y".equals(adminMod)) {
			mv.addObject("adminMod", "Y");
		}
		
		mv.addObject("qABoardVO", vo);
		mv.setViewName("board/replyForm");
		return mv;
	} //replyf 
	
	
	@RequestMapping(value = "/reply")
	public ModelAndView reply(ModelAndView mv, QABoardVO vo, RedirectAttributes rttr, @RequestParam("adminMod") String adminMod) {
		
		int seq = vo.getSeq();
		
		vo.setStep(vo.getStep()+1);
		vo.setIndent(vo.getIndent()+1);
		

		if (service.replyInsert(vo) > 0) {
				// 답글 입력 성공
			
			// vo에 원글 번호 넣고 답글 여부를 N에서 Y로 바꿈.
			vo.setSeq(seq);
			vo=service.selectOne(vo);
			service.updateNtoY(vo);

		}

			mv.setViewName("redirect:qalist");

		return mv;
	} //reply 
	
	@RequestMapping(value = "/qaUpdate")
	public ModelAndView memberUpdate(ModelAndView mv, QABoardVO vo, HttpServletRequest request){

		service.update(vo);

		
		mv.setViewName("redirect:qalist");

		return mv;

	}

	@RequestMapping(value = "/qadetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, 
			QABoardVO vo, RedirectAttributes rttr) {
		

		String loginID = null;
		HttpSession session = request.getSession(false);
		
		String adminMod = request.getParameter("adminMod");

		if (session != null && session.getAttribute("loginID") != null) 
			loginID = (String)session.getAttribute("loginID");
		// 글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 다른경우에만 조회수 증가
		if( !vo.getId().equals(loginID) || loginID == null )
			service.countUp(vo) ;
			
		// 글내용 조회
		vo = service.selectOne(vo);
		if (vo != null) {
		
			request.setAttribute("Apple", vo);
			// 글 수정 하기의 경우 
			if ("U".equals(request.getParameter("jcode"))) {
				mv.setViewName("board/qaUpdateForm");
			}else mv.setViewName("board/qaBoardDetail");  
		}else {
			rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 글을 찾을 수 없습니다 ~~");
			mv.setViewName("redirect:qalist"); 
		}
	
		if("Y".equals(adminMod)) {
			mv.addObject("adminMod", "Y");
		}
		
		return mv;
	} //qadetail

	// ** 새글등록
	@RequestMapping(value = "/qainsertf")
	public ModelAndView qainsertf(ModelAndView mv) {
		mv.setViewName("board/qaInsertForm");
		return mv;
	} //qainsertf
	
	@RequestMapping(value = "/qainsert")
	public ModelAndView qainsert(ModelAndView mv, QABoardVO vo, RedirectAttributes rttr) {

		if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 새글 등록 성공 ~~");
			mv.setViewName("redirect:qalist"); 
		}else {
			mv.addObject("message", "~~ 새글 등록 실패 !! 다시 하세요 ~~");
			mv.setViewName("board/qainsertForm");
		}
		return mv;
	} //qainsert	

	
	@RequestMapping(value = "/qadelete")
	public ModelAndView bdelete(ModelAndView mv, QABoardVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글삭제 성공 ~~");
			mv.setViewName("redirect:qalist");
		}else {
			rttr.addFlashAttribute("message", "~~ 글삭제 실패 !!! 다시 하세요 ~~");
			mv.setViewName("redirect:qadetail?seq="+vo.getSeq());
		}
		return mv;
	} //qadelete	

} // class
