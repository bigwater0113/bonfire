package com.jhta.bonfire.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.bonfire.service.BMembersService;

@Controller
public class LoginController {
	@Autowired
	private BMembersService service;
	@GetMapping("/login")
	public String loginForm() {
		return ".home.login.login";
	}
	@PostMapping("/login")
	public String login(String id,String pwd,HttpSession session) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		HashMap<String, Object> user=service.isMember(map);
		if(user!=null) {
			session.setAttribute("id", id);
			return "redirect:/";
		}else {
			return ".home.login.login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
