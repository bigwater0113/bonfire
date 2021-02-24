package com.jhta.bonfire.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.bonfire.service.DailyBoardService;
import com.jhta.bonfire.vo.DailyBoardVo;
import com.jhta.bonfire.vo.DailyBoard_Dfile_JoinVo;

@Controller
public class DailyDeleteController {
	@Autowired DailyBoardService service;
	
	@GetMapping(value = "/daily/delete")
	public String delete(int num, Model model, HttpSession session) {
		System.out.println("2");
		model.addAttribute("num", num);
		String id = (String)session.getAttribute("id");
		DailyBoardVo vo = service.listOne(num);
		
		if(vo.getId() == "id") {
			service.delete(vo);
			return "redirect:/daily_main";
		} else {
			return ".feed.daily.main";
		}
	}
	
}
