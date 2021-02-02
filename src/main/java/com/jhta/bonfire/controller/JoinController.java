package com.jhta.bonfire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.bonfire.service.BMembersService;
import com.jhta.bonfire.vo.BMembersVo;

@Controller
public class JoinController {
	@Autowired
	private BMembersService service;
	
	@GetMapping("/join")
	public String joinform() {
		return ".home.login.join";
	}
	@PostMapping("/join")
	public String join(BMembersVo vo) {
		vo.setEnabled(1);
		vo.setRegdate(null);
		int n=service.insert(vo);
		if(n>0) {
			return ".home.login.login";
		}else {
			return ".home.login.join";
		}
	}
}
