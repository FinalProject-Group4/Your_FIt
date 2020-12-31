package com.kh.yourfit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yourfit.member.model.service.MemberService;
import com.kh.yourfit.member.model.vo.Member;


@SessionAttributes(value = { "member" })
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/login.do")
	public String login_page() {

		return "member/login";
	}
	
	@RequestMapping("/member/login_action.do")
	public ModelAndView login_action( @RequestParam String userId, @RequestParam String userPwd) {
		
		ModelAndView mv = new ModelAndView();
		
		String loc= "/";
		String msg= "";
		
		Member m = memberService.selectOneMember(userId);
		
		if (m == null) {
			msg = "존재하지 않는 아이디 입니다.";
		}  else {
			if (userPwd.equals(m.getM_Pwd())) {
				msg = "로그인에 성공하였습니다.";
				mv.addObject("member",m);
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}

	@RequestMapping("/member/Logout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		if ( !sessionStatus.isComplete() ) {
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
}