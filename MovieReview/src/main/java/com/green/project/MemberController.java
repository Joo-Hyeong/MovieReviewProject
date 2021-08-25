package com.green.project;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import VO.MemberVO;

import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	

	
	@RequestMapping(value = "/joinA")
	public ModelAndView joinA(ModelAndView mv) {
		
		mv.setViewName("member/joinA");
		
		return mv;
	}
	
	@RequestMapping(value = "/joinF")
	public ModelAndView joinf(ModelAndView mv) {
		
		mv.setViewName("member/joinForm");
		
		return mv;
	}
	

	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, MemberVO vo) {
		
		
		if(service.insert(vo)>0) {
			
			mv.addObject("message", "회원가입에 성공했습니다.");
			mv.setViewName("member/loginForm");
			
		}else {
			mv.addObject("message", "회원가입에 실패했습니다.");
			mv.setViewName("member/joinForm");
			
		}
		return mv;
	}

	
}
