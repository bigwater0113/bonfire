package com.jhta.bonfire.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class FeedController {
	@GetMapping("/feed")
	public String feed() {
		return ".feed";
	}
}
