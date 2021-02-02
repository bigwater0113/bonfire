package com.jhta.bonfire.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.bonfire.service.FeedboardService;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Controller
public class FeedBoardController {
	@Autowired private FeedboardService service;
	
	@GetMapping("/feedboard_main_selectAll")
	public String selectAll(Model model) {
		List<Feedboard_fbjoinVo> list=service.selectAll();
		model.addAttribute("list",list);
		return ".feed.travelersboard.travelersboard_main";
	}
}
