package com.green.project;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import VO.MemberVO;

import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/nickNameCheck")
	public @ResponseBody String nickNameCheck(MemberVO vo) {
		String check="";	
		
		if (service.searchNickname(vo) != null) check="n"; 
		else check="y";
		
		return check;
	}
	
	@RequestMapping(value = "/idCheck")
	public @ResponseBody String idCheck(MemberVO vo) {
		String check="";	
	
		if (service.selectOne(vo) != null) check="n"; 
		else check="y";
		
		return check;
	}
	
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
	public ModelAndView join(ModelAndView mv, MemberVO vo,@RequestParam("domain")String domain) {
		
		domain = vo.getEmail()+"@"+domain;

		vo.setEmail(domain);
		
		if(service.insert(vo)>0) {
			
			mv.addObject("message", "회원가입에 성공했습니다.");
			mv.setViewName("home");
			
		}else {
			mv.addObject("message", "회원가입에 실패했습니다.");
			mv.setViewName("home");
			
		}
		return mv;
	}

	
}
