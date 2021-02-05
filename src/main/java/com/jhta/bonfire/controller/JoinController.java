package com.jhta.bonfire.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value="/idcheck",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public HashMap<String, String> member(String id) {
		HashMap<String, Object> map=service.idCheck(id);
		HashMap<String, String> code=new HashMap<String, String>();
		if(map!=null) {
			code.put("code", "used");
		}else {
			code.put("code", "available");
		}
		return code;
	}
	
	@GetMapping("/withdraw")
	public String withdraw(HttpServletRequest req,HttpSession session) {
		String id=(String)session.getAttribute("id");
		int n=service.delete(id);
		if(n>0) {
			return "redirect:/logout";
		}else {
			return ".home.login.login";
		}
	}
}
