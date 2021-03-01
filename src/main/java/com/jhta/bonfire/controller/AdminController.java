package com.jhta.bonfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/adminpage")
	public String adminpage() {
		return "redirect:/manageMembers_List_All";
	}
}
