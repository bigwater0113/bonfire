package com.jhta.bonfire.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.bonfire.service.DailyBoardService;
import com.jhta.bonfire.service.MProfileService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.vo.DailyBoardVo;
import com.jhta.bonfire.vo.DailyBoard_Dfile_JoinVo;
import com.jhta.bonfire.vo.MProfileVo;

@Controller
public class DailyBoardUpdateController {
	@Autowired private DailyBoardService service;
	@Autowired private ServletContext sc;
	
	@GetMapping(value = "/daily/update")
	public String updateForm(int num, Model model, HttpServletRequest request) {
		System.out.println(num);
		DailyBoardVo vo = service.listOne(num);
		
		model.addAttribute("vo", vo);
		
		return ".feed.daily.update";
	}
	
	@PostMapping(value = "/daily/update")
	public String update(DailyBoardVo vo, @RequestParam(required = false) String... fileName) {
		vo.setContent(CommonUtil.changePath(sc, vo.getContent(), "dailyboard", fileName));
		
		int n = service.update(vo);
		if(n>0) {
			return "redirect:/daily_main";
		}else {
			return ".feed.daily.update";
		}
	}
}
