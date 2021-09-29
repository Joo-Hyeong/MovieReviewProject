package com.green.project;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import VO.MemberVO;
import criForMember.PageMaker;
import criForMember.SearchCriteria;
import service.MemberService;
import service.RatingService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	RatingService serviceR ;
	
	int count=0;
	
	// memberUpdate
	@RequestMapping(value = "/memberUpdate")
	public ModelAndView memberUpdate(ModelAndView mv, MemberVO vo, HttpServletRequest request){
			
		
		if (service.updateExceptPassword(vo)>0) {
			mv.addObject("success", "T");
		}else {
			mv.addObject("success", "F");
		}
		
		mv.setViewName("jsonView");
		
		return mv;

	} // memberUpdate
	
	
	
	
	@RequestMapping(value = "/memberUpdateF")
	public ModelAndView memberUpdateF(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
		
		vo= service.selectOne(vo);

		if(vo!=null) {
			mv.addObject("member",vo);			
		}
		
		mv.setViewName("member/memberUpdateF");
		return mv;
		
	}
	
	@RequestMapping(value = "/memberList")
	public ModelAndView mcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		// 1) Criteria 처리
		cri.setSnoEno();
		// 2) 서비스 처리
		mv.addObject("memberList",service.searchList(cri));
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("member/memberList");
		return mv;
	} 
	
	@RequestMapping(value = "/mupdatef")
	public ModelAndView mupdatef(ModelAndView mv,MemberVO vo) {
		mv.addObject("Apple", service.selectOne(vo));
		mv.setViewName("myInfo/mUpdateForm");
		return mv;
	}
	
	@RequestMapping(value = "/newpassf")
	public ModelAndView newpassf(ModelAndView mv,MemberVO vo) {
		mv.addObject("Apple", service.selectOne(vo));
		mv.setViewName("myInfo/changePWForm");
		return mv;
	}
	
	@RequestMapping(value = "/mdetail")
	public ModelAndView mdetail(HttpServletRequest request, ModelAndView mv, MemberVO vo) {

		HttpSession session = request.getSession(false);
		if (session!=null && session.getAttribute("loginID") !=null) {
			vo.setId((String)session.getAttribute("loginID"));

			if  (request.getParameter("id")!=null) vo.setId(request.getParameter("id"));

			vo=service.selectOne(vo);
			if (vo!=null) {
				if ("U".equals(request.getParameter("jcode"))) { 
					int indexofAt = vo.getEmail().indexOf("@");
					mv.addObject("Email",vo.getEmail().substring(0,indexofAt));
					mv.addObject("Domain",vo.getEmail().substring(indexofAt+1,vo.getEmail().length()));
					mv.setViewName("myInfo/mUpdateForm");
				}else {
					mv.setViewName("myInfo/myDetail");
				}
				mv.addObject("Apple", vo);
			}else {
				mv.addObject("message","~~ 정보를 찾을 수 없습니다, 로그인 후 이용하세요 ~~");
				mv.setViewName("member/loginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","~~ 로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //mdetail
	

	
	
	// ** Update
	@RequestMapping(value = "/mupdate")
	public ModelAndView mupdate(HttpServletRequest request, ModelAndView mv, 
						MemberVO vo, RedirectAttributes rttr) throws IOException {
		
		String domain = request.getParameter("domain");
		if(domain!=null) {
			domain = vo.getEmail()+"@"+domain;
			vo.setEmail(domain);
		}
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 정보 수정 성공 ~~");
			mv.setViewName("redirect:myinfo");
		}else {
			rttr.addFlashAttribute("message", "~~ 정보수정 오류, 다시 하세요 ~~");
			mv.setViewName("redirect:mdetail?id="+vo.getId()+"&jcode=U");
		}
		return mv;
	} //mupdate
	
	@RequestMapping(value = "/mlist")
	public ModelAndView mlist(ModelAndView mv) {

		List<MemberVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("myInfo/memberList");
		return mv;
	} 
	
	@RequestMapping(value = "/mdelete")
	public ModelAndView jsdelete(ModelAndView mv, MemberVO vo) {
		
		if (service.delete(vo) > 0) {
			mv.addObject("success", "T");
		}else {
			mv.addObject("success", "F");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/mDelete")
	public ModelAndView mdelete(ModelAndView mv, MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (service.delete(vo) <= 0) {
			mv.setViewName("myInfo/mDelete");
		} else {
			session.invalidate();
			mv.setViewName("redirect:home");
			
		}
		
		return mv;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv) {
		
		HttpSession session = request.getSession(false);
		
		if(session!=null) {
			session.invalidate();
		}
	
		mv.setViewName("redirect:home");
		return mv;
	}
	
	@RequestMapping(value = "/mdeleteF")
	public ModelAndView mdeleteF(ModelAndView mv,MemberVO vo) {
		mv.addObject("Apple", service.selectOne(vo));
		mv.setViewName("myInfo/mDelete");
		
		return mv;
	}
	
	@RequestMapping(value = "/loginF")
	public ModelAndView loginF(ModelAndView mv) {
		
		mv.setViewName("member/loginForm");
		
		return mv;
	}
	
	@RequestMapping(value = "/loginSimpleF")
	public ModelAndView loginSimple(ModelAndView mv) {
		
		mv.setViewName("member/loginSimpleF");
		
		return mv;
	}
	@RequestMapping(value = "/findPassF")
	public ModelAndView findPassF(ModelAndView mv) {
		
		mv.setViewName("member/findPassForm");
		
		return mv;
	}
	
	@RequestMapping(value = "/findPass")
	public ModelAndView findPass(ModelAndView mv,MemberVO vo) {
		
		if(service.authRequest(vo)!=null) {
			count=0;
			mv.addObject("check", "T");
			mv.addObject("id", vo.getId());
		}else {
			count++;
			mv.addObject("check", "F");
			mv.addObject("count", count);
		}
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping(value = "/myinfo")
	public ModelAndView myinfo(ModelAndView mv) {
		
		mv.setViewName("member/myinfo");
		
		return mv;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
		
	
		String password = vo.getPassword();
		
		vo= service.selectOne(vo);

		if(vo!=null) {
			 
			if(passwordEncoder.matches(password, vo.getPassword())) {
			
				HttpSession session = request.getSession();
				session.setAttribute("loginID", vo.getId());
				session.setAttribute("loginNickName", vo.getNickName());
				mv.addObject("check",'T');			
			}
		
		}
		
		mv.setViewName("jsonView");
		return mv;
		
	}
	
	
	
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
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		if(service.insert(vo)>0) {
			
			mv.addObject("message", "회원가입에 성공했습니다.");
			mv.setViewName("home");
			
		}else {
			mv.addObject("message", "회원가입에 실패했습니다.");
			mv.setViewName("home");
			
		}
		return mv;
	}

	@RequestMapping(value = "/editF")
	public ModelAndView editF(ModelAndView mv) {
		
		mv.setViewName("edit/editF");
		
		return mv;
	}
	
}
