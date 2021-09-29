package com.green.project;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.CalendarService;
import VO.CalendarVO;

@Controller
public class CalendarController {

	@Autowired
	@Qualifier("calendar")
	private CalendarService service;
	

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/calendarF")
	public ModelAndView calendarMain(HttpServletRequest request, ModelAndView mv, 
			CalendarVO vo, ArrayList<CalendarVO> alist) {
		// List<CalendarVO> avo
		// => List 는 interface 이기 때문에 매개변수로 사용시에는 Exception발생
		//    직접 선언해서 사용 해야함 : List<CalendarVO> avo = new ArrayList<CalendarVO>();
		
		String id= null;
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("loginID")!=null && session!=null) {
			id=(String)session.getAttribute("loginID");
		}else {
			
			mv.setViewName("member/loginForm");
			return mv;
		}
		

		if (id != null) {
			vo.setCaid(id);
			alist =(ArrayList)service.selectList(vo);
			int size = service.listCount(vo);
			mv.addObject("size", size);
			mv.addObject("logIDcalendar", alist);
//			System.out.println("calendarMain size=>" + size);
//			System.out.println("calendarMain avo=>" + avo.get(0));

		}
		
		mv.setViewName("calendar/calendarF");
		return mv;
	}

	@RequestMapping(value = "/calendarInsert")
	public ModelAndView calendarInsert(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		
		System.out.println("** calendarInsert id => "+vo.getCaid());
		System.out.println("** calendarInsert id.length => "+vo.getCaid().length());
		String id = vo.getCaid().replaceAll(" ", null);
		System.out.println("** calendarInsert id.length => "+id.length());
		
		if (vo.getCaid() != null) {
			if (service.insert(vo) > 0 ) mv.addObject("fCode", "200"); // 입력성공
			else mv.addObject("fCode", "201"); // 입력실패
		} else mv.addObject("fCode", "202");  // 입력 Id = null
		
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "/calendarUpdate")
	public ModelAndView calendarUpdate(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
	 
		System.out.println("** CalendarUpdate vo => "+vo);
		if (vo.getCaid() != null) {
			if (service.update(vo) > 0 ) mv.addObject("fCode", "200"); // 입력성공
			else mv.addObject("fCode", "201"); // 입력실패
		} else mv.addObject("fCode", "202");  // 입력 Id = null
		
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "calendarDelete")
	public ModelAndView calendarDelete(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		
		if (vo.getCaid() != null) {
			if (service.delete(vo) > 0 ) mv.addObject("fCode", "200"); // 입력성공
			else mv.addObject("fCode", "201"); // 입력실패
		} else mv.addObject("fCode", "202");  // 입력 Id = null
		
		mv.setViewName("jsonView");
		return mv;
	}
} // class
