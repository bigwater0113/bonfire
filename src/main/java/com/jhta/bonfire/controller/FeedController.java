package com.jhta.bonfire.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jhta.bonfire.service.FeedService;
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
		if(id==null) {
			model.addAttribute("errorMsg","로그인후 이용가능합니다");
			return ".home";
		}else {
			if(map!=null) {
				if(feedRole.equals("ROLE_MEMBER")) {
					if(id.equals(feedId) || id.equals("admin")) {
						session.setAttribute("feedId",feedId);
						session.setAttribute("feedRole", feedRole);
						return ".feed";
					}else {
						model.addAttribute("errorMsg","일반회원피드입니다. 접근불가.");
						return ".home";
					}
				}else if(feedRole.equals("ROLE_AUTHOR")) {
					session.setAttribute("feedId",feedId);
					session.setAttribute("feedRole", feedRole);
					return ".feed";
				}else {
					model.addAttribute("errorMsg","관리자 피드입니다. 접근불가.");
					return ".home";
				}
			}else {
				model.addAttribute("errorMsg","해당 피드가 존재하지 않습니다.");
				return ".home";
			}
		}
	}
}
