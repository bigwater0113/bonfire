package com.jhta.bonfire.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
//	@PostMapping("/login")
//	public String login(String id,String pwd,Model model,HttpSession session) {
//		HashMap<String, String> map=new HashMap<String, String>();
//		map.put("id", id);
//		map.put("pwd", pwd);
//		HashMap<String, Object> user=service.isMember(map);
//		if(user!=null) {
//			session.setAttribute("id", id);
//			return "redirect:/";
//		}else {
//			model.addAttribute("id",id);
//			return ".home.login.login";
//		}
//	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/searchIdPwd")
	public String searchIdform() {
		return ".home.login.search";
	}
	@GetMapping("/searchId")
	@ResponseBody
	public String searchId(String name,String email) {
		System.out.println("name"+name);
		System.out.println("email"+email);
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		String id=service.searchId(map);
		return id;
	}
	@GetMapping("/searchPwd")
	@ResponseBody
	public String searchId(String id,String name,String email,Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		String pwd=service.searchPwd(map);
		if(pwd!=null) {
			String code="";
			for(int i=0;i<6;i++) {
				code+=(int)(Math.random()*9);
			}
			
			// ���� ����, ����
			String subject = "��ں� ["+id+"]ȸ������ �����ڵ�";
			String content = "�ȳ��ϼ���. ["+id+"] ȸ������ ��й�ȣ ������ ���� �����ڵ�� ["+code+"] �Դϴ�.";
			
			// ������ ���
			String from = "bigwater0113@naver.com";
			
			// �޴� ���
			String[] to = new String[1];
			to[0] = email;
			
			try {
				// ���� ���� ���� ��ü��, �̸� �����ִ� Helper ��ü ����
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

				// ���� ������ ä����
				mailHelper.setFrom(from);	// ������ ��� ����
				mailHelper.setTo(to);		// �޴� ��� ����
				mailHelper.setSubject(subject);	// ���� ����
				mailHelper.setText(content);	// ���� ����

				// ���� ����
				mailSender.send(mail);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return code;
		}else {
			return "";
		}
	}
}
