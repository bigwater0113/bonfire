package com.jhta.bonfire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.bonfire.service.QnaBoardService;

@Controller
public class QnaDeleteController {
	@Autowired QnaBoardService service;
	
	@GetMapping(value = "/qna/delete")
	public String deletech(int num,Model model) {
		model.addAttribute("num", num);
		return ".home.qna.pwdch";
	}
	
	@PostMapping(value = "qna/delete")
	public String delete(int num) {
		service.delete(num);
		return "redirect:/qna/main";
	}
}

