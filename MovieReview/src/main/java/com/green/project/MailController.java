package com.green.project;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MailController {
	

	@Autowired
	private JavaMailSender mailSender;


	// ** QA_Board PageList
		@RequestMapping(value = "/mailCheck")
		public ModelAndView mailCheck(ModelAndView mv, String email)throws Exception {

			Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;

	        String title = "그린영화리뷰 인증번호";
	        String content = "그린영화리뷰 입니다. 인증번호는 "+checkNum+" 입니다.";
	        String from = "jhlee940107@gmail.com";
	        String to = email;
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	            
	            
	            /*
	             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
	             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	             */
	            
	            mailHelper.setFrom(from);
	            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	            mailHelper.setTo(to);
	            mailHelper.setSubject(title);
	            mailHelper.setText(content);
	         
	           
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        mv.addObject("checkNum", checkNum);
	        
	        mv.setViewName("jsonView");
	        
			return mv;
		} 
	
	
	
	
}
