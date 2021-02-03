package com.jhta.bonfire.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.bonfire.service.FeedboardService;
import com.jhta.bonfire.util.PageUtil;
import com.jhta.bonfire.vo.Feedboard_fbjoinVo;

@Controller
public class FeedBoardController {
	@Autowired private FeedboardService service;
	
	@RequestMapping("/feedboard_main_selectAll")
	public String selectAll(@RequestParam(value = "page",defaultValue = "1")int page,String field,String keyword,Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		int listCount=service.count(map);
		PageUtil pu=new PageUtil(page, 10, 10, listCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<Feedboard_fbjoinVo> list=service.selectAll(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword",keyword);
		return ".feed.travelersboard.list_main";
	}
	
	@GetMapping("/feedboard_detail")
	public String selectOne(int num,Model model) {
		Feedboard_fbjoinVo vo=service.selectOne(num);
		model.addAttribute("vo",vo);
		return ".home.travelersboard.detail_main";
	}
	
	
	@GetMapping("/feedboard_delete")
	public String delete(Model model) {
		
		return "";
	}
}
