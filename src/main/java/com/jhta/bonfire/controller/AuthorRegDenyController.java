package com.jhta.bonfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.bonfire.service.AuthorRegService;

@Controller
public class AuthorRegDenyController {
	@Autowired AuthorRegService service;
	
	@PostMapping(value = "/author/deny")
	public String delete(Model model, HttpSession session, HttpServletRequest req) {
		String[] params = req.getParameterValues("checkk");
		int n = 0;
		
		for(String i : params) {
			int num = Integer.parseInt(i);
			n = service.delete(num);
		}
		
		if(n>0) {
			return "redirect:/authorRegList";
		} else {
			return ".home.error";
		}
	}
}
