package com.green.project;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import criForMember.PageMaker;
import criForMember.SearchCriteria;
import service.MemberService;
import service.QABoardService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberService service;
	
	@Autowired
	QABoardService serviceQA;
	
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}

	
	@RequestMapping(value = "/addMovieMenu")
	public ModelAndView addMovieMenu(ModelAndView mv) {
		
		mv.setViewName("edit/addMovieMenu");
		
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact(ModelAndView mv) {
		
		mv.setViewName("contact/contact");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "/qaAnswerMenu")
	public ModelAndView qaAnswerMenu(ModelAndView mv, criForBoard.SearchCriteria cri, criForBoard.PageMaker pageMaker) {

		cri.setSnoEno();
		
		mv.addObject("newQa",serviceQA.searchNewList(cri));
		
		pageMaker.setCri(cri);
		

		pageMaker.setTotalRowCount(serviceQA.searchNewRowsCount(cri));

		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("edit/qaAnswerMenu");
		
		return mv;
	} //bcplist 
	
	
	

	
	@RequestMapping(value = "/memberUpdateMenu")
	public ModelAndView memberUpdateMenu(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		// 1) Criteria 처리
		cri.setSnoEno();
		// 2) 서비스 처리
		mv.addObject("memberList",service.searchList(cri));
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("edit/memberUpdateMenu");
		return mv;
	} 
	
	
	
}
