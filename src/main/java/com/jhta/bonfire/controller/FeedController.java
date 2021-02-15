package com.jhta.bonfire.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jhta.bonfire.service.FeedService;
import com.jhta.bonfire.util.CommonUtil;
@Controller
public class FeedController {
	@Autowired FeedService service;
	@GetMapping(value="/@{feedId}")
	public String feed(@PathVariable("feedId") String feedId,HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		System.out.println(feedId);
		HashMap<String, Object> map=service.feedCheck(feedId);
		String feedRole=service.roleCheck(feedId);
		Boolean pageBlock=CommonUtil.pageBlock(id, feedId, feedRole, map);
		if(pageBlock) {
			model.addAttribute("errorMsg","접근 불가");
			return ".home";
		}else {
			model.addAttribute("feedId",feedId);
			model.addAttribute("feedRole",feedRole);
			return ".feed";
		}
	}
}
