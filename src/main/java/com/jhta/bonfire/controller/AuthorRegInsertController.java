package com.jhta.bonfire.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.bonfire.service.AuthorRegService;
import com.jhta.bonfire.util.CommonUtil;
import com.jhta.bonfire.vo.AuthorRegVo;

@Controller
public class AuthorRegInsertController {
	@Autowired AuthorRegService service;
	@Autowired private ServletContext sc;
	
	public void setService(AuthorRegService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "authorReg/insert", method = RequestMethod.GET)
	public String insertForm(HttpSession session) {
		String id = (String)session.getAttribute("id");
		String idYes = service.exists(id);
		if (service.exists(id) != null) {
			return "redirect:/@"+id;
		} else {
			return ".feed.mypage.authorRegInsert";
		}
	}
	
	@RequestMapping (value = "authorReg/insert", method = RequestMethod.POST)
	public String insert(AuthorRegVo vo, @RequestParam(required = false) String... fileName) {
		vo.setIntro(CommonUtil.changePath(sc, vo.getIntro(), "authorreg", fileName));
		
		int n = service.insert(vo);
		if(n>0) {
			return "redirect:/feedboard_feed_selectAllbyId";
		} else {
			return ".home.error";
		}
	}
}
