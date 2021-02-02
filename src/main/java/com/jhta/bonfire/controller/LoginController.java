package com.jhta.bonfire.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.bonfire.service.BMembersService;

@Controller
public class LoginController {
	@Autowired
	private BMembersService service;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@GetMapping("/login")
	public String loginForm() {
		return ".home.login.login";
	}
	@PostMapping("/login")
	public String login(String id,String pwd,Model model,HttpSession session) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		HashMap<String, Object> user=service.isMember(map);
		if(user!=null) {
			session.setAttribute("id", id);
			return "redirect:/";
		}else {
			model.addAttribute("id",id);
			return ".home.login.login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/searchId")
	public String searchIdform() {
		return ".home.login.search";
	}
	@PostMapping("/searchId")
	public String searchId(String name,String email,Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		String id=service.searchId(map);
		model.addAttribute("id",id);
		return ".home.login.login";
	}
	@PostMapping("/searchPwd")
	public String searchId(String id,String name,String email,Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		String pwd=service.searchPwd(map);
		// 메일 제목, 내용
		String subject = "모닥불 ["+id+"]회원님의 비밀번호";
		String content = "안녕하세요. ["+id+"] 회원님의 비밀번호:"+pwd+" 입니다.";
		
		// 보내는 사람
		String from = "bigwater0113@naver.com";
		
		// 받는 사람
		String[] to = new String[1];
		to[0] = email;
		
		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("id",id);
		return ".home.login.login";
	}
	
}
