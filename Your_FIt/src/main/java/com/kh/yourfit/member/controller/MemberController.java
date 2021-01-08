package com.kh.yourfit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yourfit.common.exception.MemberException;
import com.kh.yourfit.member.model.service.MemberService;
import com.kh.yourfit.member.model.vo.Member;


@SessionAttributes(value = { "member" })
@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;


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
			if (bcryptPasswordEncoder.matches(userPwd, m.getM_Pwd())) {
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
	
	@RequestMapping("/member/Join.do")
	public String memberJoin() {
		return "member/join";
	}
	
	@RequestMapping("/member/memberJoin.do")
	public String memberJoin(Member member, Model model,SessionStatus sessionStatus) {
		
		String plainPassword = member.getM_Pwd();
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		member.setM_Pwd(encryptPassword);
		
		try {
			
			int result = memberService.joinMember(member);
			
			String loc = "/";
			String msg = "";
			
			if (result > 0) {
				msg = "회원 가입 성공";
			} else {
				msg = "회원 가입 실패";
			}
			
			model.addAttribute("loc",loc);
			model.addAttribute("msg",msg);
			
		} catch (Exception e){ 
			
			System.out.println("회원 가입 에러 발생!!");
			
			throw new MemberException(e.getMessage());
			
		}
		if ( !sessionStatus.isComplete() ) {
			sessionStatus.setComplete();
		}
	
		return "common/msg";

	}
	
	@RequestMapping("/member/idChk.do")
	@ResponseBody
	public Map<String, Object> idChk(@RequestParam String userId){
		
		System.out.println(userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.idChk(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map; 
	}
	
	@RequestMapping("/member/nickChk.do")
	@ResponseBody
	public Map<String, Object> nickChk(@RequestParam String userNick){
		
		System.out.println(userNick);
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.nickChk(userNick) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map; 
	} 
	
	@RequestMapping("/member/CheckMail.do")
	@ResponseBody
	public Map<String, Object> SendMail(String mail, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		mailSender.send(message);
		map.put("key", key);
		return map;
	}
}